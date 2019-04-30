class HouseholdsController < ApplicationController
    layout 'logined'

    def index
        @target_month
        if params[:target_date]
            @target_month = Date.strptime(params[:target_date],'%Y%m%d').beginning_of_month
        else
            @target_month = Date.today.beginning_of_month
        end
        
        @households = Household.find_by_month(@target_month).order(event_date: "DESC")
        @household = Household.new
    end

    def create
        @household = Household.new(create_params)
        @household.account_id = login_account_id
        @household.payoff_flg = 0
        if @household.save
            flash[:info] = "支出を登録しました"
            redirect_to households_url
        else
            redirect_to households_url
        end
    end

    private
        def create_params
            params.require(:household).permit(:item_name,:event_date,:amount,:memo)
        end


end

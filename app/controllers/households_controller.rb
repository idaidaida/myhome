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
            redirect_to households_url
        else
            flash[:alert] = "日付/金額/内容は必須です"
            redirect_to households_url
        end
    end

    def show
        @household = Household.find(params[:id])
    end

    def edit
        @household = Household.find(params[:id])
    end

    def update
        @household = login_account_obj.households.find(params[:id])
        if @household && @household.update_attributes(update_params)
            redirect_to household_url(params[:id])
        else
            @household = Household.find(params[:id])
            flash[:alert] = "このレコードを更新する権限がありません"
            render "show"
        end
    end
    private
        def create_params
            params.require(:household).permit(:item_name,:event_date,:amount,:memo)
        end

        def update_params
            params.require(:household).permit(:item_name,:event_date,:amount,:memo)
        end


end

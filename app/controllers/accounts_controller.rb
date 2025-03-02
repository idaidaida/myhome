class AccountsController < ApplicationController
    skip_before_action :redirect_to_loginform_if_not_logined

    def new
        @account = Account.new
    end

    def create
       @account = Account.new(new_params)
       @account.delete_flg = 0
       if @account.save
            flash[:info] = "アカウントを登録しました"
       else
            @account.icon = nil
            render "new"
       end
    end

    def new_params
        params.require(:account).permit(:account_name,:display_name,:password,:password_confirmation,:icon)
    end

end

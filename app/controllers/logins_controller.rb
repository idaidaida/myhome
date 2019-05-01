class LoginsController < ApplicationController
    skip_before_action :redirect_to_loginform_if_not_logined, only: [:new,:create]

    def new
    end

    def create
        # Todo：ログイン処理
        p create_params[:account_name]
        account = Account.find_by(account_name:create_params[:account_name])
        if account && account.authenticate(create_params[:password])
            set_login_session(account.id)
            redirect_to households_url
        else
            p @account
            flash[:alert] = "ユーザー名かパスワードに誤りがあります"
            render "new"
        end
    end

    def destroy
        delete_login_session
        redirect_to root_url
    end

    private
        def create_params
            params.require(:login_form).permit(:account_name,:password)
        end
end

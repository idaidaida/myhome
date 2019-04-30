class Configs::Accounts::SecureinfosController < ApplicationController

    def update
        account = login_account_obj
        if account.update_attributes(update_params)
            flash[:info] = "こうしんしました"
            redirect_to configs_url
        else
            flash[:alert] = "こうしんでけまへん"
            redirect_to configs_url
        end
    end

    private
        def update_params
            params.require(:secureinfo).permit(:password,:password_confirmation)
        end

end

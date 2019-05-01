class Configs::Accounts::BaseinfosController < ApplicationController

    def update
        account = login_account_obj
        if account.update_attributes(update_params)
            flash[:info] = "こうしんしました"
            redirect_to configs_url
        else
            flash[:errors] = account.errors.full_messages
            redirect_to configs_url
        end
    end

    private
        def update_params
            params.require(:account_baseinfo_form).permit(:account_name,:display_name,:icon)
        end
end

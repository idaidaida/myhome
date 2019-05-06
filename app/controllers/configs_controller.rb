class ConfigsController < ApplicationController
    layout "logined"

    def index
        @account_baseinfo_form = AccountBaseinfoForm.new
        @account_baseinfo_form.account_name = login_account_obj.account_name
        @account_baseinfo_form.display_name = login_account_obj.display_name
        @account_baseinfo_form.icon = login_account_obj.icon
        @accounts = Account.all
    end

end

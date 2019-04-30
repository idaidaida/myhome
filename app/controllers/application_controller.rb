class ApplicationController < ActionController::Base
    include LoginsHelper
    before_action :redirect_to_loginform_if_not_logined

    private
        def redirect_to_loginform_if_not_logined
            redirect_to new_login_path if !login?
        end
end

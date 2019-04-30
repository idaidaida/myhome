class CommonsController < ApplicationController
    skip_before_action :redirect_to_loginform_if_not_logined

    def index
    end
    
end

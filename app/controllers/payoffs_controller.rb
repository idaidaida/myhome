class PayoffsController < ApplicationController
    layout "logined"

    def index
        @not_payoffed_households = login_account_obj.households.where.not(payoff_flg:1)
    end

    def update
        login_account_obj.households.where.not(payoff_flg:1).update_all(payoff_flg:1)
        redirect_to payoffs_url
    end

end

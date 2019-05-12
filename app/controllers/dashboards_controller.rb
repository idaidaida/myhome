class DashboardsController < ApplicationController
    layout 'logined'

    def index
       
        @households_of_this_month = Household.find_by_month(Date.today.beginning_of_month)
        @households_of_one_month_ago = Household.find_by_month(Date.today.beginning_of_month.prev_month)
        @households_of_two_month_ago = Household.find_by_month(Date.today.beginning_of_month - 2.months)
        @households_of_three_month_ago = Household.find_by_month(Date.today.beginning_of_month - 3.months)

        @accounts = Account.all
    end

end

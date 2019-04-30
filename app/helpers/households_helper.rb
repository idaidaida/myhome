module HouseholdsHelper

    def sum(recodes)
        sum = 0
        recodes.each do |recode|
            sum = sum + recode.amount
        end
        return sum
    end
end

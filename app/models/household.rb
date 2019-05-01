class Household < ApplicationRecord

    validates :item_name,
        presence: true

    validates :event_date,
        presence: true

    validates :amount,
        presence: true

    belongs_to :account

    def self.find_by_month(target_month_start_date)
        where(event_date: (target_month_start_date)...(target_month_start_date.next_month))
    end
end

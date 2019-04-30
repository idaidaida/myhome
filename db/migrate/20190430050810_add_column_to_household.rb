class AddColumnToHousehold < ActiveRecord::Migration[5.2]
  def change
    add_column :households, :payoff_flg, :integer
  end
end

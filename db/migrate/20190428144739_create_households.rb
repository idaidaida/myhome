class CreateHouseholds < ActiveRecord::Migration[5.2]
  def change
    create_table :households do |t|
      t.string :item_name
      t.timestamp :event_date
      t.integer :amount
      t.references :account
      t.text :memo
      t.timestamps
    end
  end
end

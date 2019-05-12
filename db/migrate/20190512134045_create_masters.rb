class CreateMasters < ActiveRecord::Migration[5.2]
  def change
    create_table :masters do |t|
      t.integer :chart_max_amount
      t.timestamps
    end
  end
end

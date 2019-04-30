class CreateAccounts < ActiveRecord::Migration[5.2]
  def change
    create_table :accounts do |t|
      t.string :account_name
      t.string :display_name
      t.string :password_digest
      t.timestamps
    end
  end
end

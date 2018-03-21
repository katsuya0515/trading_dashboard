class CreateUserAccounts < ActiveRecord::Migration[5.1]
  def change
    create_table :user_accounts do |t|
      t.references :user, foreign_key: true
      t.string :user_name
      t.integer :wallet_amount

      t.timestamps
    end
  end
end

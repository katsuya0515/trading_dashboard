class CreateUserServiceWallets < ActiveRecord::Migration[5.1]
  def change
    create_table :user_service_wallets do |t|
      t.references :user_service, foreign_key: true
      t.integer :wallet_amount
      t.timestamps
    end
  end
end

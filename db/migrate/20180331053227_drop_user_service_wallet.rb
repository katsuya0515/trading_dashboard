class DropUserServiceWallet < ActiveRecord::Migration[5.1]
  def change
    drop_table :user_service_wallets
  end
end

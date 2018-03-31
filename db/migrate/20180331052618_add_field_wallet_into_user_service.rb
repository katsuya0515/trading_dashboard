class AddFieldWalletIntoUserService < ActiveRecord::Migration[5.1]
  def change
    add_column :user_services, :wallet_amount, :integer
  end
end

class DorpUserAccounts < ActiveRecord::Migration[5.1]
  def change
    drop_table :user_accounts
  end
end

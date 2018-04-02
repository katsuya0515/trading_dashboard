class CreateServiceAccounts < ActiveRecord::Migration[5.1]
  def change
    create_table :service_accounts do |t|
      t.references :user_service , foreign_key: true
      t.string :assets_name
      t.float :strike_rate
      t.boolean :status
      t.float :closing_rate
      t.integer :investment
      t.integer :payout
      t.timestamps
    end
  end
end

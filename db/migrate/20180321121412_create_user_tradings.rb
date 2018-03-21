class CreateUserTradings < ActiveRecord::Migration[5.1]
  def change
    create_table :user_tradings do |t|
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

class DorpUserTradings < ActiveRecord::Migration[5.1]
  def change
    drop_table :user_tradings
  end
end

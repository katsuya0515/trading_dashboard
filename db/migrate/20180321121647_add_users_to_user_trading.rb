class AddUsersToUserTrading < ActiveRecord::Migration[5.1]
  def change
    add_reference :user_tradings, :user, foreign_key: true
  end
end

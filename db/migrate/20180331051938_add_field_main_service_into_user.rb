class AddFieldMainServiceIntoUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :main_services, :text
  end
end

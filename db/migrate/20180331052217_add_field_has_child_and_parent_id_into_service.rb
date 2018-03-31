class AddFieldHasChildAndParentIdIntoService < ActiveRecord::Migration[5.1]
  def change
    add_column :services, :has_child, :boolean, default: false
    add_column :services, :parent_id, :integer
  end
end

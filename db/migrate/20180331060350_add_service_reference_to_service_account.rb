class AddServiceReferenceToServiceAccount < ActiveRecord::Migration[5.1]
  def change
    add_reference :service_accounts, :service, foreign_key: true
  end
end

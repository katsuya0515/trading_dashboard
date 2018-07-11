class ServiceAccount < ApplicationRecord
  self.inheritance_column = nil
  belongs_to :user_service
  belongs_to :user
  belongs_to :service
end

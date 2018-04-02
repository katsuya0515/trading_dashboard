class ServiceAccount < ApplicationRecord
  belongs_to :user_service
  belongs_to :user
  belongs_to :service
end

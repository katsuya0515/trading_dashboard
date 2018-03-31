class Service < ApplicationRecord
  has_many :user_services, dependent: :destroy
  has_many :service_accounts, dependent: :destroy
  has_many :childs, class_name: "Service", foreign_key: "parent_id", dependent: :destroy
  belongs_to :parent, class_name: "Service", foreign_key: "parent_id",  optional: true
end

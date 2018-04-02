class UserService < ApplicationRecord
  belongs_to :user
  belongs_to :service

  has_many :service_accounts
end

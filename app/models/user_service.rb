class UserService < ApplicationRecord
  belongs_to :user
  belongs_to :service

  has_many :service_accounts
  has_many :user_service_wallets
end

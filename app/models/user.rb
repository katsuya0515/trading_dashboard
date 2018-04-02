class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :user_services, dependent: :destroy
  has_many :services, through: :user_services
  has_many :service_accounts, through: :user_services

  serialize :main_services, Array

  # has_many :user_tradings, dependent: :destroy

end

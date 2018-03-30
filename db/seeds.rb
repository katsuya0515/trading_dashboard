# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


#create super admin
unless User.find_by_email('user@narola.email')
	User.create(id: 1, first_name:"user", last_name: "narola", username: "user_name", email:"user@narola.email",password:"password")
end


# create Services
services_list_atrributes = [
	{id:1, name: "Arbitrage"},
	{id:2, name: "Bittrex"},
  {id:3, name: "Binance"},
  {id:4, name: "Bitflyer"},
]

services_list_atrributes.each do |attributes|
  Service.where(attributes).first_or_create
end


# create User Services
user_services_list_atrributes = [
	{id:1, user_id:1 , service_id: 1},
	{id:2, user_id:1 , service_id: 2},
  {id:3, user_id:1 , service_id: 3},
  {id:4, user_id:1 , service_id: 4},
]

user_services_list_atrributes.each do |attributes|
  UserService.where(attributes).first_or_create
end

# create Services Account
service_accounts_list_atrributes = [
	{id:1, user_service_id:1 , assets_name: "USD/CAD", strike_rate: 1.33222, status: false, closing_rate: 1.5423, investment: 600, payout: 650},
	{id:2, user_service_id:2 , assets_name: "USD/CAD", strike_rate: 12.33222, status: false, closing_rate: 12.5423, investment: 1700, payout: 1850},
	{id:3, user_service_id:2 , assets_name: "USD/CAD", strike_rate: 2.33222, status: false, closing_rate: 2.5423, investment: 700, payout: 850},
	{id:4, user_service_id:3 , assets_name: "USD/CAD", strike_rate: 13.33222, status: false, closing_rate: 13.5423, investment: 1800, payout: 1950},
  {id:5, user_service_id:3 , assets_name: "USD/CAD", strike_rate: 3.33222, status: false, closing_rate: 3.5423, investment: 800, payout: 950},
  {id:6, user_service_id:4 , assets_name: "USD/CAD", strike_rate: 4.33222, status: false, closing_rate: 4.5423, investment: 900, payout: 1050},
]

service_accounts_list_atrributes.each do |attributes|
  ServiceAccount.where(attributes).first_or_create
end

# create User Services Wallet
user_service_wallet_list_atrributes = [
	{id:1, user_service_id:1 ,wallet_amount: 100},
	{id:2, user_service_id:2 ,wallet_amount: 200},
	{id:3, user_service_id:3 ,wallet_amount: 300},
	{id:4, user_service_id:4 ,wallet_amount: 400},
  {id:5, user_service_id:5 ,wallet_amount: 500},
  {id:6, user_service_id:6 ,wallet_amount: 600},
	{id:7, user_service_id:1 ,wallet_amount: 900},
	{id:8, user_service_id:2 ,wallet_amount: 400},
	{id:9, user_service_id:3 ,wallet_amount: 800},
	{id:10, user_service_id:4 ,wallet_amount: 100},
	{id:11, user_service_id:5 ,wallet_amount: 1300},
	{id:12, user_service_id:6 ,wallet_amount: 1400},
	{id:13, user_service_id:1 ,wallet_amount: 1600},
	{id:14, user_service_id:2 ,wallet_amount: 1500},
	{id:15, user_service_id:3 ,wallet_amount: 400},
	{id:16, user_service_id:4 ,wallet_amount: 300},
	{id:17, user_service_id:5 ,wallet_amount: 200},
	{id:18, user_service_id:6 ,wallet_amount: 100},
]

user_service_wallet_list_atrributes.each do |attributes|
  UserServiceWallet.where(attributes).first_or_create
end

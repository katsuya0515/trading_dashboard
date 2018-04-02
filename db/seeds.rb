# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# create Services
services_list_atrributes = [
	{id:1, name: "Arbitrage", has_child: true },
	{id:2, name: "Cryptocurrency", has_child: true },
	{id:3, name: "Binary Options", has_child: false },
	{id:4, name: "Bittrex", has_child: false, parent_id:1 },
  {id:5, name: "Binance", has_child: false, parent_id: 1 },
  {id:6, name: "Bitflyer", has_child: false, parent_id:2 }
]

services_list_atrributes.each do |attributes|
	Service.where(attributes).first_or_create
end


#create Users
unless User.find_by_email('user1@narola.email')
	User.create(id: 1, first_name:"user1", last_name: "narola1", username: "user_name1", email:"user1@narola.email", password:"password", main_services: [1,2,3])
end
unless User.find_by_email('user2@narola.email')
	User.create(id: 2, first_name:"user2", last_name: "narola2", username: "user_name2", email:"user2@narola.email", password:"password", main_services: [1,3])
end
unless User.find_by_email('user3@narola.email')
	User.create(id: 3, first_name:"user3", last_name: "narola3", username: "user_name3", email:"user3@narola.email", password:"password", main_services: [1,2])
end




# create User Services
user_services_list_atrributes = [
	{id:1, user_id:1 , service_id: 4, wallet_amount: 110},
	{id:2, user_id:1 , service_id: 5, wallet_amount: 120},
  {id:3, user_id:1 , service_id: 6, wallet_amount: 130},
  {id:4, user_id:1 , service_id: 3, wallet_amount: 140},

	{id:5, user_id:2 , service_id: 4, wallet_amount: 210},
	{id:6, user_id:2 , service_id: 5, wallet_amount: 220},
  {id:7, user_id:2 , service_id: 3, wallet_amount: 240},

	{id:8, user_id:3 , service_id: 4, wallet_amount: 310},
	{id:9, user_id:3 , service_id: 5, wallet_amount: 320},
	{id:10, user_id:3 , service_id: 6, wallet_amount: 340},

]

user_services_list_atrributes.each do |attributes|
  UserService.where(attributes).first_or_create
end


# create Services Account
service_accounts_list_atrributes = [
	{id:1, user_service_id:1 , assets_name: "USD/CAD", strike_rate: 1.33222, status: false, closing_rate: 10.5423, investment: 1100, payout: 1150 , user_id:1, service_id: 4},
	{id:2, user_service_id:2 , assets_name: "USD/CAD", strike_rate: 2.33222, status: false, closing_rate: 9.5423, investment: 2200, payout: 2250 , user_id:1, service_id: 5},
	{id:3, user_service_id:3 , assets_name: "USD/CAD", strike_rate: 3.33222, status: true, closing_rate: 8.5423, investment: 3300, payout: 3350 , user_id:1, service_id: 6},
	{id:4, user_service_id:4 , assets_name: "USD/CAD", strike_rate: 4.33222, status: false, closing_rate: 7.5423, investment: 4800, payout: 4450 , user_id:1, service_id: 3},
  {id:5, user_service_id:5 , assets_name: "USD/CAD", strike_rate: 5.33222, status: false, closing_rate: 6.5423, investment: 5800, payout: 5550, user_id:2, service_id: 4},
	{id:6, user_service_id:6 , assets_name: "USD/CAD", strike_rate: 6.33222, status: false, closing_rate: 5.5423, investment: 6900, payout: 66050, user_id:2, service_id: 5},
	{id:7, user_service_id:7 , assets_name: "USD/CAD", strike_rate: 7.33222, status: false, closing_rate: 4.5423, investment: 7900, payout: 7750, user_id:2, service_id: 3},
	{id:8, user_service_id:8 , assets_name: "USD/CAD", strike_rate: 8.33222, status: false, closing_rate: 3.5423, investment: 8900, payout: 8850 , user_id:3, service_id: 4},
	{id:9, user_service_id:9 , assets_name: "USD/CAD", strike_rate: 9.33222, status: true, closing_rate: 2.5423, investment: 9900, payout: 9950 , user_id:3, service_id: 5},
  {id:10, user_service_id:10 , assets_name: "USD/CAD", strike_rate: 10.33222, status: false, closing_rate: 1.5423, investment: 10900, payout: 10950 , user_id:3, service_id: 6},
]

service_accounts_list_atrributes.each do |attributes|
  ServiceAccount.where(attributes).first_or_create
end

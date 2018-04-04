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
	{ id: 1, user_service_id: 1, assets_name: "USD/CAD", strike_rate: "1.23942", status: false, closing_rate: "1.23932", investment: "5000", payout: "6500", user_id: 1, service_id: 4 },
	{ id: 2, user_service_id: 2, assets_name: "USD/CAD", strike_rate: "1.23940", status: false, closing_rate: "1.23932", investment: "4000", payout: "6900", user_id: 1, service_id: 5 },
	{ id: 3, user_service_id: 3, assets_name: "USD/CAD", strike_rate: "1.23935", status: true, closing_rate: "1.23932", investment: "4500", payout: "7000", user_id: 1, service_id: 6 },
	{ id: 4, user_service_id: 4, assets_name: "USD/CAD", strike_rate: "1.23948", status: false, closing_rate: "1.23932", investment: "4800", payout: "8000", user_id: 1, service_id: 3 },
	{ id: 5, user_service_id: 5, assets_name: "USD/CHF", strike_rate: "0.95601", status: false, closing_rate: "0.95618", investment: "7500", payout: "9900", user_id: 2, service_id: 4 },
	{ id: 6, user_service_id: 6, assets_name: "USD/CHF", strike_rate: "0.95601", status: false, closing_rate: "0.95618", investment: "6000", payout: "4900", user_id: 2, service_id: 5 },
	{ id: 7, user_service_id: 7, assets_name: "NZD/USD", strike_rate: "0.72021", status: true, closing_rate: "0.71975", investment: "4000", payout: "5900", user_id: 2, service_id: 3 },
	{ id: 8, user_service_id: 8, assets_name: "USD/CAD", strike_rate: "1.21305", status: false, closing_rate: "1.21186", investment: "1000", payout: "6900", user_id: 3, service_id: 4 },
	{ id: 9, user_service_id: 9, assets_name: "AUD/USD", strike_rate: "0.80808", status: false, closing_rate: "0.80774", investment: "2300", payout: "7900", user_id: 3, service_id: 5 },
	{ id: 10, user_service_id: 10, assets_name: "AUD/USD", strike_rate: "0.80769", status: true, closing_rate: "0.80774", investment: "2400", payout: "7400", user_id: 3, service_id: 6 },
	{ id: 11, user_service_id: 1, assets_name: "AUD/USD", strike_rate: "0.80752", status: false, closing_rate: "0.80774", investment: "2500", payout: "8400", user_id: 1, service_id: 4 },
	{ id: 12, user_service_id: 2, assets_name: "AUD/USD", strike_rate: "0.80765", status: false, closing_rate: "0.80774", investment: "3600", payout: "6400", user_id: 1, service_id: 5 },
	{ id: 13, user_service_id: 3, assets_name: "NZD/USD", strike_rate: "0.72760", status: true, closing_rate: "0.72720", investment: "1700", payout: "2400", user_id: 1, service_id: 6 },
	{ id: 14, user_service_id: 4, assets_name: "NZD/USD", strike_rate: "0.72766", status: false, closing_rate: "0.72720", investment: "1800", payout: "3400", user_id: 1, service_id: 3 },
	{ id: 15, user_service_id: 5, assets_name: "NZD/USD", strike_rate: "0.72766", status: false, closing_rate: "0.72720", investment: "3600", payout: "4900", user_id: 2, service_id: 4 },
	{ id: 16, user_service_id: 6, assets_name: "USD/CAD", strike_rate: "1.21050", status: true, closing_rate: "1.21045", investment: "3100", payout: "4400", user_id: 2, service_id: 5 },
	{ id: 17, user_service_id: 7, assets_name: "EUR/GBP", strike_rate: "0.90730", status: false, closing_rate: "0.90732", investment: "2100", payout: "4900", user_id: 2, service_id: 3 },
	{ id: 18, user_service_id: 8, assets_name: "EUR/GBP", strike_rate: "0.90724", status: false, closing_rate: "0.90732", investment: "2200", payout: "4000", user_id: 3, service_id: 4 },
	{ id: 19, user_service_id: 9, assets_name: "NZD/USD", strike_rate: "0.72320", status: true, closing_rate: "0.72325", investment: "4400", payout: "5400", user_id: 3, service_id: 5 },
	{ id: 20, user_service_id: 10, assets_name: "NZD/USD", strike_rate: "0.72325", status: false, closing_rate: "0.72325", investment: "4400", payout: "5900", user_id: 3, service_id: 6 }
]

service_accounts_list_atrributes.each do |attributes|
  ServiceAccount.where(attributes).first_or_create
end

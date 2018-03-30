# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


#create super admin
unless User.find_by_email('user@narola.email')
	User.create(email:"user@narola.email",password:"password")
end


# create Services
service_list_atrributes = [
	{id:1, name: "Arbitrage"},
	{id:2, name: "Bittrex"},
  {id:3, name: "Binance"},
  {id:4, name: "Bitflyer"},
]

service_list_atrributes.each do |attributes|
  Service.where(attributes).first_or_create
end



# UserTrading.create(assets_name: "USD/CAD", strike_rate: 1.33222, status: nil, closing_rate: 1.5423, investment: 600, payout: 750, user_id: 1)
# UserTrading.create(assets_name: "USD/CAD", strike_rate: 1.23222, status: nil, closing_rate: 1.4423, investment: 500, payout: 650, user_id: 1)
# UserAccount.create(user_id: 1, user_name: "User1", wallet_amount: 200)
# UserAccount.create(user_id: 1, user_name: "User1", wallet_amount: 400)

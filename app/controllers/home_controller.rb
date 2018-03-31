class HomeController < ApplicationController
  def index
    @main_services = current_user.main_services

    @services = []

    @main_services.each do |service|
      @services << Service.find(service)
    end

    p "========================"
    p @services 
    # @service_accounts = current_user.service_accounts
    # @user_service_wallets = current_user.user_service_wallets
    #
    # @users_trading_data = current_user.service_accounts.group_by {|t| t.created_at.beginning_of_month.strftime("%b %Y") }
    # category = []
    # @users_trading_data.keys.each do |month|
    #   category << {"label": month}
    # end
    # data = []
    # @users_trading_data.values.each do |values|
    #   data << {"value": values.pluck(:investment, :payout).map{|revenue| (revenue[0]-revenue[1]).abs}.sum}
    # end
    #
    # betting_count = []
    # @users_trading_data.values.each do |values|
    #   betting_count << {"value": values.count}
    # end
    #
    # @chart = Fusioncharts::Chart.new({
    #   width: "600",
    #   height: "400",
    #   type: "mscombidy2d",
    #   renderAt: "chart-container",
    #   dataSource: {
    #     chart: {
    #       caption: "Comparison of Revenue",
    #       # subCaption: "Harry's SuperMart",
    #       xAxisname: "Time",
    #       yAxisName: "Amount ($)",
    #       numberPrefix: "$",
    #       theme: "fint",
    #       exportEnabled: "1",
    #     },
    #     categories: [{
    #       "category": category
    #     }],
    #     dataset: [{
    #       "seriesName": "Time",
    #       "showValues": "1",
    #       "data": data
    #     },
    #     {
    #       "seriesName": "Betting count",
    #       "parentYAxis": "S",
    #       "renderAs": "line",
    #       "data": betting_count
    #     }]
    #   }
    # })

  end
end

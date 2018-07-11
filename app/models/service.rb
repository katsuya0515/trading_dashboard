class Service < ApplicationRecord
  has_many :user_services, dependent: :destroy
  has_many :service_accounts, dependent: :destroy
  has_many :childs, class_name: "Service", foreign_key: "parent_id", dependent: :destroy
  belongs_to :parent, class_name: "Service", foreign_key: "parent_id",  optional: true

  def chart(user_id)
    category = []
    data = []
    data_hash = {}
    betting_count = []
    betting_count_hash = {}

    if self.childs.present?
      self.childs.each do |child|
        @service_accounts = child.service_accounts.where(user_id: user_id).group_by {|t| t.created_at.beginning_of_month.strftime("%b %Y") }

        @service_accounts.each do |k,v|
          data_hash[k] = []
          betting_count_hash[k] = []
        end

        @service_accounts.each do |key, values|
          data_hash[key] << {"value": values.pluck(:investment, :payout).map{|revenue| (revenue[0]-revenue[1]).abs}.sum}
        end

        @service_accounts.each do |key, values|
          betting_count_hash[key] << {"value": values.count}
        end

        data = data_hash.values
        betting_count = betting_count_hash.values

      end
    else
      @service_accounts = self.service_accounts.where(user_id: user_id).group_by {|t| t.created_at.beginning_of_month.strftime("%b %Y") }

      @service_accounts.each do |k,v|
        data_hash[k] = []
        betting_count_hash[k] = []
      end

      @service_accounts.each do |key, values|
        data_hash[key] << {"value": values.pluck(:investment, :payout).map{|revenue| (revenue[0]-revenue[1]).abs}.sum}
      end

      @service_accounts.each do |key, values|
        betting_count_hash[key] << {"value": values.count}
      end
    end

    @service_accounts.keys.each do |month|
      category << {"label": month}
    end

    @chart = Fusioncharts::Chart.new({
      width: "100%",
      height: "400",
      type: "mscombidy2d",
      renderAt: "chart-container-#{self.name.parameterize}",
      dataSource: {
        chart: {
          caption: "Comparison of Revenue",
          # subCaption: "Harry's SuperMart",
          xAxisname: "Time",
          yAxisName: "Amount ($)",
          numberPrefix: "$",
          theme: "fint",
          exportEnabled: "1",
        },
        categories: [{
          "category": category
        }],
        dataset: [{
          "seriesName": "Time",
          "showValues": "1",
          "data": data
        },
        {
          "seriesName": "Betting count",
          "parentYAxis": "S",
          "renderAs": "line",
          "data": betting_count
        }]
      }
    })

    @chart.render()
  end
end

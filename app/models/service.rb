class Service < ApplicationRecord
  has_many :user_services, dependent: :destroy
  has_many :service_accounts, dependent: :destroy
  has_many :childs, class_name: "Service", foreign_key: "parent_id", dependent: :destroy
  belongs_to :parent, class_name: "Service", foreign_key: "parent_id",  optional: true

  def chart(user_id)
    category = []
    data = []
    betting_count = []

    if self.childs.present?
      self.childs.each do |child|
        @service_accounts = child.service_accounts.where(user_id: user_id).group_by {|t| t.created_at.beginning_of_month.strftime("%b %Y") }

        @service_accounts.values.each do |values|
          data << {"value": values.pluck(:investment, :payout).map{|revenue| (revenue[0]-revenue[1]).abs}.sum}
        end

        @service_accounts.values.each do |values|
          betting_count << {"value": values.count}
        end

        sumData = 0
        data.each do |data|
          sumData += data[:value]
        end
        data = [{'value': sumData }]

        sumBetting = 0
        betting_count.each do |data|
          sumBetting += data[:value]
        end
        betting_count = [{'value': sumBetting }]

      end
    else
      @service_accounts = self.service_accounts.where(user_id: user_id).group_by {|t| t.created_at.beginning_of_month.strftime("%b %Y") }

      @service_accounts.values.each do |values|
        data << {"value": values.pluck(:investment, :payout).map{|revenue| (revenue[0]-revenue[1]).abs}.sum}
      end

      @service_accounts.values.each do |values|
        betting_count << {"value": values.count}
      end
    end

    @service_accounts.keys.each do |month|
      category << {"label": month}
    end

    @chart = Fusioncharts::Chart.new({
      width: "600",
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

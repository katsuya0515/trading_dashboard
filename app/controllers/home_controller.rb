class HomeController < ApplicationController
  def index
    @main_services = current_user.main_services

    @services = []

    @main_services.each do |service|
      @services << Service.find(service)
    end
  end
end

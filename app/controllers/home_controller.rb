class HomeController < ApplicationController

  def index
    @user_tradings = current_user.user_tradings
    @user_accounts = current_user.user_accounts
  end
end

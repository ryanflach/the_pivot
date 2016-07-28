class OrdersController < ApplicationController
  # before_action :check_regular_user
  def index
    #change to current_user.orders
    @orders = User.first.orders
  end
end

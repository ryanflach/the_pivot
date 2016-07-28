class OrdersController < ApplicationController
  def index
    if current_user
      @orders = current_user.orders
    else
      flash[:danger] = "Please login to view your orders"
      redirect_to login_path
    end
  end
end

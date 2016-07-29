class OrdersController < ApplicationController
  before_action :verify_logged_in, only: [:index]

  def index
    @orders = current_user.orders
  end

  def create
    save_order
    session[:cart] = nil
    flash[:success] = "Order was successfully placed"
    redirect_to orders_path
  end

  def show
    @order = Order.find(params[:id])
  end

  private

  def save_order
    order = Order.create(user: current_user)
    @cart.all_items.each do |item|
      order_item = Item.find(item.id)
      order.items << order_item
      OrderItem.find_by(order: order, item: order_item).update(quantity: item.quantity)
    end
  end

end

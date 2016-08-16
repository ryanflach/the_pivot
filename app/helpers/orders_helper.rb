module OrdersHelper
  def verify_user
    unless current_user == @order.user
      flash[:danger] = "You do not have the proper permissions to view that page"
      redirect_to dashboard_path
    end
  end

  def save_order
    @order = Order.create(user: current_user)
    @cart.all_events.each do |event|
      order_event = Event.find(event.id)
      @order.events << order_event
      OrderEvent.find_by(order: @order, event: order_event).update(quantity: event.quantity)
    end
  end

  def set_order
    @order = Order.find(params[:id])
  end
end

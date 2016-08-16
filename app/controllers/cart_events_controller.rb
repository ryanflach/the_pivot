class CartEventsController < ApplicationController
  include ActionView::Helpers::TextHelper
  before_action :set_event, only: [:update, :destroy]

  def create
    event = Event.find(params[:event_id])
    @cart.add_event(event.id)
    session[:cart] = @cart.contents
    flash[:success] = "#{event.title} added to cart successfully. Cart now contains #{pluralize(@cart.total_events, 'event')}."
    redirect_to request.referrer
  end

  def update
    @cart.contents[params[:id].to_s] = params[:event][:quantity].to_i
    flash[:success] = "Quantity of #{@event.title} updated to #{params[:event][:quantity]}."
    redirect_to cart_index_path
  end

  def destroy
    @cart.contents.delete(params[:id])
    flash[:success] = "Successfully removed #{view_context.link_to(@event.title, event_path(@event))} from your cart."
    redirect_to cart_index_path
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end
end

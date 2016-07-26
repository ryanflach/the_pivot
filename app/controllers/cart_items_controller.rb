class CartItemsController < ApplicationController
  def create
    item = Item.find(params[:item_id])
    @cart.add_item(item.id)
    session[:cart] = @cart.contents
    flash[:success] = "#{item.title} added to cart successfully. Cart now contains #{@cart.total_item} items."
    redirect_to cart_index_path
  end
end

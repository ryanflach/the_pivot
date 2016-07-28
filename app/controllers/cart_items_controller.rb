class CartItemsController < ApplicationController
  def create
    item = Item.find(params[:item_id])
    @cart.add_item(item.id)
    session[:cart] = @cart.contents
    flash[:success] = "#{item.title} added to cart successfully. Cart now contains #{@cart.total_items} items."
    redirect_to cart_index_path
  end

  def update
    @cart.contents[params[:id].to_s] = params[:item][:quantity].to_i
    redirect_to cart_index_path
  end

  def destroy
    item = Item.find(params[:id].to_i)
    @cart.contents.delete(params[:id])
    flash[:success] = "Successfully removed #{view_context.link_to(item.title, item_path(item))} from your cart."
    redirect_to cart_index_path
  end
end

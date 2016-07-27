class CartController < ApplicationController
  def index
    @items = @cart.all_items
  end
end

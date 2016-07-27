class CategoriesController < ApplicationController

  def show
    @category = Category.find_by(title: params[:title])
    if @category.nil?
      redirect_to items_path
    else
      @items = @category.items
    end
  end
end

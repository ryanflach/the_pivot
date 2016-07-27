class CategoriesController < ApplicationController

  def show
    @category = Category.find_by(title: params[:title])
    @items = @category.items
    if @category.nil?
      redirect_to items_path
    end
  end
end

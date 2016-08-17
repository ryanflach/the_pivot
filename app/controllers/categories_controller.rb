class CategoriesController < ApplicationController

  def show
    @category = Category.find_by(slug: params[:title])
    if @category.nil?
      redirect_to events_path
    else
      @events = @category.events.where(status: 0)
    end
  end
end

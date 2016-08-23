class VenuesController < ApplicationController
  def index
    @venues = Venue.where(status: 0)
  end

  def show
    @venue = Venue.find_by(slug: params[:name])
    if @venue.nil? || @venue.offline?
      render file: '/public/404', status => 404, :layout => true
    end
  end
end

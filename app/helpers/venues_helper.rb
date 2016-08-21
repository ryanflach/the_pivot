module VenuesHelper
  def this_venues_admin?
    Venue.find_by_slug(params[:name]).admin == current_user
  end
end

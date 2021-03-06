class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user,
                :categories,
                :current_admins_venue,
                :render_404,
                :registered_customer,
                :venue_admin

  before_action :set_cart,
                :authorize!

  def set_cart
    @cart = Cart.new(session[:cart])
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def authorize!
    unless authorized?
      unless current_user
        flash.now[:danger] = "Not expecting this message? Try \
          #{view_context.link_to('logging in', login_path)}."
      end
      render_404
    end
  end

  def current_admins_venue
    if current_user
      Venue.find_by(admin: current_user) if current_user.venue_admin?
    end
  end

  def categories
    @categories = Category.all
  end

  def render_404
    render file: '/public/404', status => 404, layout: true
  end

  def registered_customer
    Role.find_by_name("registered_customer")
  end

  def venue_admin
    Role.find_by_name("venue_admin")
  end

  private

  def authorized?
    current_permission.allow?(params[:controller], params[:action])
  end

  def current_permission
    @current_permission ||= PermissionsService.new(current_user)
  end
end

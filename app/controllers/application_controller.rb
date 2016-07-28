class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user

  before_action :set_cart

  def set_cart
    @cart = Cart.new(session[:cart])
  end

  def current_user
    true
  end
end

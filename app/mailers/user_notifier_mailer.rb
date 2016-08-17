class UserNotifierMailer < ApplicationMailer
  default from: 'nosebleedtix@gmail.com'

  def send_signup_email(user)
    @user = user
    mail(
      to: @user.email,
      subject: "Welcome to Nosebleed Tickets!"
      )
  end

  def send_confirmation_email(user, order)
    @user = user
    @order = order
    mail(
      to: @user.email,
      subject: "Thank you for your order - Order ##{@order.id}"
    )
  end
end

require 'rails_helper'

RSpec.feature "User can view past orders" do
  scenario "when they go to their Order History page" do
    user = create(:user)
    create(:event)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit events_path
    click_on "Add to Cart"
    click_on "Add to Cart"

    visit cart_index_path
    click_on "Checkout"

    order = Order.first

    within("#order-#{order.id}") do
      expect(page).to have_content(order.date)
      expect(page).to have_content(order.total_tickets)
      expect(page).to have_content(order.total)
    end
  end
end


# As a logged-in customer with no existing orders:
#
# When I visit my dashboard
# I expect to see 0 under Orders Placed
# And I expect to not see a button to view my orders
# As a logged-in customer with existing orders:
#
# When I visit my dashboard
# I expect to see the number of my orders placed
# And when I click on View Order History (or whatever this button has been called)
# I expect to be on my orders index path
# And I expect to see the order #, date placed, # of tickets, and total price for each order
# And when I click on Order Details for the first order
# I expect to be on the show page for that order
# And I expect to see the details for that order

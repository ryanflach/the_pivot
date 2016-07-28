require 'rails_helper'

RSpec.feature "User can view past orders" do
  scenario "when they go to their Order History page" do
    order = create(:order)
    item = Item.first
    user = User.first
    user.orders.first.items << item
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    visit orders_path

    within("#order-#{order.id}") do
      expect(page).to have_content(order.items.first.title)
      expect(page).to have_content(order.items.first.created_at.strftime("%m/%d/%Y"))
      expect(page).to have_content("2")
      expect(page).to have_content(order.sub_total(order.items.first))
    end
  end
end

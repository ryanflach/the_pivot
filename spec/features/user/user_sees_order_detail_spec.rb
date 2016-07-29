require 'rails_helper'

RSpec.feature "User sees one order's detail" do
  scenario "when they visit order show page" do
    create(:order)
    item = Item.first
    user = User.first
    order = user.orders.first
    order.items << item
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit orders_path

    within("#order-#{order.id}") do
      click_on "Order Details"
    end

    expect(current_path).to eq(order_path(order))

    expect(page).to have_content(order.items.count)
    expect(page).to have_content(order.total)
    expect(page).to have_content(order.time_updated)
    expect(page).to have_content(order.status)
    expect(page).to have_content(order.date)
    expect(page).to have_content(order.sub_total(item))
    expect(page).to have_content(order.item_count(item))
  end
end

require 'rails_helper'

RSpec.feature "Item can be sold out" do
  scenario "logged-in user visits the show page of a sold-out item" do
    # As a user if I visit an item page and that item has been sold-out
    user = create(:user)
    item = create(:sold_out_item)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    # Then I should still be able to access the item page
    visit item_path(item)
    # And I should not be able to add the item to their cart
    expect(page).not_to have_button("Add to Cart")
    # And I should see in place of the "Add to Cart" button or link - "Item SOLD"
    expect(page).to have_content("SOLD OUT")
  end

  scenario "visitor views the page to view all items" do
    available_item = create(:item)
    sold_out_item = create(:sold_out_item)

    visit items_path

    expect(page).to have_content(available_item.title)
    expect(page).to_not have_content(sold_out_item.title)
  end

  scenario "visitor views the category page for the sold-out item" do
    sold_out_item = create(:sold_out_item)
    category = sold_out_item.category

    visit category_path(category)

    expect(page).not_to have_content(sold_out_item.title)
  end
end

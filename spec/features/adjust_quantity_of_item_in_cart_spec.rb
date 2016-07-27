require 'rails_helper'

RSpec.feature "Adjust the quantity of an item in the cart" do
  scenario "visitor with item in cart visits the cart page" do
    # Background: My cart has an item in it
    item = create(:item)
    visit items_path
    within("#item-#{item.id}") do
      click_on "Add to Cart"
    end
    # As a visitor
    # When I visit "/cart"
    visit cart_index_path
    # Then I should see my item with a quantity of 1
    within("#item-#{item.id}") do
      expect(page).to have_content(item.title)
      expect(page).to have_content(1)
    end
    # And when I increase the quantity
    within("#item-#{item.id}") do
      select(3, from: 'Quantity')
    end
    click_on "Update Cart"
    # Then my current page should be '/cart'
    expect(current_path).to eq(cart_index_path)
    # And that item's quantity should reflect the increase
    # And the subtotal for that item should increase
    within("#item-#{item.id}") do
      expect(page).to have_content(3)
      expect(page).to have_content(item.price * 3)
    end
    # And the total for the cart should match that increase
    expect(page).to have_content("Total: #{item.price * 3}")
    # And when I decrease the quantity
    within("#item-#{item.id}") do
      select(1, from: 'Quantity')
    end
    click_on "Update Cart"
    # Then my current page should be '/cart'
    expect(current_path).to eq(cart_index_path)
    # And that item's quantity should reflect the decrease
    # And the subtotal for that item should decrease
    within("#item-#{item.id}") do
      expect(page).to have_content(1)
      expect(page).to have_content(item.price)
    end
    # And the total for the cart should match that decrease
    expect(page).to have_content("Total: #{item.price}")
  end
end

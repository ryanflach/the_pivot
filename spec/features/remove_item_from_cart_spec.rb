require 'rails_helper'

RSpec.feature "Remove an item from the cart" do
  xscenario "a visitor visits the cart path" do
    # Background: My cart has an item in it
    cart = Cart.new(nil)
    item = create(:item)
    cart.add_item(item.id)

    # As a visitor
    # When I visit "/cart"
    visit cart_index_path

    # And I click link "Remove"
    within("#item-#{item.id}") do
      click_on "Remove"
    end
    # Then my current page should be "/cart"
    expect(current_path).to eq(cart_index_path)
    # And I should see a message styled in green
    expect(page).to have_content("Successfully removed #{item.title} from your cart. Undo.")
    # And the message should say "Successfully removed SOME_ITEM from your cart."

    # And the title "SOME_ITEM" should be a link to that item in case the user wants to add it back
    expect(page).to have_link("Undo", href: cart_items_path, method: :post)
    # And I should not see the item listed in cart
    within("tbody") do
      expect(page).not_to have_content("#{item.title}")
    end
  end
end

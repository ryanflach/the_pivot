require 'rails_helper'

RSpec.feature 'Add item to cart' do
  xscenario "a visitor views an item's page" do
    item = create(:item)

    visit item_path(item)

    expect(page).to have_button('Add to Cart', href: carts_path)

    click_on 'Add to Cart'

    expect(current_path).to eq(cart_index_path)

    within('.tbody') do
      expect(page).to have_content(item.title)
      expect(page).to have_content(item.description)
      expect(page).to have_content(item.price)
    end
    expect(page).to have_content("Total: #{@cart.total_cost}")
  end
end

require 'rails_helper'

RSpec.feature 'Add event to cart' do
  scenario "a visitor views an event's page" do
    event = create(:event)

    visit events_path

    within("#event-#{event.id}") do
      expect(page).to have_button('Add to Cart')
      click_on 'Add to Cart'
    end

    expect(current_path).to eq(current_path)

    visit cart_index_path

    within('tbody') do
      expect(page).to have_content(event.title)
      expect(page).to have_content(event.description)
      expect(page).to have_content(event.price)
    end
    expect(page).to have_content("Total: $199.99")
  end
end

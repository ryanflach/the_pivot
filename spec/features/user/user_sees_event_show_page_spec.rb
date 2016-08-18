require 'rails_helper'

RSpec.feature "User sees event show page" do
  scenario "when they visit path for specific event" do
    event = create(:event)

    visit event_path(event.venue, event)

    expect(page).to have_css("img[src*=\"#{event.image_path}\"]")
    expect(page).to have_content(event.title)
    expect(page).to have_content(event.venue_name)
    expect(page).to have_content(event.description)
    expect(page).to have_content(event.price)
    expect(page).to have_button("Add to Cart")
  end
end

require 'rails_helper'

RSpec.feature "All sold-out events can be viewed" do
  scenario "a visitor views the root path" do
    events = create_list(:sold_out_event, 2)

    visit root_path

    click_on "Best Of"

    expect(current_path).to eq(unavailable_events_path)

    expect(page).to have_content(events.first.title)
    expect(page).to have_content(events.last.title)
  end
end

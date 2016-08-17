require 'rails_helper'

RSpec.feature "User can see all events in a category" do
  scenario "they view page for a specific category and see all events" do
    venue = create(:venue)

    cat1 = Category.create(title: "Kitchen")
    cat1.events.create(title: "Knife", description: "Steel with wood handle", price: 100, image_path: "www", venue_id: venue.id)
    cat1.events.create(title: "Bowl", description: "Steel", price: 50, image_path: "www", venue: venue)

    cat2 = Category.create(title: "Outdoor Supplies")
    cat2.events.create(title: "Shovel", description: "Garden Shovel", price: 20.00, image_path: "www", venue: venue)
    cat2.events.create(title: "Saw", description: "Circular", price: 400, image_path: "www", venue: venue)

    visit category_path(cat2.title)

    expect(page).to have_content "Shovel"
    expect(page).to have_content "Saw"

    visit category_path(cat1.title)

    expect(page).to have_content "Knife"
    expect(page).to have_content "Bowl"

    visit category_path("outdoor-supplies")

    expect(page).to have_content "Outdoor Supplies"
    expect(page).to have_content "Shovel"
    expect(page).to have_content "Saw"
  end
end

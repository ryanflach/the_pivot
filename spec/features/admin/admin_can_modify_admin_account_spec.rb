require 'rails_helper'

RSpec.feature "Logged in admin can alter admin account" do
  scenario "admin can change their account" do
    admin = create(:admin)

    visit login_path

    fill_in "Username", with: admin.username
    fill_in "Password", with: 'password'
    click_button "Login"

    expect(current_path).to eq(admin_dashboard_index_path)
    expect(page).to have_content "Admin Dashboard"
    click_on "Edit My Profile"
    expect(current_path).to eq(edit_user_path(admin))

    fill_in "Username", with: "ADMIN"
    fill_in "Email", with: admin.email
    fill_in "Password", with: 'password'
    click_button "Update Account"

    expect(page).to have_content "Logged in as ADMIN"
    expect(current_path).to eq(admin_dashboard_index_path)
  end
end

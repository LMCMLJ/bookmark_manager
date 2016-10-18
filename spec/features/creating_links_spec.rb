require 'spec_helper'
# DatabaseCleaner.clean
p "Hello 1"

feature "Save a website" do
  scenario "Add site address and title" do
    visit "/add"
    fill_in("url", with: "yahoo.com")
    fill_in("title", with: "Old, never used search engine")
    click_button "Add"
    expect(page).to have_link('Old, never used search engine')
  end
end

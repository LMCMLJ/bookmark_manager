require 'spec_helper'

feature "Quickly go to web sites I regularly visit" do
  scenario "Saved links are shown on homepage" do
    Link.create(url: "google.com")
    visit "/"
    expect(page).to have_link('Bookmark 1')
  end
end

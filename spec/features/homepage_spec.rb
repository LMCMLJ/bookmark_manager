require 'spec_helper'
# DatabaseCleaner.clean
p "Hello 2"

feature "Quickly go to web sites I regularly visit" do
  scenario "Saved links are shown on homepage" do
    Link.create(url: "boogle.com", title: "Boogle")
    visit "/"
    expect(page).to have_link('Boogle')
  end
end

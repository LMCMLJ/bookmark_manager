require 'spec_helper'

feature 'search tags' do
  before :each do
    add_link
    add_tag
    submit_form
  end

  scenario 'can search the tagged links' do
    visit '/tags/table%20tennis'
    expect(page).to have_text('Old')
  end
end

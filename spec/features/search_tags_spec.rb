require 'spec_helper'

feature 'search tags' do
  before :each do
    add_link
    add_tag
    submit_form
  end

  scenario 'can search the tagged links' do
    fill_in('filter_by_tags', with: '#table tennis')
    expect(page).to have_text('Old')
  end
end

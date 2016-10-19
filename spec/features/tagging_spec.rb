require 'spec_helper'

feature 'tagging links' do

  before :each do
    add_link
  end

  scenario 'form is still submitted if no tags provided' do
    submit_form
    expect(page.status_code).to be(200)
  end

  context 'form filled out' do

    before :each do
      add_tag
      submit_form
    end

    scenario 'tags appear on bookmark page' do
      visit '/bookmarks'
      expect(page).to have_text('beer', 'cake', 'table tennis')
    end
  end
end

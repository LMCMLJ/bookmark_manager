def add_link
  visit "/add"
  fill_in("url", with: "yahoo.com")
  fill_in("title", with: "Old, never used search engine")
end

def add_tag
  fill_in("tags", with: 'table tennis')
end

def submit_form
  click_button "Add"
end

require 'spec_helper'

feature 'Creating Projects' do
  scenario 'Creating a new project' do
  	visit "/"
  	click_link "New Project"
  	fill_in "name", with: "TextMate 2"
  	fill_in "description", with: "a text editor for OS X"
  	click_button "Create a new project"

  	expect(page).to have_content('project has been created')

  end


end

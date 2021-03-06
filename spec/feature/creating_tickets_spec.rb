require "spec_helper"

feature 'creating tickets' do
  before do
    FactoryGirl.create(:project, name: "Internet Explorer")
    visit "/"
    click_link "Internet Explorer"
    click_link "New Ticket"
  end

  scenario 'creating Ticket' do
    fill_in "Title", with: "Non-standards compliance"
    fill_in "Description", with: "My pages are ugly!"
    click_button "Create Ticket"

    expect(page).to have_content("Ticket has been created.")
  end
  scenario 'creating ticket with invalid attr' do

    click_button "Create Ticket"

    expect(page).to have_content("Ticket has not been created.")
    expect(page).to have_content("Title can't be blank")
    expect(page).to have_content("Description can't be blank")
  end

  scenario 'ticket description must be longer than 10 chars' do
    fill_in "Title", with: "Non-standards compliance"
    fill_in "Description", with: "it sucks"
    click_button "Create Ticket"

    expect(page).to have_content("Ticket has not been created.")
    expect(page).to have_content("Description is too short")
  end
end

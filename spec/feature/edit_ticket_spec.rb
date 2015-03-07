require 'spec_helper'

feature "editing tickets" do
  let!(:project) {FactoryGirl.create(:project)}
  let!(:ticket) {FactoryGirl.create(:ticket, project:project)}

  before do
    visit '/'
    click_link project.name
    click_link ticket.title
    click_link "Edit Ticket"
  end
  scenario 'edit tickets' do

    fill_in "Title", with: "Make it really shinny!"
    click_button "Update Ticket"

    expect(page).to have_content "Ticket has been updated"

    within('#ticket h2') do
      expect(page).to have_content("Make it really shinny!")
    end
    expect(page).to_not have_content ticket.title



  end
  scenario 'filling out ticket with invalid info returns erro' do
    fill_in "Title", with: " "

    click_button "Update Ticket"

    expect(page).to have_content "Ticket has not been updated"


  end

end

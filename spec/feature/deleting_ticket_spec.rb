require 'spec_helper'

feature "deleting ticket from project" do
  let!(:project) {FactoryGirl.create(:project)}
  let!(:ticket){FactoryGirl.create(:ticket, project: project)}

  before do
    visit '/'
    click_link project.name
    click_link ticket.title

  end

  scenario 'successfully deleting ticket' do
    click_link "Delete Ticket"
    expect(page).to have_content("Ticket has been deleted.")
    expect(page.current_url).to eq(project_url(project))  
  end

end

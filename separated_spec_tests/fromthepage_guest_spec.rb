require 'spec_helper'

describe "guest user actions" do

  before :all do
    @collections = Collection.all
    @collection = @collections.last
    @work = @collection.works.last
    @page = @work.pages.last
    @owner = User.find_by(login: OWNER)
    @admin = User.find_by(login: ADMIN)
  end

  it "tests guest account creation and migration" 
  it "tests guest account transcription" 


  it "looks at the landing page" do 
    visit landing_page_path
    expect(page).to have_selector('.carousel')
    expect(page.find('.maincol')).to have_link(@owner.display_name)
    page.find('.maincol').click_link(@owner.display_name)
    expect(page).to have_content("Recent Activity")
    expect(page.find('.maincol')).not_to have_content(@admin.display_name)
    expect(page.find('h1')).to have_content @owner.display_name
    expect(page.current_path).to eq user_profile_path(@owner)
  end

  it "searches the landing page" 


  it "checks guest start transcribing path" 


end


require 'spec_helper'

describe "convention related tasks", :order => :defined do
  Capybara.javascript_driver = :webkit

  before :all do
    @owner = User.find_by(login: OWNER)
    @collections = @owner.all_owner_collections
    @collection = @collections.second
    @work = @collection.works.last
    @page = @work.pages.first
    @conventions = @collection.transcription_conventions
    @clean_conventions = ActionController::Base.helpers.strip_tags(@collection.transcription_conventions)
    @clean_conventions.gsub!(/\n/, ' ')
    @new_convention = "Collection level transcription convention"
    @work_convention = "Work level transcription conventions"
    if @work.ocr_correction == true
      @tab = "Correct"
    else
      @tab = "Transcribe"
    end
  end

  before :each do
    login_as(@owner, :scope => :user)
  end    

  it "checks for collection level transcription conventions" 


  it "changes work level transcription conventions" 


  it "changes conventions at collection level but not work level" 


  it "reverts to collection level transcription conventions", :js => true do
    visit collection_read_work_path(@work.collection.owner, @work.collection, @work)
    page.find('.tabs').click_link("Settings")
    convention_work = Work.find_by(id: @work.id)
    expect(convention_work.transcription_conventions).to eq @work_convention
    expect(page).not_to have_content @new_convention
    expect(page.find('#work_transcription_conventions')).to have_content @work_convention
    expect(page).to have_button('Revert')
    page.find_button('Revert').trigger(:click)
    sleep(3)
    convention_work = Work.find_by(id: @work.id)
    expect(convention_work.transcription_conventions).to eq nil
    visit "/display/read_work?work_id=#{@work.id}"
    page.find('.work-page_title', text: @page.title).click_link(@page.title)
    if page.has_content?("Facsimile")
      page.find('.tabs').click_link(@tab)
    end
    expect(page).to have_content @new_convention
    expect(page).not_to have_content @work_convention
  end

end



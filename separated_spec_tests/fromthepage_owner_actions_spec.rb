require 'spec_helper'

describe "owner actions", :order => :defined do
  Capybara.javascript_driver = :webkit

  before :all do

    @owner = User.find_by(login: OWNER)
    @collections = @owner.all_owner_collections
    @collection = @collections.first
    @works = @owner.owner_works
    @title = "This is an empty work"
    @rtl_collection = Collection.last
  end

  before :each do
    login_as(@owner, :scope => :user)
  end

  it "fails to upload a document" 


  it "creates a new collection" 


  it "creates an empty new work in a collection" 


  it "checks for subject in a new collection" 


  it "deletes a collection" 


  it "creates a collection from work dropdown", :js => true do
    col_title = "New Work Collection"
    visit dashboard_owner_path
    page.find('.tabs').click_link("Start A Project")
    page.select 'Add New Collection', from: 'document_upload_collection_id' 

    within(page.find('.litebox-embed')) do
      expect(page).to have_content('Create New Collection')
      fill_in 'collection_title', with: col_title
      find_button('Create Collection').trigger(:click)
    end
    page.find('#document_upload_collection_id')
    expect(page).to have_select('document_upload_collection_id', selected: col_title)
    sleep(2)
    expect(Collection.last.title).to eq col_title
    #need to remove this collection to prevent conflicts in later tests
    Collection.last.destroy
  end

  it "creates a subject" 


  it "deletes a subject" 


  it "fails to create an empty work" 


  it "moves a work to another collection" 


  it "doesn't move a work with articles", :js => true do
    col = Collection.second
    work = col.works.second
    test_page = work.pages.first
    visit collection_transcribe_page_path(col.owner, col, work, test_page)
    page.fill_in 'page_source_text', with: "[[Switzerland]]"
    click_button('Save Changes')
    expect(page.find('.flash_message')).to have_content("Saved")
    visit edit_collection_work_path(col.owner, col, work)
    expect(page).to have_content("Work title")
    expect(page.find('.breadcrumbs')).to have_selector('a', text: col.title)
    select(@collection.title, :from => 'work_collection_id')
    #reject the modal and get text
    message = page.dismiss_confirm do
      click_button('Save Changes')
    end
    expect(message).to have_content("Are you sure you want to move this work")
    expect(Work.find_by(id: work.id).collection).to eq col
  end

  it "moves a work with articles" 


  it "deletes a work" 


  it "checks an owner user profile/homepage" 


  it "changes the collection's default language" 


  it "checks rtl transcription page views" 


  it "resets the default language" 


end


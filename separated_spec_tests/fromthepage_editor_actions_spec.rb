require 'spec_helper'

describe "editor actions" , :order => :defined do
  Capybara.javascript_driver = :webkit

  before :all do
    @owner = User.find_by(login: OWNER)
    @user = User.find_by(login: USER)
    @rest_user = User.find_by(login: REST_USER)
    collection_ids = Deed.where(user_id: @user.id).distinct.pluck(:collection_id)
    @collections = Collection.where(id: collection_ids)
    @collection = @collections.first
    @work = @collection.works.first
    @page = @work.pages.first
    @auth_work = Collection.last.works.second
    #set up the restricted user not to be emailed
    notification = Notification.find_by(user_id: @rest_user.id)
    notification.add_as_collaborator = false
    notification.save!
  end

  before :each do
    login_as(@user, :scope => :user)
  end

  it "checks that a restricted editor can't see a work" 


  it "adds a user to a restricted work" 


  it "checks that an editor with permissions can see a restricted work" 


  it "removes a collaborator from a restricted work" 


  it "looks at a collection" 


  it "looks at a work" 


  it "looks at pages" 


  it "transcribes a page" 


  it "translates a page" 


  it "checks a plain user profile" 


  it "tries to log in as another user" 


  it "adds a note" 


  it "tries to save transcription with unsaved note", :js => true do
    col = Collection.second
    test_page = col.works.first.pages.first
    visit collection_transcribe_page_path(col.owner, col, test_page.work, test_page)
    text = Page.find_by(id: test_page.id).source_text
    fill_in('Write a new note...', with: "Test two")
    fill_in 'page_source_text', with: "Attempt to save"
    message = accept_alert do
      click_button('Save Changes')
    end
    sleep(2)
    expect(message).to have_content("You have unsaved notes.")
    new_text = Page.find_by(id: test_page.id).source_text
    #because of the note, page.source_text should not have changed
    expect(new_text).to eq text
    #save the note
    click_button('Submit')
    expect(test_page.notes.count).not_to be nil
  end

  it "deletes a note", :js => true do
    col = Collection.second
    test_page = col.works.first.pages.first
    visit collection_transcribe_page_path(col.owner, col, test_page.work, test_page)
    title = test_page.notes.last.id
    page.find('.user-bubble_content', text: "Test two")
    page.click_link('', :href => "/notes/#{title}")
    sleep(3)
    expect(Note.find_by(id: title)).to be_nil
  end

  it "uses page arrows with unsaved transcription", :js => true do
    col = Collection.second
    test_page = col.works.first.pages.second
    #next page arrow
    visit collection_transcribe_page_path(col.owner, col, test_page.work, test_page)
    fill_in 'page_source_text', with: "Attempt to save"
    message = accept_alert do
      page.click_link("Next page")
    end
    sleep(3)
    expect(message).to have_content("You have unsaved changes.")
    visit collection_transcribe_page_path(col.owner, col, test_page.work, test_page)
    #previous page arrow - make sure it also works with notes
    fill_in('Write a new note...', with: "Test two")
    message = accept_alert do
      page.click_link("Previous page")
    end
    sleep(3)
    expect(message).to have_content("You have unsaved changes.")
  end

  it "filters list of pages the need transcription" 


  it "filters list of pages the need translation" 


  it "finds a page to transcribe" 


end



require 'spec_helper'

describe "collection settings js tasks", :order => :defined do
  Capybara.javascript_driver = :webkit

  before :all do
    @owner = User.find_by(login: OWNER)
    @collections = @owner.all_owner_collections
    @collection = @collections.second
  end

  before :each do
    login_as(@owner, :scope => :user)
  end    

  it "sets collection to field based transcription" 


  it "edits fields for transcription" 


  it "checks the field preview on edit page" 


  it "adds fields for transcription", :js => true do
    visit collection_path(@collection.owner, @collection)
    page.find('.tabs').click_link("Edit Fields")
    count = page.all('#new-fields tr').count
    click_button 'Add Additional Field'
    expect(page.all('#new-fields tr').count).to eq (count+1)
  end

  it "adds new line", :js => true do
    visit collection_path(@collection.owner, @collection)
    page.find('.tabs').click_link("Edit Fields")
    count = page.all('#new-fields tr').count
    line_count = page.all('#new-fields tr th#line_num').count
    click_button 'Add Additional Line'
    sleep(3)
    expect(page.all('#new-fields tr').count).to eq (count + 2)
    expect(page.all('#new-fields tr th#line_num').count).to eq (line_count + 1)
  end

  it "transcribes field-based works" 


  it "reorders a transcription field" 


  it "deletes a transcription field" 


  it "uses page arrows with unsaved transcription", :js => true do
    test_page = @collection.works.first.pages.second
    #next page arrow
    visit collection_transcribe_page_path(@collection.owner, @collection, test_page.work, test_page)
    page.fill_in('fields_1_First_field', with: "Field one")
    message = accept_alert do
      page.click_link("Next page")
    end
    sleep(3)
    expect(message).to have_content("You have unsaved changes.")
    visit collection_transcribe_page_path(@collection.owner, @collection, test_page.work, test_page)
    #previous page arrow - make sure it also works with notes
    fill_in('Write a new note...', with: "Test two")
    message = accept_alert do
      page.click_link("Previous page")
    end
    sleep(3)
    expect(message).to have_content("You have unsaved changes.")
  end

  #note: these are hidden unless there is table data
  it "exports a table csv" 


  it "exports table data for an entire collection" 


  it "sets collection back to document based transcription" 


end


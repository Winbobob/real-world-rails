require 'spec_helper'

describe "disable subject linking", :order => :defined do

  before :all do
    @owner = User.find_by(login: OWNER)
    @collections = @owner.all_owner_collections
    @collection = @collections.first
    @work = @collection.works.second
    @title = @work.pages.third.title
  end

  before :each do
    login_as(@owner, :scope => :user)
  end

  it "disables subject indexing in a collection" 


  it "checks collection level subject items" 


  it "checks work level subject items" 


  it "checks page level subject items" 


  it "enables subject indexing" 


 it "checks links work when enabled" 
  it "imports explores IIIF universe" 


  it "imports an IIIF collection", :js => true do
    #test import of collection
    visit dashboard_owner_path
    page.find('.tabs').click_link("Start A Project")
    page.fill_in 'at_id', with: @at_id
    find_button('iiif_import').click
    expect(page).to have_content(@at_id)
    expect(page).to have_content("Manifests")
    select("Create Collection", :from => 'manifest_import')
    click_button('Import Checked Manifests')
    expect(page.find('.flash_message')).to have_content("IIIF collection import is processing")
    expect(page).to have_content("Works")
    sleep(15)
    expect(Collection.last.title).to have_content("TextGrid")
    expect(Collection.last.works.count).not_to be_nil
  end

  it "tests for transcribed works" 


  it "cleans up the logfile" 


end


require 'spec_helper'

describe "needs review", :order => :defined do
  Capybara.javascript_driver = :webkit

  before :all do
    @owner = User.find_by(login: OWNER)
    @user = User.find_by(login: USER)
    @collection = Collection.second
    @work = @collection.works.third
    @page1 = @work.pages.first
    @page2 = @work.pages.second
    @page3 = @work.pages.third
    @page4 = @work.pages.fourth
    @page5 = @work.pages.fifth
    @page6 = @work.pages.last
  end

  before :each do
    login_as(@user, :scope => :user)
  end

  it "sets the work to translation" 


  it "marks pages blank" 


  it "marks translated pages as blank" 


  it "marks pages as needing review" 


  it "marks translated pages as needing review" 


  it "filters list of review pages" 


  it "views collection pages that need review" 


  it "checks collection overview stats view" 


  it "checks statistics in works list" 


  it "marks pages as no longer needing review" 


  it "marks translated pages as no longer needing review" 


  it "marks pages not blank" 


  it "checks needs review/blank checkboxes", :js => true do
    @page1 = @work.pages.first
    expect(@page1.status).to be_nil
    visit collection_transcribe_page_path(@work.collection.owner, @work.collection, @work, @page1.id)
    expect(page.find('#page_needs_review')).not_to be_checked
    expect(page.find('#page_mark_blank')).not_to be_checked
    page.check('page_needs_review')
    page.check('page_mark_blank')
    expect(page.find('#page_needs_review')).not_to be_checked
    expect(page.find('#page_mark_blank')).to be_checked
    page.check('page_needs_review')
    expect(page.find('#page_needs_review')).to be_checked
    expect(page.find('#page_mark_blank')).not_to be_checked
  end

  it "sets a collection to needs review workflow" 


end


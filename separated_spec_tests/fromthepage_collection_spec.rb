
require 'spec_helper'

describe "collection settings js tasks", :order => :defined do

  before :all do
    Capybara.javascript_driver = :webkit
    @owner = User.find_by(login: OWNER)
    @user = User.find_by(login: USER)
    @collections = @owner.all_owner_collections
    @collection = @collections.second
    @work = @collection.works.second
    @rest_user = User.find_by(login: REST_USER)
    #add a user to be emailed
    @notify_user = User.find_by(login: ADMIN)
    #set up the restricted user not to be emailed
    notification = Notification.find_by(user_id: @rest_user.id)
    notification.add_as_collaborator = false
    notification.add_as_owner = false
    notification.save!
    @page = @work.pages.first
    @wording = "Click microphone to dictate"
    @article = @collection.articles.first
  end

  it "sets collection to private" 


  it "checks that a restricted user can't view the collection" 


  it "adds collaborators to a private collection" 


  it "checks that an added user can edit a work in the collection" 


  it "removes collaborators from a private collection" 


  it "checks that the removed user can't view the collection" 


  it "adds owners to a private collection" 


  it "checks added owner permissions" 


  it "removes owner from a private collection" 


  it "checks removed owner permissions" 


  it "sets collection to public" 


  it "views completed works" 


  it "sorts works in works list", :js => true do
    login_as(@owner, :scope => :user)
    visit collection_path(@collection.owner, @collection)
    page.find('.tabs').click_link("Works List")
    expect(page).to have_content("Works")
    @collection.works.each do |w|
      expect(page).to have_content(w.title)
    end
    expect(page.find('.collection-work-stats').find('li:nth-child(2)')).to have_content @collection.works.first.title
    expect(page.find('.collection-work-stats').find('li:last-child')).to have_content @collection.works.last.title
    #sort by percent complete
    page.select('Percent Complete', from: 'sort_by')
    expect(page.find('.collection-work-stats').find('li:nth-child(2)')).to have_content @collection.works.order_by_completed.first.title
    expect(page.find('.collection-work-stats').find('li:last-child')).to have_content @collection.works.order_by_completed.pluck(:title).last
    #sort by recent activity
    page.select('Recent Activity', from: 'sort_by')
    expect(page.find('.collection-work-stats').find('li:nth-child(2)')).to have_content @collection.works.order_by_recent_activity.first.title
    expect(page.find('.collection-work-stats').find('li:last-child')).to have_content @collection.works.order_by_recent_activity.pluck(:title).last
  end

  it "views pages that need transcription" 


end


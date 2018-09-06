require 'spec_helper'

describe "document sets", :order => :defined do

  before :all do
    @owner = User.find_by(login: OWNER)
    @user = User.find_by(login: USER)
    @rest_user = User.find_by(login: REST_USER)
    @collections = @owner.all_owner_collections
    @collection = @collections.last
    #set up the restricted user not to be emailed
    notification = Notification.find_by(user_id: @rest_user.id)
    notification.add_as_collaborator = false
    notification.save!
  end

  before :each do
    @document_sets = DocumentSet.where(owner_user_id: @owner.id)
    @set = DocumentSet.first
  end

  it "sets up works for doc set tests" 


  it "edits a document set (start at collection level)" 


  it "makes a document set private" 


  it "views document sets - regular user" 


  it "adds a collaborator" 


  it "tests a collaborator" 


  it "checks notes on a public doc set/private collection" 
  it "cleans up test data" 


  it "looks at document sets owner tabs" 


  it "checks document set breadcrumbs - collection" 


  it "checks document set breadcrumbs - subjects" 


  it "checks document set subject tabs" 


  it "checks document set breadcrumbs - work" 


  it "checks document set breadcrumbs - page level" 


  it "checks doc set needs transcription/review buttons" 


  it "disables document sets" 


  it "enables document sets" 


  it "edits a document set slug" 


  it "resets work settings" 


end


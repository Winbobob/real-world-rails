
#Note - this test must fall at the very end of the features specs
require 'spec_helper'

describe "testing deletions" do

  before :all do
    @owner = User.find_by(login: 'margaret')
    @collections = @owner.all_owner_collections
    @collection = @collections.last
    @document_sets = DocumentSet.where(owner_user_id: @owner.id)
  end

  before :each do
    login_as(@owner, :scope => :user)
  end    

  it "blanks out the data in a collection" 


  it "deletes a document set" 


  it "deletes a page" 


  it "deletes a work" 


  it "deletes a collection" 


end


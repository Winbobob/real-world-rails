require 'spec_helper'

describe "export tasks" do

  before :all do
    @owner = User.find_by(login: OWNER)
    @collection = @owner.all_owner_collections.second
    @work = @collection.works.last
    @page = @work.pages.first
  end

  before :each do
    login_as(@owner, :scope => :user)
  end    

  it "exports all works in a collection" 


  it "exports the subject index" 


  it "exports a work as xhtml" 


  it "exports a work as tei" 


  it "fails to export a table csv" 


end


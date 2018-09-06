
require 'spec_helper'

describe "uploads data for collections", :order => :defined do

  before :all do
    @owner = User.find_by(login: OWNER)
    @collections = @owner.all_owner_collections
    @collection = @collections.second
    @set_collection = @collections.last
    @title = "This is an empty work"
  end

  before :each do
    login_as(@owner, :scope => :user)
  end

  it "sets slugs" 


  it "starts a new project from tab" 


  it "imports IIIF manifests" 


  it "creates an empty work" 


  it "adds pages to an empty work" 


  it "adds new document sets" 


  it "adds works to document sets" 


end


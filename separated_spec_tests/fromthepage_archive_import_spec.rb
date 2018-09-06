require 'spec_helper'

describe "IA import actions", :order => :defined do

  before :all do

    @owner = User.find_by(login: OWNER)
    @collections = @owner.all_owner_collections
    @collection = @collections.second
    @works = @owner.owner_works
    @title = "[Letter to] Dear Garrison [manuscript]"
  end

  before :each do
    login_as(@owner, :scope => :user)
  end    

  it "imports a work from IA" 


  it "uses OCR when importing a work from IA" 


  it "tests ocr correction" 


  it "checks ocr/transcribe statistics" 


end


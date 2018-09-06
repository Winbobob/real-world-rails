require 'spec_helper'

describe "owner view - collection" do

  before :all do

    @owner = User.find_by(login: OWNER)
    @collections = @owner.all_owner_collections
    @collection = @collections.first
    @works = @owner.owner_works
  end

  before :each do
    login_as(@owner, :scope => :user)
  end    

  it "looks at owner tabs" 


  it "looks at statistics tab" 


  it "looks at subjects tab" 


  it "looks at statistics tab" 


  it "looks at works list tab" 


  it "looks at settings tab" 


  it "looks at export tab" 


  it "looks at collaborators tab" 


end


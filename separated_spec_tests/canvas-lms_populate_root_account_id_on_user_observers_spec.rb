require_relative '../sharding_spec_helper'

describe DataFixup::PopulateRootAccountIdOnUserObservers do
  before :once do
    course_with_student(:active_all => true)
    @observer = user_with_pseudonym(:active_all => true)
    @link = UserObservationLink.create!(:student => @student, :observer => @observer)
  end

  it "should populate the root account id" 


  it "should handle a uniqueness error when updating the root account id" 


  it "should destroy the link and populate a dummy id if it can't find a valid root account for observer" 


  it "should destroy the link and populate a dummy id if it can't find a valid root account for student" 


  it "should create an additional link if there are multiple shared root accounts" 


  it "should handle a uniqueness error creating an additional link" 


  context "sharding" do
    specs_require_sharding

    before :once do
      @shard1.activate do
        @cs_account = Account.create!
        @cs_observer = user_with_pseudonym(:active_all => true, :account => @cs_account)
        @cs_link_shadow = UserObservationLink.create!(:student => @student, :observer => @cs_observer)
      end
      pseudonym(@cs_observer, :account => Account.default)
      @cs_link = UserObservationLink.create!(:student => @student, :observer => @cs_observer)
    end

    it "should not affect shadow records when run on their shard" 


    it "should update shadow records when run for primary record's shard" 


    it "should still add a link for shared cross shard accounts" 

  end
end


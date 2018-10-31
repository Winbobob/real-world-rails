require File.dirname(__FILE__) + '/../spec_helper'

describe ListsController do
  before(:each) { enable_elastic_indexing( Observation ) }
  after(:each) { disable_elastic_indexing( Observation ) }
  describe "create" do
    it "allow creation of multiple types" 

  end

  describe "destroy" do
    it "should not allow you to delete your own life list" 


    it "should not allow anyone to delete a default project list" 

  end

  describe "compare" do
    let(:user) { User.make! }
    before do
      sign_in user
    end
  
    it "should work" 

  end

  describe "spam" do
    let(:spammer_content) {
      l = List.make!
      l.user.update_attributes(spammer: true)
      l
    }
    let(:flagged_content) {
      l = List.make!
      Flag.make!(flaggable: l, flag: Flag::SPAM)
      l
    }

    it "should render 403 when the owner is a spammer" 


    it "should render 403 when content is flagged as spam" 

  end
end


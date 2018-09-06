# ES UPGRADE TRANSITION #
# Remove file
require "spec_helper"

describe WorksController do
  include LoginMacros

  describe "#use_new_search?" do

    before(:each) do
      unless elasticsearch_enabled?($elasticsearch)
        $rollout.deactivate(:use_new_search)
      end
    end

    after(:each) do
      unless elasticsearch_enabled?($elasticsearch)
        $rollout.activate(:use_new_search)
      end
    end

    it "should return false if there is no current user" 


    it "should return false if the current user is not activated for the use new search feature" 


    it "should return true if the current user is activated for the use new search feature" 


    it "should return true if use new search is activated globally" 

  end

  describe "#search" do
    it "should use the new work search form object when use_new_search? is true" 


    it "should use the old work search object when use_new_search? is false" 

  end

  describe "#index" do
    let(:user) { create(:user) }

    it "should use the new work search form object when use_new_search? is true" 


    it "should use the old work search object when use_new_search? is false" 

  end

  describe "#collected" do
    let(:user) { create(:user) }

    it "should use the new work search form object when use_new_search? is true" 


    it "should use the old work search object when use_new_search? is false" 

  end

end


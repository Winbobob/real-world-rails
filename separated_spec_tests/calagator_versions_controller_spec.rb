require 'spec_helper'

module Calagator

describe VersionsController, :type => :controller do
  routes { Calagator::Engine.routes }

  describe "without versions" do
    it "should raise RecordNotFound if not given an id" 


    it "should raise RecordNotFound if given invalid id" 


    it "should raise RecordNotFound if given id that doesn't exist" 

  end

  describe "with versions" do
    before do
      @create_title = "myevent"
      @update_title = "myevent v2"
      @final_title = "myevent v3"

      @event = FactoryGirl.create(:event, :title => @create_title)

      @event.title = @update_title
      @event.save!

      @event.title = @final_title
      @event.save!

      @event.destroy
    end

    # Returns the versioned record's title for the event (e.g. :update).
    def title_for(event)
      version_id = @event.versions.where(event: event).pluck(:id).first

      get :edit, :id => version_id

      return assigns[:event].title
    end

    it "should render the initial content for a 'create'" 


    it "should render the updated content for an 'update'" 


    it "should render the final content for a 'destroy'" 


    it "should render html" 


    it "should render html via xhr" 

  end
end

end


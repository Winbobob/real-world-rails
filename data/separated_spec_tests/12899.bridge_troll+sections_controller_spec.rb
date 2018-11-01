require 'rails_helper'

describe SectionsController do
  before do
    @event = create(:event)
    @user = create(:user)
    @event.organizers << @user
    sign_in @user
  end

  describe "#create" do
    it "makes a new section for the event" 


    it "initializes the section with a default name" 

  end

  describe "#update" do
    before do
      @section = @event.sections.create(name: 'Fantasy Island')
    end

    it 'changes the section' 


    it 'does not respect invalid params' 

  end

  describe "#destroy" do
    before do
      @section = @event.sections.create(name: 'Fantasy Island')
    end

    it 'removes the section' 

  end

  describe "#arrange" do
    it 'tells the section arranger to arrange sections for this event' 

  end
end


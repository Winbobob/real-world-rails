require 'rails_helper'

describe 'devise/registrations/new.html.haml', type: "view" do
  context "logged in" do
    before(:each) do
      @view.stub(:resource).and_return(Member.new)
      @view.stub(:resource_name).and_return("member")
      @view.stub(:resource_class).and_return(Member)
      @view.stub(:devise_mapping).and_return(Devise.mappings[:member])
      render
    end

    it 'should have some fields' 


    it 'has a checkbox for newsletter subscription' 

  end
end


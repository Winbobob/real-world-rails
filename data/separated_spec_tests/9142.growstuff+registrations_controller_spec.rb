require 'rails_helper'

describe RegistrationsController do
  before :each do
    @member = FactoryBot.create(:member)
    sign_in @member
    controller.stub(:current_user) { @member }
    controller.stub(:devise_mapping).and_return(Devise.mappings[:member])
  end

  describe "GET edit" do
    it "assigns the requested member as @member" 


    it "picks up the twitter auth" 


    it "picks up the flickr auth" 

  end
end


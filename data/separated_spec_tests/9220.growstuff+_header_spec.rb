require 'rails_helper'

describe 'layouts/_header.html.haml', type: "view" do
  context "when not logged in" do
    before(:each) do
      controller.stub(:current_user) { nil }
      render
    end

    it 'shows the brand logo in the navbar' 


    it 'should have signup/signin links' 


    it 'has a Crops link' 


    it 'has a Seeds link' 


    it 'has a Places link' 


    it 'has a Community section' 


    it 'links to members' 


    it 'links to posts' 


    it 'links to forums' 


    it 'has a crop search' 

  end

  context "logged in" do
    before(:each) do
      @member = FactoryBot.create(:member)
      sign_in @member
      controller.stub(:current_user) { @member }
      render
    end

    context "login name" do
      it 'should have member login name' 

      it "should show link to member's gardens" 

      it "should show link to member's plantings" 

      it "should show link to member's seeds" 

      it "should show link to member's posts" 

    end

    it 'should show signout link' 


    it 'should show inbox link' 


    context 'has notifications' do
      it 'should show inbox count' 

    end
  end
end


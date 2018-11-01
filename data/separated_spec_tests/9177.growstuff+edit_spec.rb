require 'rails_helper'

describe 'devise/registrations/edit.html.haml', type: "view" do
  context "logged in" do
    before(:each) do
      controller.stub(:current_user) { nil }
      @member = FactoryBot.create(:member)
      controller.stub(:current_member) { @member }
      @view.stub(:resource).and_return(@member)
      @view.stub(:resource_name).and_return("member")
      @view.stub(:resource_class).and_return(Member)
      @view.stub(:devise_mapping).and_return(Devise.mappings[:member])
    end

    it 'should have some fields' 


    context 'email section' do
      before(:each) do
        render
      end

      it 'has a checkbox for email notifications' 


      it 'has a checkbox for newsletter subscription' 

    end

    context 'profile section' do
      before(:each) do
        render
      end

      it 'shows show_email checkbox' 


      it "contains a gravatar icon" 


      it 'contains a link to gravatar.com' 


      it 'shows bio field' 


      it 'shows location field' 

    end

    context 'other sites section' do
      context 'not connected to twitter' do
        it 'has a link to connect' 

      end

      context 'connected to twitter' do
        before(:each) do
          @twitter_auth = FactoryBot.create(:authentication, member: @member)
          render
        end

        it 'has a link to twitter profile' 

        it 'has a link to disconnect' 

      end

      context 'not connected to flickr' do
        it 'has a link to connect' 

      end

      context 'connected to flickr' do
        before(:each) do
          @flickr_auth = FactoryBot.create(:flickr_authentication, member: @member)
          render
        end

        it 'has a link to flickr photostream' 

        it 'has a link to disconnect' 

      end
    end
  end
end


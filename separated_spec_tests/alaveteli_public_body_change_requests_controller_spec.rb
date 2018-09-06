# -*- encoding : utf-8 -*-
require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe PublicBodyChangeRequestsController do

  describe 'GET #new' do

    it "should show the form" 


    it 'instructs the view to render recaptcha if there is no logged in user' 


    it 'does not instruct the view to render recaptcha if there is a logged in user' 


  end

  describe 'POST #create' do

    before do
      @email = "test@example.com"
      name = "Test User"
      @change_request_params = {:user_email => @email,
                                :user_name => name,
                                :public_body_name => 'New Body',
                                :public_body_email => 'new_body@example.com',
                                :notes => 'Please',
                                :source => 'http://www.example.com',
                                :comment => '' }
    end

    it "should send an email to the site contact address" 


    it 'sets render_recaptcha to true if there is no logged in user' 


    it 'sets render_recaptcha to false if there is a logged in user' 


    it 're-renders the form if the recaptcha verification was unsuccessful' 


    it 'should show a notice' 


    it 'should redirect to the frontpage' 


    it 'has rudimentary spam protection' 


    context 'when handling a request for an update to an existing authority' do

      before do
        @email = "test@example.com"
        name = "Test User"
        @public_body = FactoryGirl.create(:public_body)
        @change_request_params = {:user_email => @email,
                                  :user_name => name,
                                  :public_body_id => @public_body.id,
                                  :public_body_email => 'new_body@example.com',
                                  :notes => 'Please',
                                  :source => 'http://www.example.com',
                                  :comment => '' }
      end

      it 'should send an email to the site contact address' 


      it 'should show a notice' 


      it 'should redirect to the frontpage' 


    end
  end
end


# -*- encoding : utf-8 -*-
require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')
require File.expand_path(File.dirname(__FILE__) + '/alaveteli_dsl')

describe RequestController, "when classifying an information request" do

  describe 'when the request is internal' do

    before(:each) do
      load_raw_emails_data
      @dog_request = info_requests(:fancy_dog_request)
      # This should happen automatically before each test but doesn't with these integration
      # tests for some reason.
      ActionMailer::Base.deliveries = []
    end

    describe 'when logged in as the requestor' do

      before :each do
        @bob = login(:bob_smith_user)
      end

      it "should send an email including the message" 

    end
  end

  describe 'when the site is in read only mode' do

    before do
      allow(AlaveteliConfiguration).to receive(:read_only).
        and_return("Down for maintenance")
    end

    it 'shows a flash alert to users' 


    context 'when annotations are disabled' do

      before do
        allow_any_instance_of(ApplicationController).
          to receive(:feature_enabled?).
            and_call_original

        allow_any_instance_of(ApplicationController).
          to receive(:feature_enabled?).
            with(:annotations).
              and_return(false)
      end

      it 'shows a flash alert to users' 


    end

  end

  describe 'FOI officer uploading a reponse' do

    let(:public_body) do
      FactoryGirl.create(:public_body, :request_email => "foi@example.com")
    end
    let(:officer) { FactoryGirl.create(:user, :email => "officer@example.com") }
    let(:user) { FactoryGirl.create(:user, :name => "Awkward > Name") }
    let(:request) { FactoryGirl.create(:info_request, :user => user) }

    it 'should render a message confirming the response has been published' 


  end

  describe 'request owner classifying a request' do

    let(:info_request) { FactoryGirl.create(:info_request) }
    let(:user) { info_request.user }

    context 'marking request as error_message' do

      it 'displays a thank you message post redirect' 


    end

    context 'marking request as internal_review' do

      it 'displays a thank you message post redirect' 


    end

    context 'marking request as not_held' do

      it 'displays a thank you message post redirect' 


    end

    context 'marking request as partially_successful' do

      it 'displays a thank you message post redirect' 


      context 'there is a donation link' do

        it 'displays the donation link' 

      end

    end

    context 'marking request as rejected' do

      it 'displays a thank you message post redirect' 


    end

    context 'marking request as requires_admin' do

      it 'displays a thank you message post redirect' 


    end

    context 'marking request as successful' do

      it 'displays a thank you message post redirect' 


      context 'there is a donation link' do

        it 'displays the donation link' 


      end

      context 'when annotations are disabled' do

        before do
          allow_any_instance_of(ApplicationController).
            to receive(:feature_enabled?).
              and_call_original

          allow_any_instance_of(ApplicationController).
            to receive(:feature_enabled?).
              with(:annotations).
                and_return(false)
        end

        it 'does not display the annotations part of the message' 


      end

    end

    context 'marking request as user_withdrawn' do

      it 'displays a thank you message post redirect' 


    end

    context 'marking request as waiting_clarification' do

      it 'displays a thank you message post redirect' 


    end

    context 'marking request as waiting_response' do

      it 'displays a thank you message post redirect' 


    end

    context 'marking overdue request as waiting_response' do

      it 'displays a thank you message post redirect' 


    end

    context 'marking very overdue request as waiting_responses' do

      it 'displays a thank you message post redirect' 


    end

  end

end


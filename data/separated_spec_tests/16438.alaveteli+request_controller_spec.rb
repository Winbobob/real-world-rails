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
      FactoryBot.create(:public_body, :request_email => "foi@example.com")
    end
    let(:officer) { FactoryBot.create(:user, :email => "officer@example.com") }
    let(:user) { FactoryBot.create(:user, :name => "Awkward > Name") }
    let(:request) { FactoryBot.create(:info_request, :user => user) }

    it 'should render a message confirming the response has been published' 


  end

  describe 'request owner classifying a request' do

    let(:info_request) { FactoryBot.create(:info_request) }
    let(:user) { info_request.user }

    shared_examples_for 'authority is not subject to FOI law' do

      it 'does not include "By law"' 


    end

    shared_examples_for 'authority is subject to FOI law' do

      it 'does includes the text "By law"' 


    end

    shared_examples_for 'the donation link is configured' do

      it 'shows the donation link' 


    end

    context 'marking request as error_message' do

      let(:classification) { 'error_message1' }

      it 'displays a thank you message post redirect' 


    end

    context 'marking request as internal_review' do

      let(:classification) { 'internal_review1' }

      it 'displays a thank you message post redirect' 


    end

    context 'marking request as not_held' do

      let(:classification) { 'not_held1' }

      it 'displays a thank you message post redirect' 


    end

    context 'marking request as partially_successful' do

      let(:classification) { 'partially_successful1' }

      it 'displays a thank you message post redirect' 


      include_examples 'the donation link is configured'

    end

    context 'marking request as rejected' do

      let(:classification) { 'rejected1' }

      it 'displays a thank you message post redirect' 


    end

    context 'marking request as requires_admin' do

      let(:classification) { 'requires_admin1' }

      it 'displays a thank you message post redirect' 


    end

    context 'marking request as successful' do

      let(:classification) { 'successful1' }

      it 'displays a thank you message post redirect' 


      include_examples 'the donation link is configured'

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

      let(:classification) { 'user_withdrawn1' }

      it 'displays a thank you message post redirect' 


    end

    context 'marking request as waiting_clarification' do

      let(:classification) { 'waiting_clarification1' }

      it 'displays a thank you message post redirect' 


    end

    context 'marking request as waiting_response' do

      let(:classification) {'waiting_response1'}

      it 'displays a thank you message post redirect' 


      include_examples 'authority is not subject to FOI law'

      include_examples 'authority is subject to FOI law'

    end

    context 'marking overdue request as waiting_response' do

      let(:classification) { 'waiting_response1' }

      before do
        time_travel_to(info_request.date_response_required_by + 2.days)
      end

      after do
        back_to_the_present
      end

      it 'displays a thank you message post redirect' 


      include_examples 'authority is not subject to FOI law'

      include_examples 'authority is subject to FOI law'

    end

    context 'marking very overdue request as waiting_responses' do

      let(:classification) { 'waiting_response1' }

      before do
        time_travel_to(info_request.date_very_overdue_after + 2.days)
      end

      after do
        back_to_the_present
      end

      it 'displays a thank you message post redirect' 


    end

  end

end


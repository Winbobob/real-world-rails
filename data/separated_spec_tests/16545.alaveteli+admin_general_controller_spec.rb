# -*- encoding : utf-8 -*-
require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe AdminGeneralController do

  describe "GET #index" do
    let(:admin_user){ FactoryBot.create(:admin_user) }
    let(:pro_admin_user){ FactoryBot.create(:pro_admin_user) }

    before do
      InfoRequest.destroy_all
    end

    it "should render the front page" 


    it 'assigns old unclassified requests' 


    it 'assigns requests that require admin to the view' 


    it 'assigns requests that have error messages to the view' 


    it 'assigns requests flagged for admin attention to the view' 


    it 'assigns messages sent to the holding pen to the view' 


    context 'when there are request tasks' do

      it 'assigns public_request_tasks to true' 


    end

    context 'when there are no request tasks' do

      it 'assigns public_request_tasks to false' 

    end

    it 'assigns blank contacts to the view' 


    it 'assigns new body request to the view' 


    it 'assigns body update requests to the view' 


    context 'when there are authority tasks' do

      it 'assigns authority tasks to true' 


    end

    context 'when there are no authority tasks' do

      it 'assigns authority tasks to false' 


    end

    it 'assigns comments requiring attention to the view' 


    context 'when there are comment tasks' do

      it 'assigns comment tasks to true' 


    end

    context 'when there are no authority tasks' do

      it 'assigns authority tasks to false' 


    end

    context 'when there is nothing to do' do

      it 'assigns nothing to do to true' 


    end

    context 'when there is something to do' do

      it 'assigns nothing to do to false' 


    end

    context 'when the user is not a pro admin' do

      context 'when pro is enabled' do

        it 'does not assign embargoed requests that require admin to the view' 


        it 'does not assign embargoed requests that have error messages to the view' 


        it 'does not assign embargoed requests flagged for admin attention to the view' 


      end

      it 'does not assign embargoed requests that require admin to the view' 


      it 'does not assign embargoed requests that have error messages to the view' 


      it 'does not assign embargoed requests flagged for admin attention to
          the view' do
        attention_requested_request =
          FactoryBot.create(:attention_requested_request)
        attention_requested_request.create_embargo
        get :index, {}, { :user_id => admin_user.id }
        expect(assigns[:attention_requests]).to eq([])
        expect(assigns[:embargoed_attention_requests]).to be nil
      end

    end

    context 'when the user is a pro admin and pro is enabled' do

      it 'assigns embargoed requests that require admin to the view' 


      it 'assigns embargoed requests that have error messages to the view' 


      it 'assigns embargoed requests flagged for admin attention to the view' 


      context 'when there is nothing to do' do

        it 'assigns nothing to do to true' 


      end

      context 'when there is something to do' do

        it 'assigns nothing to do to false' 


      end
    end

  end

  describe 'GET #timeline' do

    before do
      info_request = FactoryBot.create(:info_request)
      public_body = FactoryBot.create(:public_body)
      @first_request_event = info_request.log_event('edit', {})
      public_body.name = 'Changed name'
      public_body.save!
      @first_public_body_version = public_body.versions.latest
      @second_request_event = info_request.log_event('edit', {})
      public_body.name = 'Changed name again'
      public_body.save!
      public_body.reload
      @second_public_body_version = public_body.versions.latest
      get :timeline, :all => 1
    end

    it 'assigns an array of events in order of descending date to the view' 


    it 'sets the title appropriately' 


    context 'when event_type is info_request_event' do

      before do
        get :timeline, :all => 1, :event_type => 'info_request_event'
      end

      it 'assigns an array of info request events in order of descending
          date to the view' do
        expect(assigns[:events].first.first).to eq(@second_request_event)
        expect(assigns[:events].second.first).to eq(@first_request_event)
      end

      it 'sets the title appropriately' 

    end

    context 'when event_type is authority_change' do

      before do
        get :timeline, :all => 1, :event_type => 'authority_change'
      end

      it 'assigns an array of public body versions in order of descending
          date to the view' do
        expect(assigns[:events].first.first).to eq(@second_public_body_version)
        expect(assigns[:events].second.first).to eq(@first_public_body_version)
      end

      it 'sets the title appropriately' 


    end

  end

  describe 'GET #stats' do

    it 'assigns the number of public bodies to the view' 


    it 'assigns the number of requests to the view' 


    it 'assigns the number of users to the view' 


    it 'assigns the number of tracks to the view' 


    it 'assigns the number of comments to the view' 


    it 'assigns a Hash with grouped counts of requests by state to the view' 


    it 'assigns a Hash with grouped counts of tracks by type to the view' 


  end
end


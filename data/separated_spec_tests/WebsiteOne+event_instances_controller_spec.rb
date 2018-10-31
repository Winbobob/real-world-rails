require 'spec_helper'

describe EventInstancesController do
  let(:params) { {id: '333', host_id: 'host', title: 'title'} }

  before do
    allow(controller).to receive(:allowed?).and_return(true)
    allow(SlackService).to receive(:post_hangout_notification)
    request.env['HTTP_ORIGIN'] = 'http://test.com'
  end

  describe '#index' do
    before do
      FactoryBot.create_list(:event_instance, 3)
      FactoryBot.create_list(:event_instance, 3, updated: 1.hour.ago)
    end

    context 'show all hangouts/event-instances' do
      it 'assigns all hangouts' 

    end

    context 'show only live hangouts/event-instances' do
      it 'assigns live hangouts' 

    end
  end

  describe '#update' do
    before do
      allow_any_instance_of(EventInstance).to receive(:update).and_return('true')
    end

    it 'creates a hangout if there is no hangout assosciated with the event' 


    it 'updates a hangout if it is present' 


    it 'returns a success response if update is successful' 


    context 'slack notification' do
      it 'calls the SlackService to post hangout notification on successful update' 


      it 'does not call the SlackService if not update' 


      it 'does not call the SlackService if not notify' 


      it 'calls the SlackService to post yt_link on successful update' 


      it 'does not call the SlackService to post yt_link if not update' 


      it 'does not calls the SlackService to post yt_link if not notify' 


    end

    it 'returns a failure response if update is unsuccessful' 


    it 'redirects to event show page if the link was updated manually' 


    it 'update EventInstance with permitted params' 


    context 'required parameters are missing' do
      it 'raises exception on missing host_id' 


      it 'raises exception on missing title' 


    end
  end

  describe 'CORS handling' do
    it 'drops request if the origin is not allowed' 


    it 'sets CORS headers' 


    it 'responses OK on preflight check' 

  end

end


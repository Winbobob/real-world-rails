# -*- encoding : utf-8 -*-
require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe AdminInfoRequestEventController do

  describe 'PUT update' do
    let(:info_request_event) do
      info_request_event = FactoryGirl.create(:response_event)
    end

    describe 'when handling valid data' do

      it 'gets the info request event' 


      it 'sets the described and calculated states on the event' 


      it 'resets the last_sent_event on the info request if there is a
          subsequent follow up' do
        # create a follow up
        info_request = info_request_event.info_request
        time_travel_to(info_request.date_response_required_by) do
          outgoing_message =
            OutgoingMessage.new(:status => 'ready',
                                :message_type => 'followup',
                                :what_doing => 'normal_sort',
                                :info_request_id => info_request.id,
                                :body => "Here's the clarification.")
          outgoing_message.record_email_delivery(
            'foi@example.com',
            'example.id'
          )
          outgoing_message.save!
          put :update, :id => info_request_event
          expect(info_request.reload.date_initial_request_last_sent_at).
            to eq(Time.zone.now.to_date)
        end
      end

      it 'shows a success notice' 


      it 'redirects to the request admin page' 

    end

    it 'raises an exception if the event is not a response' 


  end

end


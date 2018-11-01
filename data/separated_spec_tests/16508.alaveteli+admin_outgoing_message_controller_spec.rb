# -*- encoding : utf-8 -*-
require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe AdminOutgoingMessageController do

  describe 'GET #edit' do

    let(:info_request) { FactoryBot.create(:info_request) }
    let(:outgoing) { info_request.outgoing_messages.first }

    it 'should be successful' 


    it 'should assign the outgoing message to the view' 


    context 'when the message is the initial outgoing message' do

      it 'sets is_initial_message to true' 


    end

    context 'when the message is not initial outgoing message' do

      it 'sets is_initial_message to false' 


    end

  end

  describe 'DELETE #destroy' do

    let(:info_request) { FactoryBot.create(:info_request) }
    let(:outgoing) do
      FactoryBot.create(:new_information_followup,
                        :info_request => info_request)
    end

    it 'finds the outgoing message' 


    context 'successfully destroying the message' do

      it 'destroys the message' 


      it 'logs an event on the info request' 


      it 'informs the user' 


      it 'redirects to the admin request page' 


    end

    context 'unsuccessfully destroying the message' do
      before do
        allow_any_instance_of(OutgoingMessage).
          to receive(:destroy).and_return(false)
      end

      it 'does not destroy the message' 


      it 'informs the user' 


      it 'redirects to the outgoing message edit page' 


    end

    context 'when the message is the initial outgoing message' do

      it 'sets is_initial_message to true' 


      it 'prevents the destruction of the message' 


    end

    context 'when the message is not initial outgoing message' do

      it 'sets is_initial_message to false' 


      it 'allows the destruction of the message' 


    end

  end

  describe 'PUT #update' do

    let(:info_request) { FactoryBot.create(:info_request) }
    let(:outgoing) { info_request.outgoing_messages.first }
    let(:default_params) do
      { :id => outgoing.id,
        :outgoing_message => { :prominence => 'hidden',
                               :prominence_reason => 'dull',
                               :body => 'changed body' } }
    end

    def make_request(params = default_params)
      post :update, params
    end

    it 'should save a change to the body of the message' 


    it 'should save the prominence of the message' 


    it 'should save a prominence reason for the message' 


    it 'should log an "edit_outgoing" event on the info_request' 


    it 'should expire the file cache for the info request' 


    context 'if the outgoing message saves correctly' do

      it 'should redirect to the admin info request view' 


      it 'should show a message that the incoming message has been updated' 


    end

    context 'if the incoming message is not valid' do

      it 'should render the edit template' 


    end

  end

end


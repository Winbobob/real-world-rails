# -*- encoding : utf-8 -*-
require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe AdminIncomingMessageController, "when administering incoming messages" do

  describe 'when destroying an incoming message' do

    before(:each) do
      basic_auth_login @request
      load_raw_emails_data
    end

    before do
      @im = incoming_messages(:useless_incoming_message)
    end

    it "destroys the raw email file" 


    it 'asks the incoming message to destroy itself' 


    it 'expires the file cache for the associated info_request' 


  end

  describe 'when redelivering an incoming message' do

    before(:each) do
      basic_auth_login @request
      load_raw_emails_data
    end

    it 'expires the file cache for the previous request' 


    it 'should succeed, even if a duplicate xapian indexing job is created' 


    it 'shouldn\'t do anything if no message_id is supplied' 



  end

  describe 'when editing an incoming message' do

    before do
      @incoming = FactoryBot.create(:incoming_message)
    end

    it 'should be successful' 


    it 'should assign the incoming message to the view' 


  end

  describe 'when updating an incoming message' do

    before do
      @incoming = FactoryBot.create(:incoming_message, :prominence => 'normal')
      @default_params = {:id => @incoming.id,
                         :incoming_message => {:prominence => 'hidden',
                                               :prominence_reason => 'dull'} }
    end

    def make_request(params=@default_params)
      post :update, params
    end

    it 'should save the prominence of the message' 


    it 'should save a prominence reason for the message' 


    it 'should log an "edit_incoming" event on the info_request' 


    it 'should expire the file cache for the info request' 


    context 'if the incoming message saves correctly' do

      it 'should redirect to the admin info request view' 


      it 'should show a message that the incoming message has been updated' 


    end

    context 'if the incoming message is not valid' do

      it 'should render the edit template' 


    end
  end

  describe "when destroying multiple incoming messages" do
    let(:request) { FactoryBot.create(:info_request) }
    let(:spam1) { FactoryBot.create(
                    :incoming_message,
                    :subject => "Buy a watch!1!!",
                    :info_request => request) }
    let(:spam2) { FactoryBot.create(
                    :incoming_message,
                    :subject => "Best cheap w@tches!!1!",
                    :info_request => request) }
    let(:spam_ids) { [spam1.id, spam2.id] }

    context "the user confirms deletion" do

      it "destroys the selected messages" 


      it 'expires the file cache for the associated info_request' 


      it "redirects back to the admin page for the request" 


      it "sets a success message in flash" 


      it "only destroys selected messages" 


      context "not all the messages can be destroyed" do

        it "set an error message in flash" 


      end

    end

    context "the user does not confirm deletion" do

      it "does not destroy the messages" 


      it "redirects back to the admin page for the request" 


    end

  end

end


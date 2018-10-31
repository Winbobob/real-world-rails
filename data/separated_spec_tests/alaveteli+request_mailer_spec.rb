# -*- encoding : utf-8 -*-
require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe RequestMailer do

  describe "when receiving incoming mail" do

    before(:each) do
      load_raw_emails_data
      ActionMailer::Base.deliveries = []
    end

    it "should append it to the appropriate request" 


    it "should store mail in holding pen and send to admin when the email is not to any information request" 


    it "puts messages with a malformed To: in the holding pen" 


    it "puts messages with the request address in Bcc: in the holding pen" 


    it "puts messages with multiple request addresses in Bcc: in the holding pen" 


    it "should parse attachments from mails sent with apple mail" 


    it "should store mail in holding pen and send to admin when the from email is empty and only authorites can reply" 


    it "should store mail in holding pen and send to admin when the from email is unknown and only authorites can reply" 


    it "should ignore mail sent to known spam addresses" 


    it "should send a notice to sender when a request is stopped
        fully for spam" do
      # mark request as anti-spam
      ir = info_requests(:fancy_dog_request)
      ir.allow_new_responses_from = 'nobody'
      ir.handle_rejected_responses = 'bounce'
      ir.save!

      # test what happens if something arrives
      expect(ir.incoming_messages.size).to eq(1) # in the fixture
      receive_incoming_mail('incoming-request-plain.email', ir.incoming_email)
      expect(ir.incoming_messages.size).to eq(1) # nothing should arrive

      # should be a message back to sender
      deliveries = ActionMailer::Base.deliveries
      expect(deliveries.size).to eq(1)
      mail = deliveries[0]
      expect(mail.to).to eq([ 'geraldinequango@localhost' ])
      expect(mail.multipart?).to eq(false)
      expect(mail.body).to include("marked to no longer receive responses")
      deliveries.clear
    end

    it "should return incoming mail to sender if not authority when a request is stopped for non-authority spam" 


    it "discards rejected responses with a malformed From: when set to bounce" 


    it "should send all new responses to holding pen if a request is marked to do so" 


    it "should destroy the messages sent to a request if marked to do so" 



    it "should not mutilate long URLs when trying to word wrap them" 


  end


  describe "when sending reminders to requesters to classify a response to their request" do

    let(:old_request) do
      InfoRequest.destroy_all
      FactoryBot.create(:old_unclassified_request)
    end

    def send_alerts
      RequestMailer.alert_new_response_reminders_internal(7, 'new_response_reminder_1')
    end

    def sent_alert_params(request, type)
      {:info_request_id => request.id,
       :user_id => request.user.id,
       :info_request_event_id => request.get_last_public_response_event_id,
       :alert_type => type}
    end

    it 'should raise an error if a request does not have a last response event id' 


    context 'if the request is embargoed' do

      it 'sends the reminder' 


    end

    context 'if an alert matching the attributes of the reminder to be sent has already been sent' do

      it 'should not send the reminder' 


    end

    context 'if no alert matching the attributes of the reminder to be sent has already been sent' do

      before do
        allow(UserInfoRequestSentAlert).to receive(:find).and_return(nil)
      end

      it 'should store the information that the reminder has been sent' 


      it 'should send the reminder' 



    end

    context "if the request has use_notifications set to true" do
      it "doesn't send the reminder" 

    end

  end

  describe "when sending mail when someone has updated an old unclassified request" do

    let(:user) do
      FactoryBot.create(:user, :name => "test name", :email => "email@localhost")
    end

    let(:public_body) { FactoryBot.create(:public_body, :name => "Test public body") }

    let(:info_request) do
      FactoryBot.create(:info_request, :user => user,
                                       :title => "Test request",
                                       :public_body => public_body,
                                       :url_title => "test_request")
    end

    let(:mail) { RequestMailer.old_unclassified_updated(info_request) }

    before do
      allow(info_request).to receive(:display_status).and_return("refused.")
    end

    it 'should have the subject "Someone has updated the status of your request"' 


    it 'should tell them what status was picked' 


    it 'should contain the request path' 


  end

  describe "when generating a fake response for an upload" do

    before do
      @foi_officer = mock_model(User, :name_and_email => "FOI officer's name and email")
      @request_user = mock_model(User)
      @public_body = mock_model(PublicBody, :name => 'Test public body')
      @info_request = mock_model(InfoRequest, :user => @request_user,
                                 :email_subject_followup => 'Re: Freedom of Information - Test request',
                                 :incoming_name_and_email => 'Someone <someone@example.org>')
    end

    it 'should should generate a "fake response" email with a reasonable subject line' 


  end

  describe "when sending a new response email" do

    let(:user) do
      FactoryBot.create(:user, :name => "test name",
                               :email => "email@localhost")
    end

    let(:public_body) do
      FactoryBot.create(:public_body, :name => "Test public body")
    end

    let(:info_request) do
      FactoryBot.create(:info_request,
                        :user => user,
                        :title => "Here is a character that needs quoting …",
                        :public_body => public_body,
                        :described_state => 'rejected',
                        :url_title => "test_request")
    end

    let(:incoming_message) do
      FactoryBot.create(:incoming_message, :info_request => info_request)
    end

    it 'should not error when sending mails requests with characters requiring quoting in the subject' 


    it 'should not create HTML entities in the subject line' 


    it 'should send pro users a signin link' 


    it 'should send normal users a direct link' 


  end

  describe "sending unclassified new response reminder alerts" do

    before(:each) do
      load_raw_emails_data
    end

    it "sends an alert" 


  end

  describe "requires_admin" do

    let(:user) do
      FactoryBot.create(:user, :name => "Bruce Jones",
                               :email => "bruce@example.com")
    end

    let(:info_request) do
      FactoryBot.create(:info_request, :user => user,
                                       :title => "It's a Test request",
                                       :url_title => "test_request",
                                       :id => 123)
    end

    before do
      info_request.described_state = 'error_message'
      info_request.save
    end

    it 'body should contain the full admin URL' 


    it "body should contain the message from the user" 


    it 'should not create HTML entities in the subject line' 


    it 'sets the "Reply-To" header header to the sender' 


    it 'sets the "Return-Path" header to the blackhole address' 


    context "when the user is not a pro" do
      it "sends the request to the normal contact address" 

    end

    context "when the user is a pro" do
      let(:pro_user) { FactoryBot.create(:pro_user) }
      let(:pro_request) { FactoryBot.create(:info_request, user: pro_user) }

      it "sends the request to the pro contact address" 

    end

  end

  describe "sending overdue request alerts", :focus => true do

    before(:each) do
      @kitten_request = FactoryBot.create(:info_request,
                                          :title => "Do you really own a kitten?")
    end

    def kitten_mails
      ActionMailer::Base.deliveries.select{ |mail| mail.body =~ /kitten/ }
    end

    it 'should not create HTML entities in the subject line' 


    it "sends an overdue alert mail to request creators" 


    it "does not send the alert if the user is banned but records it as sent" 


    it "does not resend alerts to people who've already received them" 


    it "sends alerts for requests where the last event forming the initial
          request is a followup being sent following a request for clarification" do

      # Request is waiting clarification
      @kitten_request.set_described_state('waiting_clarification')

      # Followup message is sent
      outgoing_message = OutgoingMessage.new(:status => 'ready',
                                             :message_type => 'followup',
                                             :info_request_id => @kitten_request.id,
                                             :body => 'Some text',
                                             :what_doing => 'normal_sort')

      outgoing_message.sendable?
      mail_message = OutgoingMailer.followup(
        outgoing_message.info_request,
        outgoing_message,
        outgoing_message.incoming_message_followup
      ).deliver_now
      outgoing_message.record_email_delivery(mail_message.to_addrs.join(', '), mail_message.message_id)

      outgoing_message.save!

      # Last event forming the request is now the followup
      kitten_request = InfoRequest.find(@kitten_request.id)
      expect(kitten_request.last_event_forming_initial_request.event_type).to eq('followup_sent')

      time_travel_to(31.days.from_now) do
        RequestMailer.alert_overdue_requests
        expect(kitten_mails.size).to eq(1)
        ActionMailer::Base.deliveries.clear
      end
    end

    it "sends alerts for embargoed requests" 


    it "does not send alerts for requests with use_notifications set to true" 


    context "very overdue alerts" do

      it 'should not create HTML entities in the subject line' 


      it "sends a very overdue alert mail to creators of very overdue requests" 


      it "sends very overdue alerts for embargoed requests" 


      it "does not send alerts for requests with use_notifications set to true" 


    end

  end

  describe "not_clarified_alert" do

    it 'should not create HTML entities in the subject line' 


  end

  describe "comment_on_alert" do

    it 'should not create HTML entities in the subject line' 


  end

  describe "comment_on_alert_plural" do

    it 'should not create HTML entities in the subject line' 


  end

  describe "clarification required alerts" do

    before(:each) do
      load_raw_emails_data
    end

    def force_updated_at_to_past(request)
      request.update_column(:updated_at, Time.zone.now - 5.days)
    end

    it "should send an alert" 


    it "should not send an alert to banned users" 


    it "should alert about embargoed requests" 


    it "should not send an alert for requests where use_notifications is true" 


  end

  describe "comment alerts" do
    before(:each) do
      load_raw_emails_data
    end

    it "should send an alert (once and once only)" 


    it "should not send an alert when you comment on your own request" 


    it 'should not send an alert for a comment on an external request' 


    it "should send an alert when there are two new comments" 


    it "should send alerts for comments on embargoed requests" 


  end

end


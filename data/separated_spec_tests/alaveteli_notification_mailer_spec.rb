# -*- encoding : utf-8 -*-
require 'spec_helper'

describe NotificationMailer do
  describe '#daily_summary' do
    let!(:user) { FactoryGirl.create(:user) }

    # Bodies
    let!(:public_body_1) do
      FactoryGirl.create(:public_body, name: "Ministry of fact keeping",
                                       short_name: "MOF")
    end
    let!(:public_body_2) do
      FactoryGirl.create(:public_body, name: "Minor infractions quango",
                                       short_name: "MIQ")
    end

    # Requests
    let!(:new_response_request_1) do
      FactoryGirl.create(
        :info_request,
        id: 1001,
        title: "The cost of paperclips",
        public_body: public_body_1
      )
    end
    let(:embargo_expiring_request_1) do
      FactoryGirl.create(
        :embargo_expiring_request,
        id: 1002,
        title: "Missing staplers",
        public_body: public_body_1
      )
    end
    let(:embargo_expired_request_1) do
      FactoryGirl.create(
        :embargo_expired_request,
        id: 1003,
        title: "Misdelivered letters",
        public_body: public_body_1
      )
    end
    let(:overdue_request_1) do
      FactoryGirl.create(
        :overdue_request,
        id: 1004,
        title: "Late expenses claims",
        public_body: public_body_1
      )
    end
    let(:very_overdue_request_1) do
      FactoryGirl.create(
        :very_overdue_request,
        id: 1005,
        title: "Extremely late expenses claims",
        public_body: public_body_1
      )
    end
    let!(:new_response_and_embargo_expiring_request) do
      FactoryGirl.create(
        :info_request,
        id: 1006,
        title: "Thefts of stationary",
        public_body: public_body_2
      )
    end

    # Batch requests
    let!(:new_responses_batch_request) do
      batch = FactoryGirl.create(
        :info_request_batch,
        id: 2001,
        title: "Zero hours employees",
        user: user,
        public_bodies: [public_body_1, public_body_2]
      )
      batch.create_batch!
      batch
    end
    let!(:new_responses_batch_requests) do
      new_responses_batch_request.info_requests.order(:created_at)
    end
    let!(:embargo_expiring_batch_request) do
      batch = FactoryGirl.create(
        :info_request_batch,
        id: 2002,
        title: "Employees caught stealing stationary",
        user: user,
        public_bodies: [public_body_1, public_body_2]
      )
      batch.create_batch!
      batch
    end
    let!(:embargo_expiring_batch_requests) do
      embargo_expiring_batch_request.info_requests.order(:created_at)
    end
    let!(:embargo_expired_batch_request) do
      batch = FactoryGirl.create(
        :info_request_batch,
        id: 2003,
        title: "Employee of the month awards",
        user: user,
        public_bodies: [public_body_1, public_body_2]
      )
      batch.create_batch!
      batch
    end
    let!(:embargo_expired_batch_requests) do
      embargo_expired_batch_request.info_requests.order(:created_at)
    end
    let!(:overdue_batch_request) do
      batch = FactoryGirl.create(
        :info_request_batch,
        id: 2004,
        title: "Late FOI requests",
        user: user,
        public_bodies: [public_body_1, public_body_2]
      )
      batch.create_batch!
      batch
    end
    let!(:overdue_batch_requests) do
      overdue_batch_request.info_requests.order(:created_at)
    end
    let!(:very_overdue_batch_request) do
      batch = FactoryGirl.create(
        :info_request_batch,
        id: 2005,
        title: "Ignored FOI requests",
        user: user,
        public_bodies: [public_body_1, public_body_2]
      )
      batch.create_batch!
      batch
    end
    let!(:very_overdue_batch_requests) do
      very_overdue_batch_request.info_requests.order(:created_at)
    end

    # HACK: We can't control the IDs of the requests associated with batches, so
    # create a data structure of mappings here so that we can replace keys in
    # fixture files with the ID that will end up in the URL.
    let(:batch_requests_id_mappings) do
      requests = [new_responses_batch_requests,
                  embargo_expiring_batch_requests,
                  embargo_expired_batch_requests,
                  overdue_batch_requests,
                  very_overdue_batch_requests].flatten

      data = {}

      requests.each do |request|
        key =
          "#{ request.url_title }_#{ request.public_body.url_name }_ID".upcase
        data[key] = request.id.to_s
      end

      data
    end

    # Incoming messages for new_response events
    # We need to force the ID numbers of these messages to be something known
    # so that we can predict the urls that will be included in the email
    let!(:incoming_1) do
      FactoryGirl.create(:incoming_message,
                         info_request: new_response_request_1,
                         id: 995)
    end
    let!(:incoming_2) do
      FactoryGirl.create(
        :incoming_message,
        info_request: new_response_and_embargo_expiring_request,
        id: 996)
    end
    let!(:incoming_3) do
      FactoryGirl.create(:incoming_message,
                         info_request: new_responses_batch_requests.first,
                         id: 997)
    end
    let!(:incoming_4) do
      FactoryGirl.create(:incoming_message,
                         info_request: new_responses_batch_requests.second,
                         id: 998)
    end

    # Notifications
    let!(:notification_1) do
      event = FactoryGirl.create(:response_event,
                                 incoming_message: incoming_1)
      FactoryGirl.create(:daily_notification, info_request_event: event,
                                              user: user)
    end
    let!(:notification_2) do
      event = FactoryGirl.create(:response_event,
                                 incoming_message: incoming_2)
      FactoryGirl.create(:daily_notification, info_request_event: event,
                                              user: user)
    end
    let!(:notification_3) do
      event = FactoryGirl.create(:embargo_expiring_event,
                                 info_request: embargo_expiring_request_1)
      FactoryGirl.create(:daily_notification, info_request_event: event,
                                              user: user)
    end
    let!(:notification_4) do
      event = FactoryGirl.create(
        :embargo_expiring_event,
        info_request: new_response_and_embargo_expiring_request)
      FactoryGirl.create(:daily_notification, info_request_event: event,
                                              user: user)
    end
    let!(:notification_5) do
      event = FactoryGirl.create(:overdue_event,
                                 info_request: overdue_request_1)
      FactoryGirl.create(:daily_notification, info_request_event: event,
                                              user: user)
    end
    let!(:notification_6) do
      event = FactoryGirl.create(:very_overdue_event,
                                 info_request: very_overdue_request_1)
      FactoryGirl.create(:daily_notification, info_request_event: event,
                                              user: user)
    end
    let!(:notification_7) do
      event = FactoryGirl.create(:expire_embargo_event,
                                 info_request: embargo_expired_request_1)
      FactoryGirl.create(:daily_notification, info_request_event: event,
                                              user: user)
    end
    let!(:new_response_batch_notifications) do
      notifications = []

      event_1 = FactoryGirl.create(:response_event,
                                   incoming_message: incoming_3)
      notifications << FactoryGirl.create(
        :daily_notification,
        info_request_event: event_1,
        user: user
      )

      event_2 = FactoryGirl.create(:response_event,
                                   incoming_message: incoming_4)
      notifications << FactoryGirl.create(
        :daily_notification,
        info_request_event: event_2,
        user: user
      )

      notifications
    end

    let!(:embargo_expiring_batch_notifications) do
      notifications = []

      event_1 = FactoryGirl.create(
        :embargo_expiring_event,
        info_request: embargo_expiring_batch_requests.first)
      notifications << FactoryGirl.create(
        :daily_notification,
        info_request_event: event_1,
        user: user
      )

      event_2 = FactoryGirl.create(
        :embargo_expiring_event,
        info_request: embargo_expiring_batch_requests.second)
      notifications << FactoryGirl.create(
        :daily_notification,
        info_request_event: event_2,
        user: user
      )

      notifications
    end

    let!(:embargo_expired_batch_notifications) do
      notifications = []

      event_1 = FactoryGirl.create(
        :expire_embargo_event,
        info_request: embargo_expired_batch_requests.first)
      notifications << FactoryGirl.create(
        :daily_notification,
        info_request_event: event_1,
        user: user
      )

      event_2 = FactoryGirl.create(
        :expire_embargo_event,
        info_request: embargo_expired_batch_requests.second)
      notifications << FactoryGirl.create(
        :daily_notification,
        info_request_event: event_2,
        user: user
      )

      notifications
    end

    let!(:overdue_batch_notifications) do
      notifications = []

      event_1 = FactoryGirl.create(
        :overdue_event,
        info_request: overdue_batch_requests.first
      )
      notifications << FactoryGirl.create(:daily_notification,
                                          info_request_event: event_1,
                                          user: user)

      event_2 = FactoryGirl.create(
        :overdue_event,
        info_request: overdue_batch_requests.second
      )
      notifications << FactoryGirl.create(:daily_notification,
                                          info_request_event: event_2,
                                          user: user)

      notifications
    end

    let!(:very_overdue_batch_notifications) do
      notifications = []

      event_1 = FactoryGirl.create(
        :very_overdue_event,
        info_request: very_overdue_batch_requests.first
      )
      notifications << FactoryGirl.create(:daily_notification,
                                          info_request_event: event_1,
                                          user: user)

      event_2 = FactoryGirl.create(
        :very_overdue_event,
        info_request: very_overdue_batch_requests.second
      )
      notifications << FactoryGirl.create(:daily_notification,
                                          info_request_event: event_2,
                                          user: user)

      notifications
    end

    let(:batch_notifications) do
      notifications = []
      notifications += new_response_batch_notifications
      notifications += embargo_expiring_batch_notifications
      notifications += embargo_expired_batch_notifications
      notifications += overdue_batch_notifications
      notifications += very_overdue_batch_notifications
    end

    let(:all_notifications) do
      notifications = [notification_1,
                       notification_2,
                       notification_3,
                       notification_4,
                       notification_5,
                       notification_6,
                       notification_7]
      notifications + batch_notifications
    end

    it "send the message to the right user" 


    it "send the message from the right address" 


    it "sets the right subject line" 


    it "matches the expected message" 


    it "sets reply_to headers" 


    it "sets auto-generated headers" 

  end

  describe '#instant_notification' do
    let(:notification) { FactoryGirl.create(:instant_notification) }

    it 'returns a mail message to the user' 

  end

  describe '#response_notification' do
    let(:public_body) do
      FactoryGirl.create(:public_body, name: 'Test public body')
    end
    let(:info_request) do
      FactoryGirl.create(:info_request,
                         public_body: public_body,
                         title: "Here is a character that needs quoting …")
    end
    let(:incoming_message) do
      FactoryGirl.create(:incoming_message, info_request: info_request,
                                            id: 999)
    end
    let(:info_request_event) do
      FactoryGirl.create(:response_event, info_request: info_request,
                                          incoming_message: incoming_message)
    end
    let(:notification) do
      FactoryGirl.create(:notification,
                         info_request_event: info_request_event)
    end

    context "when the subject has characters which need quoting" do
      it 'should not error' 

    end

    context "when the subject has characters which could be HTML escaped" do
      before do
        info_request.title = "Here's a request"
        info_request.save!
      end

      it 'should not create HTML entities' 

    end

    it "sends the message to the right user" 


    it "sends the message from the right address" 


    it "sets reply_to headers" 


    it "sets auto-generated headers" 


    it 'should send the expected message' 


    context "when the user is a pro user" do
      let(:pro_user) { FactoryGirl.create(:pro_user) }

      before do
        info_request.user = pro_user
        info_request.save!
      end

      it 'should send the expected message' 

    end
  end

  describe 'embargo_expiring_notification' do
    let(:public_body) do
      FactoryGirl.create(:public_body, name: 'Test public body')
    end
    let(:info_request) do
      FactoryGirl.create(:embargo_expiring_request,
                         public_body: public_body,
                         title: "Here is a character that needs quoting …")
    end
    let(:info_request_event) do
      FactoryGirl.create(:embargo_expiring_event, info_request: info_request)
    end
    let(:notification) do
      FactoryGirl.create(:notification,
                         info_request_event: info_request_event)
    end

    context "when the subject has characters which need quoting" do
      it 'should not error' 

    end

    context "when the subject has characters which could be HTML escaped" do
      before do
        info_request.title = "Here's a request"
        info_request.save!
        allow(AlaveteliConfiguration).
          to receive(:site_name).and_return("Something & something")
      end

      it 'should not create HTML entities' 

    end

    it "sends the message to the right user" 


    it "sends the message from the right address" 


    it "sets reply_to headers" 


    it "sets auto-generated headers" 


    it 'should send the expected message' 

  end

  describe 'embargo_expired_notification' do
    let(:public_body) do
      FactoryGirl.create(:public_body, name: 'Test public body')
    end

    let(:info_request) do
      FactoryGirl.create(:embargo_expired_request,
                         public_body: public_body,
                         title: 'Here is a character that needs quoting …')
    end

    let(:info_request_event) { info_request.last_embargo_expire_event }

    let(:notification) do
      FactoryGirl.create(:notification,
                         info_request_event: info_request_event)
    end

    context 'when the subject has characters which need quoting' do

      it 'should not error' 


    end

    context 'when the subject has characters which could be HTML escaped' do
      before do
        info_request.title = "Here's a request"
        info_request.save!
        allow(AlaveteliConfiguration).
          to receive(:site_name).and_return('Something & something')
      end

      it 'should not create HTML entities' 

    end

    it 'sends the message to the right user' 


    it 'sends the message from the right address' 


    it 'sets reply_to headers' 


    it 'sets auto-generated headers' 


    it 'should send the expected message' 


  end

  describe 'overdue_notification' do
    let(:public_body) do
      FactoryGirl.create(:public_body, name: 'Test public body')
    end
    let(:info_request) do
      FactoryGirl.create(:overdue_request,
                         public_body: public_body,
                         title: "Here is a character that needs quoting …")
    end
    let(:info_request_event) do
      FactoryGirl.create(:overdue_event, info_request: info_request)
    end
    let(:notification) do
      FactoryGirl.create(:notification,
                         info_request_event: info_request_event)
    end

    context "when the subject has characters which need quoting" do
      it 'should not error' 

    end

    context "when the subject has characters which could be HTML escaped" do
      before do
        info_request.title = "Here's a request"
        info_request.save!
      end

      it 'should not create HTML entities' 

    end

    it "sends the message to the right user" 


    it "sends the message from the right address" 


    it "sets reply_to headers" 


    it "sets auto-generated headers" 


    it 'should send the expected message' 

  end

  describe 'very_overdue_notification' do
    let(:public_body) do
      FactoryGirl.create(:public_body, name: 'Test public body')
    end
    let(:info_request) do
      FactoryGirl.create(:very_overdue_request,
                         public_body: public_body,
                         title: "Here is a character that needs quoting …")
    end
    let(:info_request_event) do
      FactoryGirl.create(:very_overdue_event, info_request: info_request)
    end
    let(:notification) do
      FactoryGirl.create(:notification,
                         info_request_event: info_request_event)
    end

    context "when the subject has characters which need quoting" do
      it 'should not error' 

    end

    context "when the subject has characters which could be HTML escaped" do
      before do
        info_request.title = "Here's a request"
        info_request.save!
      end

      it 'should not create HTML entities' 

    end

    it "sends the message to the right user" 


    it "sends the message from the right address" 


    it "sets reply_to headers" 


    it "sets auto-generated headers" 


    it 'should send the expected message' 

  end

  describe ".send_daily_notifications" do
    let(:now) { Time.zone.now }
    let!(:notification_1) do
      FactoryGirl.create(:daily_notification, send_after: now)
    end
    let!(:notification_2) do
      FactoryGirl.create(:daily_notification, send_after: now)
    end

    # These next three notifications test that we don't pull out users we
    # shouldn't
    let!(:future_notification) do
      FactoryGirl.create(
        :daily_notification,
        send_after: Time.zone.now + 1.hour
      )
    end
    let!(:seen_notification) do
      FactoryGirl.create(:daily_notification, seen_at: Time.zone.now)
    end
    let!(:instant_notification) { FactoryGirl.create(:instant_notification) }

    let(:expected_notifications) { [notification_1, notification_2] }

    it "calls #daily_summary for each appropriate user" 


    it "sends a mail for each expected user" 


    context "when a user has instant notifications as well as daily ones" do
      let(:info_request) do
        FactoryGirl.create(:info_request, user: notification_1.user)
      end
      let(:incoming_message) do
        FactoryGirl.create(:incoming_message, info_request: info_request)
      end
      let(:info_request_event) do
        FactoryGirl.create(:response_event,
                           incoming_message: incoming_message,
                           info_request: info_request
        )
      end
      let(:instant_notification) do
        FactoryGirl.create(:instant_notification,
                           info_request_event: info_request_event)
      end

      it "doesn't include the instant notifications in their daily email" 

    end

    context "when a user has seen notifications as well as unseen ones" do
      let(:info_request) do
        FactoryGirl.create(:info_request, user: notification_1.user)
      end
      let(:incoming_message) do
        FactoryGirl.create(:incoming_message, info_request: info_request)
      end
      let(:info_request_event) do
        FactoryGirl.create(:response_event,
                           incoming_message: incoming_message,
                           info_request: info_request
        )
      end
      let(:seen_notification) do
        FactoryGirl.create(:daily_notification,
                           info_request_event: info_request_event,
                           seen_at: Time.zone.now)
      end

      it "doesn't include the seen notifications" 

    end

    it "updates all of the notifications' seen_at timestamps" 


    it "returns true when it has done something" 


    it "returns false when it hasn't done anything" 


    context "when some notifications have expired before being sent" do
      let(:embargo_expiring_request) do
        FactoryGirl.create(:embargo_expiring_request,
                           user: notification_1.user)
      end
      let(:embargo_expiring_event) do
        FactoryGirl.create(:embargo_expiring_event,
                           info_request: embargo_expiring_request)
      end
      let(:expired_notification_1) do
        FactoryGirl.create(:notification,
                           info_request_event: embargo_expiring_event)
      end

      let(:overdue_request) { FactoryGirl.create(:overdue_request) }
      let(:overdue_event) do
        FactoryGirl.create(:overdue_event, info_request: overdue_request)
      end
      let(:expired_notification_2) do
        FactoryGirl.create(:notification, info_request_event: overdue_event)
      end

      let(:very_overdue_request) { FactoryGirl.create(:very_overdue_request) }
      let(:very_overdue_event) do
        FactoryGirl.create(:very_overdue_event,
                           info_request: very_overdue_request)
      end
      let(:expired_notification_3) do
        FactoryGirl.create(:notification,
                           info_request_event: very_overdue_event)
      end

      it "doesn't send the expired notifications" 


      it "still marks the other notifications as having been seen" 

    end
  end

  describe '.send_instant_notifications' do
    let!(:notification_1) { FactoryGirl.create(:instant_notification) }
    let!(:notification_2) { FactoryGirl.create(:instant_notification) }

    let!(:seen_notification) do
      FactoryGirl.create(:instant_notification, seen_at: Time.zone.now)
    end

    let!(:daily_notification) do
      FactoryGirl.create(:daily_notification)
    end

    it "calls .instant_notification for each notification" 


    it "sends a mail for each unseen instant notification" 


    it 'sets seen_at on the notifications' 


    it "returns true when it has done something" 


    it "returns false when it hasn't done anything" 


    context "when some notifications have expired before being sent" do
      let(:embargo_expiring_request) do
        FactoryGirl.create(:embargo_expiring_request,
                           user: notification_1.user)
      end
      let(:embargo_expiring_event) do
        FactoryGirl.create(:embargo_expiring_event,
                           info_request: embargo_expiring_request)
      end
      let(:expired_notification) do
        FactoryGirl.create(:instant_notification,
                           info_request_event: embargo_expiring_event)
      end

      it "doesn't send the expired notifications" 

    end
  end

  describe ".send_notifications" do
    it "calls send_daily_notifications and send_instant_notifications" 


    it "returns true if either send_xxx method returns true" 


    it "returns false if both send_xxx method return false" 

  end
end


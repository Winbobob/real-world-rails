# -*- encoding : utf-8 -*-
require 'spec_helper'

describe NotificationMailer do
  describe '#daily_summary' do
    let(:user) { FactoryBot.build(:user) }

    # Bodies
    let(:public_body_1) do
      FactoryBot.build(:public_body, name: "Ministry of fact keeping",
                                     short_name: "MOF")
    end

    let(:public_body_2) do
      FactoryBot.build(:public_body, name: "Minor infractions quango",
                                     short_name: "MIQ")
    end

    # Requests
    let(:new_response_request_1) do
      FactoryBot.build(
        :info_request,
        title: "The cost of paperclips",
        public_body: public_body_1
      )
    end

    let(:embargo_expiring_request_1) do
      FactoryBot.build(
        :embargo_expiring_request,
        title: "Missing staplers",
        public_body: public_body_1
      )
    end

    let(:embargo_expired_request_1) do
      FactoryBot.build(
        :embargo_expired_request,
        title: "Misdelivered letters",
        public_body: public_body_1
      )
    end

    let(:overdue_request_1) do
      FactoryBot.build(
        :overdue_request,
        title: "Late expenses claims",
        public_body: public_body_1
      )
    end

    let(:very_overdue_request_1) do
      FactoryBot.build(
        :very_overdue_request,
        title: "Extremely late expenses claims",
        public_body: public_body_1
      )
    end

    let(:new_response_and_embargo_expiring_request) do
      FactoryBot.build(
        :info_request,
        title: "Thefts of stationary",
        public_body: public_body_2
      )
    end

    # Batch requests
    let(:new_responses_batch_request) do
      batch = FactoryBot.create(
        :info_request_batch,
        title: "Zero hours employees",
        user: user,
        public_bodies: [public_body_1, public_body_2]
      )
      batch.create_batch!
      batch
    end

    let(:new_responses_batch_requests) do
      new_responses_batch_request.info_requests.order(:created_at)
    end

    let(:embargo_expiring_batch_request) do
      batch = FactoryBot.create(
        :info_request_batch,
        title: "Employees caught stealing stationary",
        user: user,
        public_bodies: [public_body_1, public_body_2]
      )
      batch.create_batch!
      batch
    end

    let(:embargo_expiring_batch_requests) do
      embargo_expiring_batch_request.info_requests.order(:created_at)
    end

    let(:embargo_expired_batch_request) do
      batch = FactoryBot.create(
        :info_request_batch,
        title: "Employee of the month awards",
        user: user,
        public_bodies: [public_body_1, public_body_2]
      )
      batch.create_batch!
      batch
    end

    let(:embargo_expired_batch_requests) do
      embargo_expired_batch_request.info_requests.order(:created_at)
    end

    let(:overdue_batch_request) do
      batch = FactoryBot.create(
        :info_request_batch,
        title: "Late FOI requests",
        user: user,
        public_bodies: [public_body_1, public_body_2]
      )
      batch.create_batch!
      batch
    end

    let(:overdue_batch_requests) do
      overdue_batch_request.info_requests.order(:created_at)
    end

    let(:very_overdue_batch_request) do
      batch = FactoryBot.create(
        :info_request_batch,
        title: "Ignored FOI requests",
        user: user,
        public_bodies: [public_body_1, public_body_2]
      )
      batch.create_batch!
      batch
    end

    let(:very_overdue_batch_requests) do
      very_overdue_batch_request.info_requests.order(:created_at)
    end

    # Incoming messages for new_response events
    let(:incoming_1) do
      FactoryBot.build(:incoming_message,
                       info_request: new_response_request_1)
    end

    let(:incoming_2) do
      FactoryBot.build(
        :incoming_message,
        info_request: new_response_and_embargo_expiring_request)
    end

    let(:incoming_3) do
      FactoryBot.build(:incoming_message,
                       info_request: new_responses_batch_requests.first)
    end

    let(:incoming_4) do
      FactoryBot.build(:incoming_message,
                       info_request: new_responses_batch_requests.second)
    end

    # Notifications
    let(:notification_1) do
      event = FactoryBot.build(:response_event,
                                incoming_message: incoming_1)
      FactoryBot.create(:daily_notification, info_request_event: event,
                                              user: user)
    end

    let(:notification_2) do
      event = FactoryBot.build(:response_event,
                               incoming_message: incoming_2)
      FactoryBot.create(:daily_notification, info_request_event: event,
                                             user: user)
    end

    let(:notification_3) do
      event = FactoryBot.build(:embargo_expiring_event,
                               info_request: embargo_expiring_request_1)
      FactoryBot.create(:daily_notification, info_request_event: event,
                                             user: user)
    end

    let(:notification_4) do
      event = FactoryBot.build(
        :embargo_expiring_event,
        info_request: new_response_and_embargo_expiring_request)
      FactoryBot.create(:daily_notification, info_request_event: event,
                                             user: user)
    end

    let(:notification_5) do
      event = FactoryBot.build(:overdue_event,
                               info_request: overdue_request_1)
      FactoryBot.create(:daily_notification, info_request_event: event,
                                             user: user)
    end

    let(:notification_6) do
      event = FactoryBot.build(:very_overdue_event,
                               info_request: very_overdue_request_1)
      FactoryBot.create(:daily_notification, info_request_event: event,
                                             user: user)
    end

    let(:notification_7) do
      event = FactoryBot.build(:expire_embargo_event,
                               info_request: embargo_expired_request_1)
      FactoryBot.create(:daily_notification, info_request_event: event,
                                             user: user)
    end

    # Batch Notifications
    let(:new_response_batch_notifications) do
      notifications = []

      event_1 = FactoryBot.build(:response_event,
                                 incoming_message: incoming_3)
      notifications << FactoryBot.create(
        :daily_notification,
        info_request_event: event_1,
        user: user
      )

      event_2 = FactoryBot.build(:response_event,
                                 incoming_message: incoming_4)
      notifications << FactoryBot.create(
        :daily_notification,
        info_request_event: event_2,
        user: user
      )

      notifications
    end

    let(:embargo_expiring_batch_notifications) do
      notifications = []

      event_1 = FactoryBot.build(
        :embargo_expiring_event,
        info_request: embargo_expiring_batch_requests.first)
      notifications << FactoryBot.create(
        :daily_notification,
        info_request_event: event_1,
        user: user
      )

      event_2 = FactoryBot.build(
        :embargo_expiring_event,
        info_request: embargo_expiring_batch_requests.second)
      notifications << FactoryBot.create(
        :daily_notification,
        info_request_event: event_2,
        user: user
      )

      notifications
    end

    let(:embargo_expired_batch_notifications) do
      notifications = []

      event_1 = FactoryBot.build(
        :expire_embargo_event,
        info_request: embargo_expired_batch_requests.first)
      notifications << FactoryBot.create(
        :daily_notification,
        info_request_event: event_1,
        user: user
      )

      event_2 = FactoryBot.build(
        :expire_embargo_event,
        info_request: embargo_expired_batch_requests.second)
      notifications << FactoryBot.create(
        :daily_notification,
        info_request_event: event_2,
        user: user
      )

      notifications
    end

    let(:overdue_batch_notifications) do
      notifications = []

      event_1 = FactoryBot.build(
        :overdue_event,
        info_request: overdue_batch_requests.first
      )
      notifications << FactoryBot.create(:daily_notification,
                                         info_request_event: event_1,
                                         user: user)

      event_2 = FactoryBot.build(
        :overdue_event,
        info_request: overdue_batch_requests.second
      )
      notifications << FactoryBot.create(:daily_notification,
                                         info_request_event: event_2,
                                         user: user)

      notifications
    end

    let(:very_overdue_batch_notifications) do
      notifications = []

      event_1 = FactoryBot.build(
        :very_overdue_event,
        info_request: very_overdue_batch_requests.first
      )
      notifications << FactoryBot.create(:daily_notification,
                                         info_request_event: event_1,
                                         user: user)

      event_2 = FactoryBot.build(
        :very_overdue_event,
        info_request: very_overdue_batch_requests.second
      )
      notifications << FactoryBot.create(:daily_notification,
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

    # HACK: We can't control the IDs of the requests or incoming messages create
    # a data structure of mappings here so that we can replace keys in fixture
    # files with the ID that will end up in the URL.
    let(:id_mappings) do
      all_notifications.each_with_object({}) do |notification, data|
        event = notification.info_request_event
        case event.event_type
        when 'response'
          request = event.incoming_message.info_request
          key = "#{request.url_title}_#{request.public_body.url_name}".upcase
          data["#{key}_INCOMING_ID"] = event.incoming_message.id
        else
          request = event.info_request
          key = "#{request.url_title}_#{request.public_body.url_name}".upcase
          data["#{key}_ID"] = request.id
        end
      end
    end

    it "send the message to the right user" 


    it "send the message from the right address" 


    it "sets the right subject line" 


    it "matches the expected message" 


    it "sets reply_to headers" 


    it "sets auto-generated headers" 

  end

  describe '#instant_notification' do
    let(:notification) { FactoryBot.create(:instant_notification) }

    it 'returns a mail message to the user' 

  end

  describe '#response_notification' do
    let(:public_body) do
      FactoryBot.build(:public_body, name: 'Test public body')
    end
    let(:info_request) do
      FactoryBot.build(:info_request,
                       public_body: public_body,
                       title: "Here is a character that needs quoting …")
    end
    let(:incoming_message) do
      FactoryBot.build(:incoming_message, info_request: info_request)
    end
    let(:info_request_event) do
      FactoryBot.build(:response_event, info_request: info_request,
                                        incoming_message: incoming_message)
    end
    let(:notification) do
      FactoryBot.create(:notification,
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
      let(:pro_user) { FactoryBot.create(:pro_user) }

      before do
        info_request.user = pro_user
        info_request.save!
      end

      it 'should send the expected message' 

    end
  end

  describe '#embargo_expiring_notification' do
    let(:public_body) do
      FactoryBot.build(:public_body, name: 'Test public body')
    end
    let(:info_request) do
      FactoryBot.build(:embargo_expiring_request,
                       public_body: public_body,
                       title: "Here is a character that needs quoting …")
    end
    let(:info_request_event) do
      FactoryBot.build(:embargo_expiring_event, info_request: info_request)
    end
    let(:notification) do
      FactoryBot.create(:notification,
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

  describe '#embargo_expired_notification' do
    let(:public_body) do
      FactoryBot.build(:public_body, name: 'Test public body')
    end

    let(:info_request) do
      FactoryBot.create(:embargo_expired_request,
                        public_body: public_body,
                        title: 'Here is a character that needs quoting …')
    end

    let(:info_request_event) { info_request.last_embargo_expire_event }

    let(:notification) do
      FactoryBot.create(:notification,
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

  describe '#overdue_notification' do
    let(:public_body) do
      FactoryBot.build(:public_body, name: 'Test public body')
    end
    let(:info_request) do
      FactoryBot.build(:overdue_request,
                       public_body: public_body,
                       title: "Here is a character that needs quoting …")
    end
    let(:info_request_event) do
      FactoryBot.build(:overdue_event, info_request: info_request)
    end
    let(:notification) do
      FactoryBot.create(:notification,
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

  describe '#very_overdue_notification' do
    let(:public_body) do
      FactoryBot.build(:public_body, name: 'Test public body')
    end
    let(:info_request) do
      FactoryBot.build(:very_overdue_request,
                       public_body: public_body,
                       title: "Here is a character that needs quoting …")
    end
    let(:info_request_event) do
      FactoryBot.build(:very_overdue_event, info_request: info_request)
    end
    let(:notification) do
      FactoryBot.create(:notification,
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
      FactoryBot.create(:daily_notification, send_after: now)
    end
    let!(:notification_2) do
      FactoryBot.create(:daily_notification, send_after: now)
    end

    # These next three notifications test that we don't pull out users we
    # shouldn't
    let!(:future_notification) do
      FactoryBot.create(
        :daily_notification,
        send_after: Time.zone.now + 1.hour
      )
    end
    let!(:seen_notification) do
      FactoryBot.create(:daily_notification, seen_at: Time.zone.now)
    end
    let!(:instant_notification) { FactoryBot.create(:instant_notification) }

    let(:expected_notifications) { [notification_1, notification_2] }

    it "calls #daily_summary for each appropriate user" 


    it "sends a mail for each expected user" 


    context "when a user has instant notifications as well as daily ones" do
      let(:info_request) do
        FactoryBot.build(:info_request, user: notification_1.user)
      end
      let(:incoming_message) do
        FactoryBot.build(:incoming_message, info_request: info_request)
      end
      let(:info_request_event) do
        FactoryBot.build(:response_event,
                         incoming_message: incoming_message,
                         info_request: info_request
        )
      end
      let(:instant_notification) do
        FactoryBot.create(:instant_notification,
                          info_request_event: info_request_event)
      end

      it "doesn't include the instant notifications in their daily email" 

    end

    context "when a user has seen notifications as well as unseen ones" do
      let(:info_request) do
        FactoryBot.build(:info_request, user: notification_1.user)
      end
      let(:incoming_message) do
        FactoryBot.build(:incoming_message, info_request: info_request)
      end
      let(:info_request_event) do
        FactoryBot.build(:response_event,
                         incoming_message: incoming_message,
                         info_request: info_request
        )
      end
      let(:seen_notification) do
        FactoryBot.create(:daily_notification,
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
        FactoryBot.build(:embargo_expiring_request,
                         user: notification_1.user)
      end
      let(:embargo_expiring_event) do
        FactoryBot.build(:embargo_expiring_event,
                         info_request: embargo_expiring_request)
      end
      let(:expired_notification_1) do
        FactoryBot.create(:notification,
                          info_request_event: embargo_expiring_event)
      end

      let(:overdue_request) { FactoryBot.build(:overdue_request) }
      let(:overdue_event) do
        FactoryBot.build(:overdue_event, info_request: overdue_request)
      end
      let(:expired_notification_2) do
        FactoryBot.create(:notification, info_request_event: overdue_event)
      end

      let(:very_overdue_request) { FactoryBot.build(:very_overdue_request) }
      let(:very_overdue_event) do
        FactoryBot.build(:very_overdue_event,
                         info_request: very_overdue_request)
      end
      let(:expired_notification_3) do
        FactoryBot.create(:notification,
                          info_request_event: very_overdue_event)
      end

      it "doesn't send the expired notifications" 


      it "still marks the other notifications as having been seen" 

    end
  end

  describe '.send_instant_notifications' do
    let!(:notification_1) { FactoryBot.create(:instant_notification) }
    let!(:notification_2) { FactoryBot.create(:instant_notification) }

    let!(:seen_notification) do
      FactoryBot.create(:instant_notification, seen_at: Time.zone.now)
    end

    let!(:daily_notification) do
      FactoryBot.create(:daily_notification)
    end

    it "calls .instant_notification for each notification" 


    it "sends a mail for each unseen instant notification" 


    it 'sets seen_at on the notifications' 


    it "returns true when it has done something" 


    it "returns false when it hasn't done anything" 


    context "when some notifications have expired before being sent" do
      let(:embargo_expiring_request) do
        FactoryBot.build(:embargo_expiring_request,
                         user: notification_1.user)
      end
      let(:embargo_expiring_event) do
        FactoryBot.build(:embargo_expiring_event,
                         info_request: embargo_expiring_request)
      end
      let(:expired_notification) do
        FactoryBot.create(:instant_notification,
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


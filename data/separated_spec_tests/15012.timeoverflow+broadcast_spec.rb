require 'spec_helper'

RSpec.describe PushNotifications::Broadcast do
  describe '#send_notifications' do
    let(:user) { Fabricate(:user) }
    let(:device_token) { Fabricate(:device_token, user: user) }
    let(:post) { Fabricate(:post) }
    let(:event_created) { Fabricate(:event, post: post, action: :created) }
    let(:push_notifications) { PushNotification.all }
    let(:notification) do
      {
        to: push_notification.token,
        title: push_notification.title,
        body: push_notification.body,
        data: push_notification.data
      }
    end
    let(:uri) { URI('https://exp.host/--/api/v2/push/send') }
    let(:client) { Net::HTTP.new(uri.host, uri.port) }
    let(:headers) { { "Content-Type" => "application/json" } }

    context 'when there are push notifications to send' do
      let(:push_notification) do
        Fabricate(
          :push_notification,
          event: event_created,
          device_token: device_token,
          title: 'Hola',
          body: 'Caracola',
          data: {}
        )
      end

      context 'when the HTTP response is OK' do
        let(:http_response) { Net::HTTPOK.new(1.0, 200, "OK") }

        it 'calls Expo API to send notifications' 


        it 'flags the push_notification as processed' 


        context 'when the HTTP response is not OK' do
          let(:http_response) { Net::HTTPNotFound.new(1.0, 400, "Not Found") }

          it 'raises an error' 

        end
      end
    end

    context 'when there are no push notifications to send' do
      it 'calls Expo API to send notifications' 

    end
  end
end


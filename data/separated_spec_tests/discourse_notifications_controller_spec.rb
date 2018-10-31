require 'rails_helper'

def create_notification(user_id, resp_code, matcher)
  notification_count = Notification.count
  post :create, params: { notification_type: Notification.types[:mentioned], user_id: user_id, data: { message: 'tada' }.to_json }, format: :json
  expect(response.status).to eq(resp_code)
  expect(Notification.count).send(matcher, eq(notification_count))
end

def update_notification(topic_id, resp_code, matcher)
  notification = Fabricate(:notification)
  post :update, params: { id: notification.id, topic_id: topic_id }, format: :json
  expect(response.status).to eq(resp_code)
  notification.reload
  expect(notification.topic_id).send(matcher, eq(topic_id))
end

def delete_notification(resp_code, matcher)
  notification = Fabricate(:notification)
  notification_count = Notification.count
  delete :destroy, params: { id: notification.id }, format: :json
  expect(response.status).to eq(resp_code)
  expect(Notification.count).send(matcher, eq(notification_count))
end

describe NotificationsController do

  context 'when logged in' do

    context 'as normal user' do

      let!(:user) { log_in }

      describe '#index' do
        it 'should succeed for recent' 


        it 'should succeed for history' 


        it 'should mark notifications as viewed' 


        it 'should not mark notifications as viewed if silent param is present' 


        context 'when username params is not valid' do
          it 'should raise the right error' 

        end
      end

      it 'should succeed' 


      it "can update a single notification" 


      it "updates the `read` status" 


      describe '#create' do
        it "can't create notification" 

      end

      describe '#update' do
        it "can't update notification" 

      end

      describe '#destroy' do
        it "can't delete notification" 

      end

    end

    context 'as admin' do

      let!(:admin) { log_in(:admin) }

      describe '#create' do
        it "can create notification" 

      end

      describe '#update' do
        it "can update notification" 

      end

      describe '#destroy' do
        it "can delete notification" 

      end

    end

  end

  context 'when not logged in' do

    describe '#index' do
      it 'should raise an error' 

    end

    describe '#create' do
      it "can't create notification" 

    end

    describe '#update' do
      it "can't update notification" 

    end

    describe '#destroy' do
      it "can't delete notification" 

    end

  end

end


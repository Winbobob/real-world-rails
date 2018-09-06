require 'spec_helper'

describe NotificationsController do
  let(:user) { create(:user) }
  let(:notification) { create(:notification, receiver: user) }

  before { sign_in(user) }

  describe '#index' do
    subject { get :index }
    it 'renders correct template' 

  end

  describe '#show' do
    subject { get :show, id: notification.id }
    it 'renders correct template' 

  end

  describe '#update' do
    subject { put :update, params }
    let(:params) do
      {
        id: notification.id,
        notification: {
          notification_status: 'notified'
        }
      }
    end
    let(:notification) { create(:notification, :unread, receiver: user) }

    it 'updates notification status' 


    it 'renders correct template' 

  end
end


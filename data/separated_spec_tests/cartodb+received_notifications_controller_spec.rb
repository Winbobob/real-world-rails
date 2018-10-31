require 'spec_helper_min'
require 'support/helpers'

module Carto
  describe Api::ReceivedNotificationsController do
    include HelperMethods

    before(:all) do
      @user = FactoryGirl.create(:carto_user)
      @notification = FactoryGirl.create(:notification)
    end

    after(:all) do
      @user.destroy
    end

    describe '#update' do
      before(:each) do
        @user.received_notifications.each(&:destroy)
        @received_notification = @user.received_notifications.create!(notification: @notification,
                                                                      received_at: DateTime.now)
      end

      let(:url_options) do
        {
          user_id: @user.id,
          id: @received_notification.id,
          user_domain: @user.username,
          api_key: @user.api_key
        }
      end

      it 'marks a notification as read' 


      it 'returns 422 for invalid dates' 


      it 'returns 404 if notification not found' 


      it 'returns 403 if not not logged in as user' 


      it 'returns 401 if not not logged in' 

    end
  end
end


require 'spec_helper_min'
require 'support/helpers'

module Carto
  describe Api::OrganizationNotificationsController do
    include HelperMethods

    before(:all) do
      @sequel_organization = FactoryGirl.create(:organization_with_users)
      @organization = Carto::Organization.find(@sequel_organization.id)
      @owner = @organization.owner
      @user = @organization.users.reject { |u| u.id == @organization.owner_id }.first
    end

    after(:all) do
      @organization.destroy
    end

    shared_examples_for 'requires owner authentication' do
      it 'returns 403 if organization does not exists' 


      it 'returns 403 if user is not the owner of the organization' 

    end

    describe '#create' do
      let(:valid_payload) do
        {
          organization_id: @organization.id,
          icon: Carto::Notification::ICON_ALERT,
          recipients: 'builders',
          body: 'wadus'
        }
      end

      before(:each) do
        @organization.notifications.each(&:destroy)
      end

      def create_notification_request(org_id, user, payload)
        options = { organization_id: org_id, user_domain: user.username, api_key: user.api_key }
        post_json(organization_notifications_url(options), notification: payload) { |response| yield response }
      end

      it_behaves_like 'requires owner authentication' do
        def request(org_id, user)
          create_notification_request(org_id, user, valid_payload) { |response| yield response }
        end
      end

      it 'creates a notification' 


      it 'displays validations errors' 

    end

    describe '#destroy' do
      before(:each) do
        @organization.notifications.each(&:destroy)
        @notification = @organization.notifications.create!(body: 'a', recipients: 'builders',
                                                            icon: Carto::Notification::ICON_ALERT)
      end

      def destroy_notification_request(org_id, user, notification_id)
        options = { organization_id: org_id, user_domain: user.username, api_key: user.api_key, id: notification_id }
        delete_json(organization_notification_url(options)) { |response| yield response }
      end

      it_behaves_like 'requires owner authentication' do
        def request(org_id, user)
          destroy_notification_request(org_id, user, @notification.id) { |response| yield response }
        end
      end

      it 'destroys a notification' 


      it 'returns 404 if notification is not found' 

    end
  end
end


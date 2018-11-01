require 'spec_helper'

describe NotificationSettingsController do
  let(:project) { create(:project) }
  let(:group) { create(:group, :internal) }
  let(:user) { create(:user) }

  before do
    project.add_developer(user)
  end

  describe '#create' do
    context 'when not authorized' do
      it 'redirects to sign in page' 

    end

    context 'when authorized' do
      let(:notification_setting) { user.notification_settings_for(source) }
      let(:custom_events) do
        events = {}

        NotificationSetting.email_events(source).each do |event|
          events[event.to_s] = true
        end

        events
      end

      before do
        sign_in(user)
      end

      context 'for projects' do
        let(:source) { project }

        it 'creates notification setting' 


        context 'with custom settings' do
          it 'creates notification setting' 

        end
      end

      context 'for groups' do
        let(:source) { group }

        it 'creates notification setting' 


        context 'with custom settings' do
          it 'creates notification setting' 

        end
      end
    end

    context 'not authorized' do
      let(:private_project) { create(:project, :private) }

      before do
        sign_in(user)
      end

      it 'returns 404' 

    end
  end

  describe '#update' do
    let(:notification_setting) { user.global_notification_setting }

    context 'when not authorized' do
      it 'redirects to sign in page' 

    end

    context 'when authorized' do
      before do
        sign_in(user)
      end

      it 'returns success' 


      context 'and setting custom notification setting' do
        let(:custom_events) do
          events = {}

          notification_setting.email_events.each do |event|
            events[event] = "true"
          end
        end

        it 'returns success' 

      end
    end

    context 'not authorized' do
      let(:other_user) { create(:user) }

      before do
        sign_in(other_user)
      end

      it 'returns 404' 

    end
  end
end


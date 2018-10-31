# frozen_string_literal: true
require 'rails_helper'

RSpec.describe Course::Admin::NotificationSettingsController, type: :controller do
  let(:instance) { Instance.default }
  with_tenant(:instance) do
    let(:user) { create(:user) }
    let(:course) { create(:course, creator: user) }
    let(:json_response) { JSON.parse(response.body) }
    before { sign_in(user) }

    describe '#edit' do
      subject { get :edit, params: { course_id: course } }
      it { is_expected.to render_template(:edit) }
    end

    describe '#update' do
      subject { patch :update, params: { course_id: course, notification_settings: payload } }

      context 'when valid parameters are received' do
        render_views
        let(:payload) do
          {
            'component' => 'course_announcements_component',
            'key' => 'new_announcement',
            'enabled' => false
          }
        end
        before { subject }

        it 'responds with the necessary fields' 

      end

      context 'when invalid parameters are received' do
        let(:payload) { { 'component' => 'invalid_component' } }
        it { is_expected.to have_http_status(:bad_request) }
      end
    end
  end
end


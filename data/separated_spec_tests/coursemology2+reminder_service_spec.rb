# frozen_string_literal: true
require 'rails_helper'

RSpec.describe Course::Announcement::ReminderService do
  let(:instance) { Instance.default }
  with_tenant(:instance) do
    let(:course) { create(:course) }

    describe '#opening_reminder' do
      let!(:now) { Time.zone.now }
      let(:user) { create(:course_user, course: course).user }
      let!(:announcement) { create(:course_announcement, start_at: now) }

      context 'when announcement is created' do
        it 'notify the users' 

      end
    end
  end
end


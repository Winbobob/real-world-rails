# frozen_string_literal: true
require 'rails_helper'

RSpec.describe Course::Video::ReminderService do
  let(:instance) { Instance.default }
  with_tenant(:instance) do
    let(:course) { create(:course) }

    describe '#closing_reminder' do
      let!(:now) { Time.zone.now }

      let(:user) { create(:course_user, course: course).user }
      let!(:video) { create(:video, end_at: now) }

      context 'when video is published' do
        it 'notify the users' 

      end

      context 'when video is a draft' do
        it 'does not notify the users' 


        context "when video's end_date was changed" do
          it 'does not notify the users' 

        end
      end
    end
  end
end


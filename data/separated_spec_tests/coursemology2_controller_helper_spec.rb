# frozen_string_literal: true
require 'rails_helper'

RSpec.describe Course::Achievement::ControllerHelper do
  let!(:instance) { Instance.default }
  with_tenant(:instance) do
    let(:achievement) { create(:course_achievement) }

    describe '#achievement_badge_path' do
      context 'when no achievement is provided' do
        subject { helper.achievement_badge_path }

        it 'returns the path of the default achievement badge' 

      end

      context 'when an achievement is provided' do
        subject { helper.achievement_badge_path(achievement) }

        context 'when an achievement badge is uploaded' do
          let(:icon) { Rails.root.join('spec', 'fixtures', 'files', 'picture.jpg') }
          before do
            file = File.open(icon, 'rb')
            achievement.badge = file
            file.close
          end

          it 'returns the path of the achievement badge' 

        end

        context 'when an achievement badge is not uploaded' do
          it 'returns the path of the default achievement badge' 

        end
      end
    end

    describe '#display_achievement_badge' do
      subject { helper.display_achievement_badge(achievement) }

      it 'displays the default achievement badge' 

    end

    describe '#display_locked_achievement_badge' do
      it 'displays the locked achievement badge' 

    end

    describe '#achievement_status_class' do
      subject { helper.achievement_status_class(achievement, course_user) }

      context 'when the course user is a staff member' do
        let(:course_user) { create(:course_teaching_assistant, course: achievement.course) }

        it 'returns an empty array' 

      end

      context 'when the course user is a student' do
        let(:course_user) { create(:course_student, course: achievement.course) }

        it 'returns an array with the locked class' 


        context 'when the course user obtains the achievement' do
          before do
            create(:course_user_achievement, achievement: achievement, course_user: course_user)
          end

          it 'returns an array with the granted class' 

        end
      end
    end
  end
end


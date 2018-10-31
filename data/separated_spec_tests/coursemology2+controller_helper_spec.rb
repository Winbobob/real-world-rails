# frozen_string_literal: true
require 'rails_helper'

RSpec.describe Course::ControllerHelper do
  let(:instance) { Instance.default }
  with_tenant(:instance) do
    let(:course) { create(:course) }
    before(:all) do
      # This is to fix https://github.com/rspec/rspec-rails/issues/1483
      Course::ControllerHelper.include ApplicationHelper
    end
    before(:each) do
      # This is to mock a Course::ComponentController
      test = self
      controller.define_singleton_method(:current_course) { test.course }
      helper.singleton_class.class_eval do
        delegate :current_course, :current_component_host, to: :controller
      end
    end

    describe '#display_course_user' do
      let(:user) { build(:course_user, course: course) }
      subject { helper.display_course_user(user) }

      it "displays the user's course name" 

    end

    describe '#display_user' do
      let(:user) { create(:user, name: 'user') }
      let(:course_user) { create(:course_user, course: course, user: user, name: 'course_user') }
      subject { helper.display_user(user) }

      context 'when the given user is a course_user in the current course' do
        it 'returns the name of the course user' 

      end

      context 'when the given user is not a course_user in the current course' do
        it 'returns the name of the user' 

      end
    end

    describe '#link_to_course_user' do
      let(:user) { create(:course_student, course: course) }
      subject { helper.link_to_course_user(user) }

      it { is_expected.to have_tag('a') }

      context 'when no block is given' do
        it { is_expected.to include(helper.display_course_user(user)) }
      end

      context 'when a block is given' do
        subject do
          helper.link_to_course_user(user) do
            'Test'
          end
        end

        it { is_expected.to include('Test') }
      end
    end

    describe '#link_to_user' do
      subject { helper.link_to_user(user) }

      context 'when a CourseUser is given' do
        let(:user) { create(:course_user) }

        it { is_expected.to eq(helper.link_to_course_user(user)) }
      end

      context 'when a User is given' do
        let(:user) { create(:user) }

        it { is_expected.to include(user.name) }

        context 'when the user is enrolled in course' do
          let!(:course_user) { create(:course_user, course: course, user: user) }

          it { is_expected.to eq(helper.link_to_course_user(course_user)) }
        end
      end
    end

    describe '#display_course_user_badge' do
      let(:user) { create(:course_user, course: course) }
      subject { helper.display_course_user_badge(user) }

      context 'when the levels component is enabled in the course' do
        before do
          controller.define_singleton_method(:current_component_host) do
            { course_achievements_component: nil,
              course_levels_component: 'foo' }
          end
        end

        context 'when course user has experience points' do
          before do
            create(:course_level, course: course, experience_points_threshold: 100)
            create(:course_level, course: course, experience_points_threshold: 200)
            create(:course_experience_points_record, points_awarded: 140, course_user: user)
          end

          it "shows the course user's level and experience points" 


          it 'displays the progress bar with current level progress' 


          context 'when course user is at the max level' do
            before do
              create(:course_experience_points_record, points_awarded: 1000, course_user: user)
            end

            it 'shows the max level message' 

          end

          context 'when course user is not at the max level' do
            it 'shows the next level message' 

          end
        end
      end

      context 'when the achievements component is enabled in the course' do
        before do
          controller.define_singleton_method(:current_component_host) do
            { course_achievements_component: 'bar',
              course_levels_component: nil }
          end
        end

        context 'when course user has more than 3 achievements' do
          before { create_list(:course_user_achievement, 4, course_user: user) }

          it "displays the achievement tab with the course user's achievement count" 

        end
      end

      context 'when levels and achievement components are disabled' do
        before do
          controller.define_singleton_method(:current_component_host) do
            { course_achievements_component: nil,
              course_levels_component: nil }
          end
        end

        it 'does not display the level of the course user' 


        it 'does not display the achievement tab' 

      end
    end

    describe '#display_course_logo' do
      subject { helper.display_course_logo(course) }

      context 'when no course logo is uploaded' do
        it 'displays the default course logo' 

      end

      context 'when a course logo is uploaded' do
        let(:logo) { File.join(Rails.root, '/spec/fixtures/files/picture.jpg') }
        before do
          file = File.open(logo, 'rb')
          course.logo = file
          file.close
        end

        it 'displays the course logo' 

      end
    end
  end
end


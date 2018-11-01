#
# Copyright (C) 2015 - present Instructure, Inc.
#
# This file is part of Canvas.
#
# Canvas is free software: you can redistribute it and/or modify it under
# the terms of the GNU Affero General Public License as published by the Free
# Software Foundation, version 3 of the License.
#
# Canvas is distributed in the hope that it will be useful, but WITHOUT ANY
# WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR
# A PARTICULAR PURPOSE. See the GNU Affero General Public License for more
# details.
#
# You should have received a copy of the GNU Affero General Public License along
# with this program. If not, see <http://www.gnu.org/licenses/>.
#

require File.expand_path(File.dirname(__FILE__) + '/../api_spec_helper')

describe SisApiController, type: :request do
  def enable_bulk_grade_export
    context.root_account.enable_feature!(:bulk_sis_grade_export)
  end

  def install_post_grades_tool
    context.context_external_tools.create!(
      name: 'test post grades tool',
      domain: 'http://example.com/lti',
      consumer_key: 'key',
      shared_secret: 'secret',
      settings: { post_grades: { url: 'http://example.com/lti/post_grades' } }
    )
  end

  describe '#sis_assignments' do
    context 'for an account' do
      before :once do
        account_model
        @account.root_account = Account.default
        @account.save
        account_admin_user(account: @account, active_all: true)
      end

      # courses
      let_once(:course1) { course_factory(account: @account) } # unpublished
      let_once(:course2) { course_factory(account: @account, active_all: true) }
      let_once(:course3) { course_factory(account: @account, active_all: true) }

      # non-postable assignments
      let_once(:assignment1)  { course1.assignments.create!(post_to_sis: true) } # unpublished course
      let_once(:assignment2)  { course1.assignments.create!(post_to_sis: false) } # unpublished course
      let_once(:assignment3)  { course2.assignments.create!(post_to_sis: false) } # post_to_sis: false
      let_once(:assignment4)  { course3.assignments.create!(post_to_sis: false) } # post_to_sis: false
      let_once(:assignment5)  { course1.assignments.create!(post_to_sis: true).tap(&:unpublish!) } # unpublished
      let_once(:assignment6)  { course2.assignments.create!(post_to_sis: true).tap(&:unpublish!) } # unpublished
      let_once(:assignment7)  { course3.assignments.create!(post_to_sis: true).tap(&:unpublish!) } # unpublished

      # postable assignments
      let_once(:assignment8)  { course2.assignments.create!(post_to_sis: true) }
      let_once(:assignment9)  { course2.assignments.create!(post_to_sis: true) }
      let_once(:assignment10) { course3.assignments.create!(post_to_sis: true) }
      let_once(:assignment11) { course3.assignments.create!(post_to_sis: true) }

      let(:context) { @account }

      before do
        user_session(@user)
      end

      it 'requires :bulk_sis_grade_export feature to be enabled or post_grades tool to be installed' 


      shared_examples 'account sis assignments api' do
        it 'requires :view_all_grades permission' 


        it 'returns paginated assignment list' 


        it "should return courses starting before starts_before" 


        it "should return courses concluding after ends_after" 


        it 'accepts a sis_id as the account id' 

      end

      context 'with :bulk_sis_grade_export feature enabled' do
        before do
          enable_bulk_grade_export
        end

        include_examples 'account sis assignments api'
      end

      context 'with a post_grades tool installed' do
        before do
          install_post_grades_tool
        end

        include_examples 'account sis assignments api'
      end
    end

    context 'for an unpublished course' do
      before :once do
        course_factory
        account_admin_user(account: @course.root_account, active_all: true)
      end

      let(:context) { @course }

      before do
        user_session(@user)
      end

      shared_examples 'unpublished course sis assignments api' do
        it 'requires the course to be published' 

      end

      context 'with :bulk_sis_grade_export feature enabled' do
        before do
          enable_bulk_grade_export
        end

        include_examples 'unpublished course sis assignments api'
      end

      context 'with a post_grades tool installed' do
        before do
          install_post_grades_tool
        end

        include_examples 'unpublished course sis assignments api'
      end
    end

    context 'for a published course' do
      before :once do
        course_factory(active_all: true)
        account_admin_user(account: @course.root_account, active_all: true)
      end

      # non-postable assignments
      let_once(:assignment1) { @course.assignments.create!(post_to_sis: false) } # post_to_sis: false
      let_once(:assignment2) { @course.assignments.create!(post_to_sis: false) } # post_to_sis: false
      let_once(:assignment3) { @course.assignments.create!(post_to_sis: true).tap(&:unpublish!) } # unpublished

      # postable assignments
      let_once(:assignment4) { @course.assignments.create!(post_to_sis: true) }
      let_once(:assignment5) { @course.assignments.create!(post_to_sis: true) }
      let_once(:assignment6) { @course.assignments.create!(post_to_sis: true) }
      let_once(:assignment7) { @course.assignments.create!(post_to_sis: true) }
      let_once(:assignment8) { @course.assignments.create!(post_to_sis: true) }

      let_once(:active_override7) do
        assignment7.assignment_overrides.build.tap do |override|
          override.title = 'Active Override'
          override.override_due_at(3.days.from_now)
          override.set_type = 'CourseSection'
          override.set_id = assignment7.context.course_sections.first.id
          override.save!
        end
      end
      let_once(:inactive_override8) do
        assignment8.assignment_overrides.build.tap do |override|
          override.title = 'Inactive Override'
          override.override_due_at(3.days.from_now)
          override.set_type = 'CourseSection'
          override.set_id = assignment8.context.course_sections.first.id
          override.save!
          override.destroy
        end
      end

      let_once(:inactive_section8) do
        @course.course_sections.create!(name: 'Inactive Section').tap(&:destroy)
      end

      let(:context) { @course }

      before do
        user_session(@user)
      end

      it 'requires :bulk_sis_grade_export feature to be enabled or post_grades tool to be installed' 


      shared_examples 'course sis assignments api' do
        it 'requires :view_all_grades permission' 


        it 'returns paginated assignment list' 


        it 'should return an assignment with an override' 


        it 'does not return assignments with inactive overrides' 


        it 'does not return inactive sections' 


        it 'accepts a sis_id as the course id' 

      end

      context 'with :bulk_sis_grade_export feature enabled' do
        before do
          enable_bulk_grade_export
        end

        include_examples 'course sis assignments api'
      end

      context 'with a post_grades tool installed' do
        before do
          install_post_grades_tool
        end

        include_examples 'course sis assignments api'
      end
    end
  end
end


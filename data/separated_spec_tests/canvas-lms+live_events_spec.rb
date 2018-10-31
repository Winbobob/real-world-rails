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

require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper.rb')

describe Canvas::LiveEvents do
  # The only methods tested in here are ones that have any sort of logic happening.

  def expect_event(event_name, event_body, event_context = nil)
    expect(LiveEvents).to receive(:post_event).with(
      event_name: event_name,
      payload: event_body,
      time: anything,
      context: event_context
    )
  end

  context 'when using a custom stream client' do

    class FakeSettings
      def call
        {
          'kinesis_stream_name' => 'fake_stream',
          'aws_region' => 'us-east-1'
        }
      end
    end

    class FakeStreamClient
      attr_accessor :data

      def put_record(stream_name:, data:, partition_key:) # rubocop:disable Lint/UnusedMethodArgument
        @data = JSON.parse(data)
      end

      def body
        @data['body']
      end
    end

    it 'sends the event message with the injected client' 

  end

  describe '.amended_context' do
    it 'pulls the context from the canvas context' 


    it 'omits root_account fields in user context' 

  end

  describe ".enrollment_updated" do
    it "should not include associated_user_id for non-observer enrollments" 


    it "should include nil associated_user_id for unassigned observer enrollment" 


    it "should include non-nil associated_user_id for assigned observer enrollment" 

  end

  describe '.group_category_created' do
    it 'should include the context' 

  end

  describe '.group_category_updated' do
    it 'should include the context' 

  end

  describe ".group_updated" do
    it "should include the context" 


    it "should include the account" 


    it "should include the workflow_state" 

  end

  describe ".group_membership_updated" do
    it "should include the workflow_state" 

  end

  describe ".wiki_page_updated" do
    before(:each) do
      course_with_teacher
      @page = @course.wiki_pages.create(:title => "old title", :body => "old body")
    end

    def wiki_page_updated
      Canvas::LiveEvents.wiki_page_updated(@page, @page.title_changed? ? @page.title_was : nil, @page.body_changed? ? @page.body_was : nil)
    end

    it "should not set old_title or old_body if they don't change" 


    it "should set old_title if the title changed" 


    it "should set old_body if the body changed" 

  end

  describe ".grade_changed" do
    let(:course_context) do
      hash_including(
        root_account_uuid: @course.root_account.uuid,
        root_account_id: @course.root_account.global_id.to_s,
        root_account_lti_guid: @course.root_account.lti_guid.to_s,
        context_id: @course.global_id.to_s,
        context_type: 'Course'
      )
    end

    it "should set the grader to nil for an autograded quiz" 


    it "should set the grader when a teacher grades an assignment" 


    it "should include the user_id and assignment_id" 


    it "should include the student_sis_id if present" 


    it "should include previous score attributes" 


    it "should include previous points_possible attributes" 


    it "includes course context even when global course context unset" 


    it "includes existing context when global course context overridden" 


    context "grading_complete" do
      before do
        course_with_student_submissions
      end

      let(:submission) { @course.assignments.first.submissions.first }

      it "is false when submission is not graded" 


      it "is true when submission is fully graded" 


      it "is false when submission is partially graded" 

    end

    context "muted" do
      before do
        course_with_student_submissions
      end

      let(:submission) { @course.assignments.first.submissions.first }

      it "is true when assignment is muted" 

    end
  end

  context 'submissions' do
    let(:submission) do
      course_with_student_submissions
      @student.update(lti_context_id: SecureRandom.uuid)
      s = @course.assignments.first.submissions.first
      s.update(lti_user_id: @student.lti_context_id)
      s
    end

    let(:group) do
      Group.create!(
        name: 'test group',
        workflow_state: 'available',
        context: submission.assignment.course
      )
    end

    before { submission }

    describe ".submission_created" do
      it "should include the user_id and assignment_id" 


      it 'should include the group_id if assignment is a group assignment' 

    end

    describe ".submission_updated" do
      it "should include the user_id and assignment_id" 


      it 'should include the group_id if assignment is a group assignment' 

    end

    describe '.plagiarism_resubmit' do
      it "should include the user_id and assignment_id" 


      it 'should include the group_id if assignment is a group assignment' 

    end
  end

  describe ".asset_access" do
    it "should trigger a live event without an asset subtype" 


    it "should trigger a live event with an asset subtype" 

  end

  describe '.assignment_created' do
    it 'triggers a live event with assignment details' 

  end

  describe '.assignment_updated' do
    it 'triggers a live event with assignment details' 

  end

  describe '.quiz_export_complete' do
    class FakeExport
      attr_accessor :context

      def initialize(context)
        @context = context
      end

      def settings
        {
          quizzes2: {
            key1: 'val1',
            key2: 'val2'
          }
        }
      end
    end

    let(:content_export) { FakeExport.new(course_model) }

    it 'triggers a live event with content export settings and amended context details' 

  end

  describe '.content_migration_completed' do
    let(:course) { course_factory() }
    let(:migration) { ContentMigration.create!(:context => course) }

    before do
      migration.migration_settings[:import_quizzes_next] = true
    end

    it 'sent events with expected payload' 

  end

  describe '.course_section_created' do
    it 'should trigger a course section creation live event' 

  end

  describe '.course_section_updated' do
    it 'should trigger a course section creation live event' 

  end

  describe '.logged_in' do
    it 'triggers a live event with user details' 

  end

  describe '.quizzes_next_quiz_duplicated' do
    it 'should trigger a quiz duplicated live event' 

  end

  describe '.module_created' do
    it 'should trigger a context module created live event' 

  end

  describe '.module_updated' do
    it 'should trigger a context module updated live event' 

  end

  describe '.module_item_created' do
    it 'should trigger a context module item created live event' 

  end

  describe '.module_item_updated' do
    it 'should trigger a context module updated live event' 

  end

  describe '.course_completed' do
    it 'should trigger a course completed live event' 

  end
end


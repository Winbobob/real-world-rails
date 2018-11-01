# encoding: utf-8
#
# Copyright (C) 2011 - present Instructure, Inc.
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

require File.expand_path(File.dirname(__FILE__) + '/../sharding_spec_helper')

describe GradebooksController do
  before :once do
    course_with_teacher active_all: true
    @teacher_enrollment = @enrollment
    student_in_course active_all: true
    @student_enrollment = @enrollment

    user_factory(active_all: true)
    @observer = @user
    @oe = @course.enroll_user(@user, 'ObserverEnrollment')
    @oe.accept
    @oe.update_attribute(:associated_user_id, @student.id)
  end

  it "uses GradebooksController" 


  describe "GET 'grade_summary'" do
    it "redirects to the login page if the user is logged out" 


    it "redirects teacher to gradebook" 


    it "renders for current user" 


    it "does not allow access for inactive enrollment" 


    it "renders with specified user_id" 


    it "does not allow access for wrong user" 


    it "allows access for a linked observer" 


    it "does not allow access for a linked student" 


    it "does not allow access for an observer linked in a different course" 


    it "allows concluded teachers to see a student grades pages" 


    it "allows concluded students to see their grades pages" 


    it "gives a student the option to switch between courses" 


    it "does not give a teacher the option to switch between courses when viewing a student's grades" 


    it "does not give a linked observer the option to switch between courses when viewing a student's grades" 


    it "assigns assignment group values for grade calculator to ENV" 


    it "does not include assignment discussion information in grade calculator ENV data" 


    it "includes assignment sort options in the ENV" 


    it "includes the current assignment sort order in the ENV" 


    it "includes the current grading period id in the ENV" 


    it "includes courses_with_grades, with each course having an id, nickname, and URL" 


    it "includes the URL to save the assignment order in the ENV" 


    it "includes the students for the grade summary page in the ENV" 


    it "includes muted assignments" 


    it "does not leak muted scores" 


    it "includes necessary attributes on the submissions" 


    it 'returns submissions of even inactive students' 


    context "assignment sorting" do
      let!(:teacher_session) { user_session(@teacher) }
      let!(:assignment1) { @course.assignments.create(title: "Banana", position: 2) }
      let!(:assignment2) { @course.assignments.create(title: "Apple", due_at: 3.days.from_now, position: 3) }
      let!(:assignment3) do
        assignment_group = @course.assignment_groups.create!(position: 2)
        @course.assignments.create!(
          assignment_group: assignment_group, title: "Carrot", due_at: 2.days.from_now, position: 1
        )
      end
      let(:assignment_ids) { assigns[:presenter].assignments.select{ |a| a.class == Assignment }.map(&:id) }

      it "sorts assignments by due date (null last), then title if there is no saved order preference" 


      it "sort order of 'due_at' sorts by due date (null last), then title" 


      context "sort by: title" do
        let!(:teacher_setup) do
          @teacher.preferences[:course_grades_assignment_order] = { @course.id => :title }
          @teacher.save!
        end

        it "sorts assignments by title" 


        it "ingores case" 

      end

      it "sort order of 'assignment_group' sorts by assignment group position, then assignment position" 


      context "sort by: module" do
        let!(:first_context_module) { @course.context_modules.create! }
        let!(:second_context_module) { @course.context_modules.create! }
        let!(:assignment1_tag) do
          a1_tag = assignment1.context_module_tags.new(context: @course, position: 1, tag_type: 'context_module')
          a1_tag.context_module = second_context_module
          a1_tag.save!
        end

        let!(:assignment2_tag) do
          a2_tag = assignment2.context_module_tags.new(context: @course, position: 3, tag_type: 'context_module')
          a2_tag.context_module = first_context_module
          a2_tag.save!
        end

        let!(:assignment3_tag) do
          a3_tag = assignment3.context_module_tags.new(context: @course, position: 2, tag_type: 'context_module')
          a3_tag.context_module = first_context_module
          a3_tag.save!
        end

        let!(:teacher_setup) do
          @teacher.preferences[:course_grades_assignment_order] = { @course.id => :module }
          @teacher.save!
        end

        it "sorts by module position, then context module tag position" 


        it "sorts by module position, then context module tag position, " \
        "with those not belonging to a module sorted last" do
          assignment3.context_module_tags.first.destroy!
          get 'grade_summary', params: {course_id: @course.id, id: @student.id}
          expect(assignment_ids).to eq [assignment2, assignment1, assignment3].map(&:id)
        end
      end
    end

    context "with grading periods" do
      let(:group_helper)  { Factories::GradingPeriodGroupHelper.new }
      let(:period_helper) { Factories::GradingPeriodHelper.new }

      before :once do
        @grading_period_group = group_helper.create_for_account(@course.root_account, weighted: true)
        term = @course.enrollment_term
        term.grading_period_group = @grading_period_group
        term.save!
        @grading_periods = period_helper.create_presets_for_group(@grading_period_group, :past, :current, :future)
      end

      it "does not display totals if 'All Grading Periods' is selected" 


      it "assigns grading period values for grade calculator to ENV" 


      it "displays totals if any grading period other than 'All Grading Periods' is selected" 


      it "includes the grading period group (as 'set') in the ENV" 


      it "includes grading periods within the group" 


      it "includes necessary keys with each grading period" 


      it 'is ordered by start_date' 

    end

    context "with assignment due date overrides" do
      before :once do
        @assignment = @course.assignments.create(:title => "Assignment 1")
        @due_at = 4.days.from_now
      end

      def check_grades_page(due_at)
        [@student, @teacher, @observer].each do |u|
          controller.js_env.clear
          user_session(u)
          get 'grade_summary', params: {:course_id => @course.id, :id => @student.id}
          assignment_due_at = assigns[:presenter].assignments.find{|a| a.class == Assignment}.due_at
          expect(assignment_due_at.to_i).to eq due_at.to_i
        end
      end

      it "reflects section overrides" 


      it "shows the latest section override in student view" 


      it "reflects group overrides when student is a member" 


      it "does not reflect group overrides when student is not a member" 


      it "reflects ad-hoc overrides" 


      it "uses the latest override" 

    end

    it "raises an exception on a non-integer :id" 

  end

  describe "GET 'show'" do
    let(:gradebook_options) { controller.js_env.fetch(:GRADEBOOK_OPTIONS) }

    context "as an admin with new gradebook disabled" do
      before :each do
        account_admin_user(account: @course.root_account)
        user_session(@admin)
      end

      it "renders default gradebook when preferred with 'default'" 


      it "renders default gradebook when preferred with '2'" 


      it "renders screenreader gradebook when preferred with 'individual'" 


      it "renders screenreader gradebook when preferred with 'srgb'" 


      it "renders default gradebook when user has no preference" 


      it "ignores the parameter version when not in development" 

    end

    context "as an admin with new gradebook enabled" do
      before :each do
        account_admin_user(account: @course.root_account)
        user_session(@admin)
        @course.enable_feature!(:new_gradebook)
      end

      it "renders new default gradebook when preferred with 'default'" 


      it "renders new default gradebook when preferred with '2'" 


      it "renders new screenreader gradebook when preferred with 'individual'" 


      it "renders new screenreader gradebook when preferred with 'srgb'" 


      it "renders new default gradebook when user has no preference" 


      it "ignores the parameter version when not in development" 

    end

    context "in development with new gradebook disabled and requested version is 'default'" do
      before :each do
        account_admin_user(account: @course.root_account)
        user_session(@admin)
        @admin.preferences[:gradebook_version] = "individual"
        allow(Rails.env).to receive(:development?).and_return(true)
      end

      it "renders new default gradebook when new_gradebook param is 'true'" 


      it "renders old default gradebook when new_gradebook param is 'false'" 


      it "renders old default gradebook when new_gradebook param is not provided" 

    end

    context "in development with new gradebook disabled and requested version is 'individual'" do
      before :each do
        account_admin_user(account: @course.root_account)
        user_session(@admin)
        @admin.preferences[:gradebook_version] = "default"
        allow(Rails.env).to receive(:development?).and_return(true)
      end

      it "renders new screenreader gradebook when new_gradebook param is 'true'" 


      it "renders old screenreader gradebook when new_gradebook param is 'false'" 


      it "renders old screenreader gradebook when new_gradebook param is not provided" 

    end

    context "in development with new gradebook enabled and requested version is 'default'" do
      before :each do
        @course.enable_feature!(:new_gradebook)
        account_admin_user(account: @course.root_account)
        user_session(@admin)
        @admin.preferences[:gradebook_version] = "individual"
        allow(Rails.env).to receive(:development?).and_return(true)
      end

      it "renders new default gradebook when new_gradebook param is 'true'" 


      it "renders old default gradebook when new_gradebook param is 'false'" 


      it "renders new default gradebook when new_gradebook param is not provided" 

    end

    context "in development with new gradebook enabled and requested version is 'individual'" do
      before :each do
        @course.enable_feature!(:new_gradebook)
        account_admin_user(account: @course.root_account)
        user_session(@admin)
        @admin.preferences[:gradebook_version] = "default"
        allow(Rails.env).to receive(:development?).and_return(true)
      end

      it "renders new screenreader gradebook when new_gradebook param is 'true'" 


      it "renders old screenreader gradebook when new_gradebook param is 'false'" 


      it "renders new screenreader gradebook when new_gradebook param is not provided" 

    end

    describe 'js_env' do
      before :each do
        user_session(@teacher)
      end

      describe "default_grading_standard" do
        it "uses the course's grading standard" 


        it "uses the Canvas default grading standard if the course does not have one" 

      end

      it "includes colors if New Gradebook is enabled" 


      it "does not include colors if New Gradebook is disabled" 


      it "includes late_policy if New Gradebook is enabled" 


      it "does not include late_policy if New Gradebook is disabled" 


      it "includes grading_schemes when New Gradebook is enabled" 


      it "does not include grading_schemes when New Gradebook is disabled" 


      it 'includes api_max_per_page' 


      context "publish_to_sis_enabled" do
        before(:once) do
          @course.sis_source_id = 'xyz'
          @course.save
        end

        it "is true when the user is able to sync grades to the course SIS" 


        it "is false when the user is not allowed to publish grades" 


        it "is false when the user is not allowed to manage grades" 



        it "is false when the course is not using a SIS" 

      end

      it "includes sis_section_id on the sections even if the teacher doesn't have 'Read SIS Data' permissions" 


      describe "graded_late_submissions_exist" do
        it "is not included if New Gradebook is disabled" 


        context "New Gradebook is enabled" do
          before(:once) do
            @course.enable_feature!(:new_gradebook)
          end

          let(:assignment) do
            @course.assignments.create!(
              due_at: 3.days.ago,
              points_possible: 10,
              submission_types: "online_text_entry"
            )
          end

          let(:graded_late_submissions_exist) do
            gradebook_options.fetch(:graded_late_submissions_exist)
          end

          it "is included if New Gradebook is enabled" 


          it "is true if graded late submissions exist" 


          it "is false if late submissions exist, but they are not graded" 


          it "is false if there are no late submissions" 

        end
      end
    end

    describe "csv" do
      before :once do
        @course.assignments.create(:title => "Assignment 1")
        @course.assignments.create(:title => "Assignment 2")
      end

      before :each do
        user_session(@teacher)
      end

      shared_examples_for "working download" do
        it "does not recompute enrollment grades" 

        it "should get all the expected datas even with multibytes characters", :focus => true do
          @course.assignments.create(:title => "Déjà vu")
          exporter = GradebookExporter.new(
            @course,
            @teacher,
            { include_sis_id: true }
          )
          raw_csv = exporter.to_csv
          expect(raw_csv).to include("Déjà vu")
        end
      end

      context "with teacher that prefers Grid View" do
        before do
          @user.preferences[:gradebook_version] = "2"
        end
        include_examples "working download"
      end

      context "with teacher that prefers Individual View" do
        before do
          @user.preferences[:gradebook_version] = "srgb"
        end
        include_examples "working download"
      end
    end

    context "Individual View" do
      before do
        user_session(@teacher)
      end

      it "redirects to Grid View with a friendly URL" 


      it "redirects to Individual View with a friendly URL" 


      it "requests groups without wiki_page assignments" 

    end

    it "renders the unauthorized page without gradebook authorization" 


    context 'includes data needed by the Gradebook Action menu in ENV' do
      let(:create_proficiency) { false }
      let(:enable_non_scoring_rubrics) { false }

      before do
        user_session(@teacher)
        @proficiency = outcome_proficiency_model(@course.account) if create_proficiency
        @course.root_account.enable_feature! :non_scoring_rubrics if enable_non_scoring_rubrics

        get 'show', params: {course_id: @course.id}

        @gradebook_env = assigns[:js_env][:GRADEBOOK_OPTIONS]
      end

      it 'includes the context_allows_gradebook_uploads key in ENV' 


      it 'includes the gradebook_import_url key in ENV' 


      it "includes the context_modules_url in the ENV" 


      shared_examples_for 'returns no outcome proficiency' do
        it 'returns nil for outcome proficiency' 

      end

      context 'non-scoring rubrics feature flag disabled' do
        context 'no outcome proficiency on account' do
          include_examples 'returns no outcome proficiency'
        end

        skip 'outcome proficiency on account' do
          skip('NSRs are not being disabled properly even with the disable_feature! method')
          let(:create_proficiency) { true }

          include_examples 'returns no outcome proficiency'
        end
      end

      context 'non-scoring rubrics feature flag enabled' do
        let(:enable_non_scoring_rubrics) { true }

        context 'no outcome proficiency on account' do
          include_examples 'returns no outcome proficiency'
        end

        context 'outcome proficiency on account' do
          let(:create_proficiency) { true }

          it 'returns an outcome proficiency' 

        end
      end
    end

    context "includes student context card info in ENV" do
      before { user_session(@teacher) }

      it "includes context_id" 


      it "doesn't enable context cards when feature is off" 


      it "enables context cards when feature is on" 

    end

    context "includes relevant account settings in ENV" do
      before { user_session(@teacher) }
      let(:custom_login_id) { 'FOOBAR' }

      it 'includes login_handle_name' 

    end

    context "with grading periods" do
      let(:group_helper)  { Factories::GradingPeriodGroupHelper.new }
      let(:period_helper) { Factories::GradingPeriodHelper.new }

      before :once do
        @grading_period_group = group_helper.create_for_account(@course.root_account)
        term = @course.enrollment_term
        term.grading_period_group = @grading_period_group
        term.save!
        @grading_periods = period_helper.create_presets_for_group(@grading_period_group, :past, :current, :future)
      end

      before { user_session(@teacher) }

      it "includes the grading period group (as 'set') in the ENV" 


      it "includes grading periods within the group" 


      it "includes necessary keys with each grading period" 

    end
  end

  describe "GET 'user_ids'" do
    it "returns unauthorized if there is no current user" 


    it "returns unauthorized if the user is not authorized to manage grades" 


    it "grants authorization to teachers in active courses" 


    it "grants authorization to teachers in concluded courses" 


    it "returns an array of user ids sorted according to the user's preferences" 

  end

  describe "GET 'grading_period_assignments'" do
    before(:once) do
      @group = Factories::GradingPeriodGroupHelper.new.create_for_account(@course.account)
      @group.enrollment_terms << @course.enrollment_term
      @period1, @period2 = Factories::GradingPeriodHelper.new.create_presets_for_group(@group, :past, :current)
      @assignment1_in_gp1 = @course.assignments.create!(due_at: 3.months.ago)
      @assignment2_in_gp2 = @course.assignments.create!(due_at: 1.day.from_now)
    end

    it "returns unauthorized if there is no current user" 


    it "returns unauthorized if the user is not authorized to manage grades" 


    it "grants authorization to teachers in active courses" 


    it "grants authorization to teachers in concluded courses" 


    it "returns an array of user ids sorted according to the user's preferences" 

  end

  describe "GET 'change_gradebook_version'" do
    it 'switches to gradebook if clicked' 

  end

  describe "GET 'history'" do
    it "grants authorization to teachers in active courses" 


    it "grants authorization to teachers in concluded courses" 


    it "returns unauthorized for students" 

  end

  describe "POST 'submissions_zip_upload'" do
    it "requires authentication" 

  end

  describe "POST 'update_submission'" do
    let(:json) { JSON.parse(response.body) }

    describe "returned JSON" do
      before(:once) do
        @assignment = @course.assignments.create!(title: "Math 1.1")
        @submission = @assignment.submissions.find_by!(user: @student)
      end

      describe 'non-anonymous assignment' do
        before(:each) do
          user_session(@teacher)
          post(
            'update_submission',
            params: {
              course_id: @course.id,
              submission: {
                assignment_id: @assignment.id,
                user_id: @student.id,
                grade: 10
              }
            },
            format: :json
          )
        end

        it "includes assignment_visibility" 


        it "includes missing in submission history" 


        it "includes late in submission history" 


        it 'includes user_ids' 

      end

      describe 'anonymous assignment' do
        before(:once) do
          @assignment.update!(anonymous_grading: true)
        end

        let(:post_params) do
          {
            course_id: @course.id,
            submission: {
              assignment_id: @assignment.id,
              anonymous_id: @submission.anonymous_id,
              grade: 10
            }
          }
        end

        before { user_session(@teacher) }

        it 'works with the absence of user_id and the presence of anonymous_id' 


        it 'does not include user_ids for muted anonymous assignments' 


        it 'includes user_ids for unmuted anonymous assignments' 


        context "given a student comment" do
          before(:once) { @submission.add_comment(comment: 'a student comment', author: @student) }

          it 'includes anonymous_ids on submission_comments' 


          it 'excludes author_name on submission_comments' 

        end
      end
    end

    it "allows adding comments for submission" 


    it "allows attaching files to comments for submission" 


    context 'media comments' do
      before :each do
        user_session(@teacher)
        @assignment = @course.assignments.create!(title: 'some assignment')
        @student = @course.enroll_user(User.create!(name: 'some user'))
        post 'update_submission',
          params: {
            course_id: @course.id,
            submission: {
              assignment_id: @assignment.id,
              user_id: @student.user_id,
              media_comment_id: 'asdfqwerty',
              media_comment_type: 'audio'
            }
        }
        @media_comment = assigns[:submissions][0].submission_comments[0]
      end

      it 'allows media comments for submissions' 


      it 'includes the type in the media comment' 

    end

    it "stores attached files in instfs if instfs is enabled" 


    it "does not allow updating submissions for concluded courses" 


    it "does not allow updating submissions in other sections when limited" 


    context "moderated grading" do
      before :once do
        @assignment = @course.assignments.create!(title: "some assignment", moderated_grading: true, grader_count: 1)
        @student = @course.enroll_student(User.create!(:name => "some user"), :enrollment_state => :active).user
      end

      before :each do
        user_session(@teacher)
      end

      it "creates a provisional grade" 


      context 'when submitting a final provisional grade' do
        before(:once) do
          @assignment.update!(final_grader: @teacher)
        end

        let(:provisional_grade_params) do
          {
            course_id: @course.id,
            submission: {
              score: 66,
              comment: "not the end",
              assignment_id: @assignment.id,
              user_id: @student.id,
              provisional: true
            }
          }
        end

        let(:final_provisional_grade_params) do
          {
            course_id: @course.id,
            submission: {
              score: 77,
              comment: "THE END",
              assignment_id: @assignment.id,
              user_id: @student.id,
              final: true,
              provisional: true
            }
          }
        end

        let(:submission_json) do
          response_json = JSON.parse(response.body)
          response_json[0]['submission'].with_indifferent_access
        end

        before do
          post 'update_submission', params: provisional_grade_params, format: :json
          post 'update_submission', params: final_provisional_grade_params, format: :json
        end

        it 'returns the submitted score in the submission JSON' 


        it 'returns the submitted comments in the submission JSON' 


        it 'returns the value for grade_matches_current_submission of the submitted grade in the JSON' 

      end

      it "includes the graded anonymously flag in the provisional grade object" 


      it "doesn't create a provisional grade when the student has one already" 
      it "should create a provisional grade even if the student has one but is in the moderation set" 


      it 'creates a final provisional grade' 


      it 'does not mark the provisional grade as final when the user does not have permission to moderate' 

    end

    describe 'provisional grade error handling' do
      before(:once) do
        course_with_student(active_all: true)
        teacher_in_course(active_all: true)

        @assignment = @course.assignments.create!(
          title: 'yet another assignment',
          moderated_grading: true,
          grader_count: 1
        )
      end

      let(:submission_params) do
        { provisional: true, assignment_id: @assignment.id, user_id: @student.id, score: 1 }
      end
      let(:request_params) { {course_id: @course.id, submission: submission_params} }

      let(:response_json) { JSON.parse(response.body) }

      it 'returns an error code of MAX_GRADERS_REACHED if a MaxGradersReachedError is raised' 


      it 'returns a generic error if a GradeError is raised' 


      it 'returns a PROVISIONAL_GRADE_INVALID_SCORE error code if an invalid grade is given' 

    end
  end

  describe "GET 'speed_grader'" do
    before :once do
      @assignment = @course.assignments.create!(
        title: 'A Title', submission_types: 'online_url', grading_type: 'percent'
      )
    end

    before :each do
      user_session(@teacher)
    end

    it 'renders speed_grader template with locals' 


    it "redirects the user if course's large_roster? setting is true" 


    it "redirects if the assignment is unpublished" 


    it "does not redirect if the assignment is published" 


    describe 'js_env' do
      let(:js_env) { assigns[:js_env] }

      it 'includes lti_retrieve_url' 


      it 'includes the grading_type' 


      it 'sets new_gradebook_enabled to true if new gradebook is enabled' 


      it 'sets new_gradebook_enabled to false if new gradebook is not enabled' 


      it 'includes anonymous identities keyed by anonymous_id' 


      it 'sets can_view_audit_trail to true when the current user can view the assignment audit trail' 


      it 'sets can_view_audit_trail to false when the current user cannot view the assignment audit trail' 

    end

    it 'sets disable_unmute_assignment to false if the assignment is not muted' 


    it 'sets disable_unmute_assignment to false if assignment grades have been published' 


    it 'sets disable_unmute_assignment to true if assignment muted and grades not published' 


    describe 'current_anonymous_id' do
      before(:each) do
        user_session(@teacher)
      end

      context 'for a moderated assignment' do
        let(:moderated_assignment) do
          @course.assignments.create!(
            moderated_grading: true,
            grader_count: 1,
            final_grader: @teacher
          )
        end

        it 'is set to the anonymous ID for the viewing grader if grader identities are concealed' 


        it 'is not set if grader identities are visible' 


        it 'is not set if grader identities are concealed but grades are published' 

      end

      it 'is not set if the assignment is not moderated' 

    end
  end

  describe "POST 'speed_grader_settings'" do
    it "lets you set your :enable_speedgrader_grade_by_question preference" 


    describe 'selected_section_id preference' do
      let(:course_settings) { @teacher.reload.preferences.dig(:gradebook_settings, @course.id) }

      before(:each) do
        user_session(@teacher)
      end

      context 'when new gradebook is enabled' do
        it 'sets the selected section for the course to the passed-in value' 


        it "ensures that selected_view_options_filters includes 'sections' if a section is selected" 


        context 'when a section has previously been selected' do
          before(:each) do
            @teacher.preferences[:gradebook_settings] = {
              @course.id => {filter_rows_by: {section_id: @course.course_sections.first.id}}
            }
            @teacher.save!
          end

          it 'clears the selected section for the course if passed the value "all"' 


          it 'clears the selected section if passed an invalid value' 


          it 'clears the selected section if passed a non-active section in the course' 


          it 'clears the selected section if passed a section ID not in the course' 

        end
      end
    end
  end

  describe "POST 'save_assignment_order'" do
    it "saves the sort order in the user's preferences" 

  end

  describe '#light_weight_ags_json' do
    it 'returns the necessary JSON for GradeCalculator' 


    it 'does not return unpublished assignments' 

  end

  describe '#external_tool_detail' do
    let(:tool) do
      {
        definition_id: 123,
        name: 'test lti',
        placements: {
          post_grades: {
            canvas_launch_url: 'http://example.com/lti/post_grades',
            launch_width: 100,
            launch_height: 100
          }
        }
      }
    end

    it 'maps a tool to launch details' 

  end

  describe '#post_grades_ltis' do
    it 'maps #external_tools with #external_tool_detail' 


    it 'memoizes' 

  end

  describe '#post_grades_tools' do
    it 'returns a tools with a type of post_grades if the post_grades feature option is enabled' 


    it 'does not return a tools with a type of post_grades if the post_grades feature option is enabled' 

  end

  describe '#post_grades_feature?' do
    it 'returns false when :post_grades feature disabled for context' 


    it 'returns false when context does not allow grade publishing by user' 


    it 'returns false when #can_do is false' 


    it 'returns true when all conditions are met' 

  end

  describe "#grading_rubrics" do
    context "sharding" do
      specs_require_sharding

      it "should fetch rubrics from a cross-shard course" 

    end
  end
end


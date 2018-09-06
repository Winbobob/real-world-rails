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

require File.expand_path(File.dirname(__FILE__) + '/../api_spec_helper')
require_relative '../../sharding_spec_helper'

describe CalendarEventsApiController, type: :request do
  before :once do
    course_with_teacher(:active_all => true, :user => user_with_pseudonym(:active_user => true))
    @me = @user
  end

  context 'events' do
    expected_fields = [
      'all_context_codes', 'all_day', 'all_day_date', 'child_events', 'child_events_count', 'comments',
      'context_code', 'created_at', 'description', 'duplicates', 'end_at', 'hidden', 'html_url',
      'id', 'location_address', 'location_name', 'parent_event_id', 'start_at',
      'title', 'type', 'updated_at', 'url', 'workflow_state'
    ]
    expected_slot_fields = (expected_fields + ['appointment_group_id', 'appointment_group_url', 'can_manage_appointment_group', 'available_slots', 'participants_per_appointment', 'reserve_url', 'participant_type', 'effective_context_code'])
    expected_reservation_event_fields = (expected_fields + ['appointment_group_id', 'appointment_group_url', 'can_manage_appointment_group', 'effective_context_code', 'participant_type'])
    expected_reserved_fields = (expected_slot_fields + ['reserved', 'reserve_comments'])
    expected_reservation_fields = expected_reservation_event_fields - ['child_events']

    it 'should return events within the given date range' 


    it 'orders result set by start_at' 


    it "should default to today's events for the current user if no parameters are specified" 


    context "timezones" do
      before :once do
        @akst = ActiveSupport::TimeZone.new('Alaska')

        @e1 = @user.calendar_events.create!(:title => "yesterday in AKST", :start_at => @akst.parse('2012-01-28 21:00:00')) { |c| c.context = @user }
        @e2 = @user.calendar_events.create!(:title => "today in AKST", :start_at => @akst.parse('2012-01-29 21:00:00')) { |c| c.context = @user }
        @e3 = @user.calendar_events.create!(:title => "tomorrow in AKST", :start_at => @akst.parse('2012-01-30 21:00:00')) { |c| c.context = @user }

        @user.update_attributes! :time_zone => "Alaska"
      end

      it "shows today's events in user's timezone, even if UTC has crossed into tomorrow" 


      it "interprets user-specified date range in the user's time zone" 

    end

    it 'should sort and paginate events' 


    it 'should ignore invalid end_dates' 


    it 'should return events from up to 10 contexts by default' 


    it 'should return events from contexts up to the account limit setting' 


    it 'does not count appointment groups against the context limit' 


    it 'accepts a more compact comma-separated list of appointment group ids' 


    it 'should fail with unauthorized if provided a context the user cannot access' 


    it "should allow specifying an unenrolled but accessible context" 


    it "should allow account admins to view section-specific events" 


    it "doesn't allow account admins to view events for courses they don't have access to" 


    def public_course_query(options = {})
      yield @course if block_given?
      @course.save!
      @user = nil

      # both calls are made on a public syllabus access
      # events
      @course.calendar_events.create! :title => 'some event', :start_at => 1.month.from_now
      api_call(:get, "/api/v1/calendar_events?start_date=2012-01-01&end_date=2012-01-31&context_codes[]=course_#{@course.id}&type=event&all_events=1", {
        :controller => 'calendar_events_api', :action => 'index', :format => 'json', :type => 'event', :all_events => '1',
        :context_codes => ["course_#{@course.id}"], :start_date => '2012-01-01', :end_date => '2012-01-31'},
               options[:body_params] || {}, options[:headers] || {}, options[:opts] || {})

      # assignments
      @course.assignments.create! :title => 'teh assignment', :due_at => 1.month.from_now
      api_call(:get, "/api/v1/calendar_events?start_date=2012-01-01&end_date=2012-01-31&context_codes[]=course_#{@course.id}&type=assignment&all_events=1", {
          :controller => 'calendar_events_api', :action => 'index', :format => 'json', :type => 'assignment', :all_events => '1',
          :context_codes => ["course_#{@course.id}"], :start_date => '2012-01-01', :end_date => '2012-01-31'},
               options[:body_params] || {}, options[:headers] || {}, options[:opts] || {})
    end

    it "should not allow anonymous users to access a non-public context" 


    it "should allow anonymous users to access public context" 


    it "should allow anonymous users to access a public syllabus" 


    it "should not allow anonymous users to access a public for authenticated syllabus" 


    it 'should return undated events' 


    context 'all events' do
      before :once do
        @course.calendar_events.create(:title => 'undated')
        @course.calendar_events.create(:title => 'dated', :start_at => '2012-01-08 12:00:00')
      end

      it 'should return all events' 


      it 'should return all events, ignoring the undated flag' 


      it 'should return all events, ignoring the start_date and end_date' 

    end

    context 'appointments' do
      it 'should include appointments for teachers (with participant info)' 


      context "basic scenarios" do
        before :once do
          course_factory(active_all: true)
          @teacher = @course.admins.first
          student_in_course :course => @course, :user => @me, :active_all => true
        end

        it 'should return events from reservable appointment_groups, if specified as a context' 


        it 'should not return child_events for other students, if the appointment group doesn\'t allows it' 


        it 'should return child_events for students, if the appointment group allows it' 


        it 'should return own appointment_participant events in their effective contexts' 

      end

      context "multi-context appointment group with shared teacher" do
        before :once do
          @course1 = course_with_teacher(:active_all => true).course
          @course2 = course_with_teacher(:user => @teacher, :active_all => true).course
          @student1 = student_in_course(:course => @course1, :active_all => true).user
          @student2 = student_in_course(:course => @course2, :active_all => true).user
          @ag = AppointmentGroup.create!(:title => "something", :participants_per_appointment => 1,
                                        :new_appointments => [["2012-01-01 12:00:00", "2012-01-01 13:00:00"],
                                                              ["2012-01-01 13:00:00", "2012-01-01 14:00:00"]],
                                        :contexts => [@course1, @course2])
          @ag.publish
          @ag.appointments.first.reserve_for(@student1, @teacher)
          @ag.appointments.last.reserve_for(@student2, @teacher)
        end

        it "returns signups in multi-context appointment groups in the student's context" 


        it "counts other contexts' signups when calculating available_slots for students" 

      end

      it "excludes signups in courses the teacher isn't enrolled in" 


      context "reservations" do
        def prepare(as_student = false)
          Notification.create! :name => 'Appointment Canceled By User', :category => "TestImmediately"

          if as_student
            course_factory(active_all: true)
            @teacher = @course.admins.first
            student_in_course :course => @course, :user => @me, :active_all => true

            cc = @teacher.communication_channels.create!(path: "test_#{@teacher.id}@example.com", path_type: "email")
            cc.confirm
          end

          student_in_course(:course => @course, :user => (@other_guy = user_factory), :active_all => true)

          year = Time.now.year + 1
          @ag1 = AppointmentGroup.create!(:title => "something", :participants_per_appointment => 4, :new_appointments => [["#{year}-01-01 12:00:00", "#{year}-01-01 13:00:00", "#{year}-01-01 13:00:00", "#{year}-01-01 14:00:00"]], :contexts => [@course])
          @ag1.publish!
          @event1 = @ag1.appointments.first
          @event2 = @ag1.appointments.last

          cat = @course.group_categories.create(name: "foo")
          @group = cat.groups.create(:context => @course)
          @group.users << @me
          @group.users << @other_guy
          @other_group = cat.groups.create(:context => @course)
          @me.reload
          @ag2 = AppointmentGroup.create!(:title => "something", :participants_per_appointment => 4, :sub_context_codes => [cat.asset_string], :new_appointments => [["#{year}-01-01 12:00:00", "#{year}-01-01 13:00:00"]], :contexts => [@course])
          @ag2.publish!
          @event3 = @ag2.appointments.first

          @user = @me
        end

        context "as a student" do
          before(:once) { prepare(true) }

          it "should reserve the appointment for @current_user" 


          it "should not allow students to reserve non-appointment calendar_events" 


          it "should not allow students to reserve an appointment twice" 


          it "should cancel existing reservations if cancel_existing = true" 


          it "should should allow comments on the reservation" 


          it "should not allow students to specify the participant" 


          context "sharding" do
            specs_require_sharding

            it "should allow students to specify themselves as the participant" 

          end

          it "should notify the teacher when appointment is canceled" 


          describe "past appointments" do
            before do
              @past_ag = AppointmentGroup.create!(:title => "something", :participants_per_appointment => 4, :new_appointments => [["2012-01-01 12:00:00", "2012-01-01 13:00:00"]], :contexts => [@course])
              @past_ag.publish!
              @past_slot = @past_ag.appointments.first
            end

            it "does not allow a student to reserve a time slot in the past" 


            it "does not allow a student to delete a past reservation" 


            it "allows a teacher to delete a student's past reservation" 

          end
        end

        context "as an admin" do
          before(:once) { prepare }

          it "should allow admins to specify the participant" 


          it "should reject invalid participants" 

        end
      end

      context 'participants' do
        before :each do
          course_with_teacher(:active_all => true)
          @ag = AppointmentGroup.create!(title: "something", participants_per_appointment: 4, contexts: [@course],
            participant_visibility: "protected", new_appointments: [["2012-01-01 12:00:00", "2012-01-01 13:00:00"],
                                                                    ["2012-01-01 13:00:00", "2012-01-01 14:00:00"]])
          @ag.publish!
          @event = @ag.appointments.first
          course_with_student(course: @course, active_all: true)
          @student1 = @student
          @event.reserve_for(@student1, @student1)
          course_with_student(course: @course, active_all: true)
          @student2 = @student
          @event.reserve_for(@student2, @student2)
        end

        it 'should return participants in the same appointment group slot for a student' 


        it 'should return participants in the same appointment group slot for a teacher' 


        it 'should paginate participants' 


        it 'should not list users participating in other appointment group slots' 


        it 'should return 401 if not allowed to view participants' 

      end
    end

    it 'should get a single event' 


    it 'should enforce permissions' 


    it 'should create a new event' 


    it 'should create recurring events if options have been specified' 


    it 'should respect recurring event limit' 


    it 'should process html content in description on create' 


    it 'should update an event' 


    it 'should process html content in description on update' 


    describe 'moving events between calendars' do
      it 'moves an event from a user to a course' 


      it 'moves an event from a course to a user' 


      context 'section-specific times' do
        before :once do
          @event = @course.calendar_events.build(:title => "test", :child_event_data => [{:start_at => "2012-01-01", :end_at => "2012-01-02", :context_code => @course.default_section.asset_string}])
          @event.updating_user = @user
          @event.save!
        end

        it 'refuses to move a parent event' 


        it 'refuses to move a child event' 


        it "doesn't complain if you 'move' the event into the calendar it's already in" 

      end

      it 'refuses to move a Scheduler appointment' 


      it 'verifies the caller has permission to create the event in the destination context' 

    end

    it 'should delete an event' 


    it 'should delete the appointment group if it has no appointments' 


    it 'should api translate event descriptions' 


    it 'should api translate event descriptions in ics' 


    it "should omit assignment description in ics feed for a course" 


    it 'works when event descriptions contain paths to user attachments' 


    context "child_events" do
      let_once :event do
        event = @course.calendar_events.build(:title => 'event', :child_event_data => {"0" => {:start_at => "2012-01-01 12:00:00", :end_at => "2012-01-01 13:00:00", :context_code => @course.default_section.asset_string}})
        event.updating_user = @user
        event.save!
        event
      end

      it "should create an event with child events" 


      it "should update an event with child events" 


      it "should remove all child events" 


      it "should add the section name to a child event's title" 


      describe "visibility" do
        before(:once) do
          student_in_course(:course => @course, :active_all => true)
        end

        it "should include children of hidden events for teachers" 


        it "should omit children of hidden events for students" 

      end

      it "allows media comments in the event description" 

    end
  end

  context 'assignments' do
    expected_fields = [
      'all_day', 'all_day_date', 'assignment', 'context_code', 'created_at',
      'description', 'end_at', 'html_url', 'id', 'start_at', 'title', 'type', 'updated_at',
      'url', 'workflow_state'
    ]

    it 'should return assignments within the given date range' 


    it 'orders result set by base due_at' 


    it 'should sort and paginate assignments' 


    it 'should ignore invalid end_dates' 


    it 'should 400 for bad dates' 


    it 'should return assignments from up to 10 contexts' 


    it 'should return undated assignments' 


    it 'should mark assignments with user_submitted' 


    context 'unpublished assignments' do
      before :once do
        @course1 = @course
        course_with_teacher(:active_course => true, :active_enrollment => true, :user => @teacher)
        @course2 = @course

        @pub1 = @course1.assignments.create(:title => 'published assignment 1')
        @pub2 = @course2.assignments.create(:title => 'published assignment 2')
        [@pub1, @pub2].each { |a| a.workflow_state = 'published'; a.save! }

        @unpub1 = @course1.assignments.create(:title => 'unpublished assignment 1')
        @unpub2 = @course2.assignments.create(:title => 'unpublished assignment 2')
        [@unpub1, @unpub2].each { |a| a.workflow_state = 'unpublished'; a.save! }
      end

      context 'for teachers' do
        it 'should return all assignments' 

      end

      context 'for teachers and students' do
        before do
          @teacher_student = user_factory(active_all: true)
          teacher_enrollment = @course1.enroll_teacher(@teacher_student)
          teacher_enrollment.workflow_state = 'active'
          teacher_enrollment.save!
          @course2.enroll_student(@teacher_student, :enrollment_state => 'active')
        end

        it 'should return published assignments and all assignments for teacher contexts' 

      end

      context 'for students' do
        before do
          @teacher_student = user_factory(active_all: true)
          @course1.enroll_student(@teacher_student, :enrollment_state => 'active')
          @course2.enroll_student(@teacher_student, :enrollment_state => 'active')
        end

        it 'should return only published assignments' 

      end
    end

    context 'differentiated assignments' do
      before :once do
        Timecop.travel(Time.utc(2015)) do
          course_with_teacher(:active_course => true, :active_enrollment => true, :user => @teacher)

          @student_in_overriden_section = User.create
          @student_in_general_section = User.create

          @course.enroll_student(@student_in_general_section, :enrollment_state => 'active')
          @section = @course.course_sections.create!(name: "test section")
          student_in_section(@section, user: @student_in_overriden_section)


          @only_vis_to_o, @not_only_vis_to_o = (1..2).map{@course.assignments.create(:title => 'test assig', :workflow_state => 'published',:due_at => '2012-01-07 12:00:00')}
          @only_vis_to_o.only_visible_to_overrides = true
          @only_vis_to_o.save!
          [@only_vis_to_o, @not_only_vis_to_o].each { |a| a.workflow_state = 'published'; a.save! }

          create_section_override_for_assignment(@only_vis_to_o, {course_section: @section})
        end
      end

      context 'as a student' do
        it "only shows events for visible assignments" 

      end

      context 'as an observer' do
        before do
          @observer = User.create
          @observer_enrollment = @course.enroll_user(@observer, 'ObserverEnrollment', :section => @section2, :enrollment_state => 'active', :allow_multiple_enrollments => true)
        end
        context 'following a student with visibility' do
          before{ @observer_enrollment.update_attribute(:associated_user_id, @student_in_overriden_section.id) }
          it "only shows events for assignments visible to that student" 

        end

        context 'following two students with visibility' do
          before do
            @observer_enrollment.update_attribute(:associated_user_id, @student_in_overriden_section.id)
            student_in_section(@section, user: @student_in_general_section)
            @course.enroll_user(@observer, "ObserverEnrollment", {:allow_multiple_enrollments => true, :associated_user_id => @student_in_general_section.id})
          end
          it "doesnt show duplicate events" 

        end

        context 'following a student without visibility' do
          before{ @observer_enrollment.update_attribute(:associated_user_id, @student_in_general_section.id) }
          it "only shows events for assignments visible to that student" 

        end
        context 'in a section only' do
          it "shows events for all active assignment" 

        end
      end

      context 'as a teacher' do
        it "shows events for all active assignment" 

      end
    end

    context 'all assignments' do
      before :once do
        @course.assignments.create(:title => 'undated')
        @course.assignments.create(:title => 'dated', :due_at => '2012-01-08 12:00:00')
      end

      it 'should return all assignments' 


      it 'should return all assignments, ignoring the undated flag' 


      it 'should return all assignments, ignoring the start_date and end_date' 

    end

    it 'should get a single assignment' 


    it 'should enforce permissions' 


    it 'should update assignment due dates' 


    it 'should not delete assignments' 


    context 'date overrides' do
      before :once do
        @default_assignment = @course.assignments.create(:title => 'overridden', :due_at => '2012-01-12 12:00:00') # out of range
        @default_assignment.workflow_state = 'published'
        @default_assignment.save!
      end

      context 'as student' do
        before :once do
          @student = user_factory :active_all => true, :active_state => 'active'
        end

        context 'when no sections' do
          before :once do
            @course.enroll_student(@student, :enrollment_state => 'active')
          end

          it 'should return an all-day override' 


          it 'should return a non-all-day override' 


          it 'should return a non-overridden assignment' 


          it 'should return an override when present' 


          it 'should return assignment when override is in range but assignment is not' 


          it 'should not return an assignment when assignment due_at in range but override is out' 


          it 'should return user specific override' 

        end

        context 'with sections' do
          before :once do
            @section1 = @course.course_sections.create!(:name => 'Section A')
            @section2 = @course.course_sections.create!(:name => 'Section B')
            @course.enroll_user(@student, 'StudentEnrollment', :section => @section2, :enrollment_state => 'active')
          end

          it 'should return a non-overridden assignment' 


          it 'should return an override when present' 


          it 'should return 1 assignment for latest date' 


          it 'should return later override with user and section overrides' 

        end
      end

      context 'as teacher' do
        it 'should return 1 assignment when no overrides' 


        it 'should get explicit assignment with override info' 


        context 'with sections' do
          before :once do
            @section1 = @course.course_sections.create!(:name => 'Section A')
            @section2 = @course.course_sections.create!(:name => 'Section B')
            student_in_section(@section1)
            student_in_section(@section2)
            @user = @teacher
          end

          it 'should return 1 entry for each instance' 


          it 'should return 1 assignment (override) when others are outside the range' 

        end
      end

      context 'as TA' do
        before :once do
          @ta = user_factory :active_all => true, :active_state => 'active'
        end

        context 'when no sections' do
          before :once do
            @course.enroll_user(@ta, 'TaEnrollment', :enrollment_state => 'active')
          end

          it 'should return a non-overridden assignment' 


          it 'should return override when present' 

        end

        context 'when TA of one section' do
          before :once do
            @section1 = @course.course_sections.create!(:name => 'Section A')
            @section2 = @course.course_sections.create!(:name => 'Section B')
            @course.enroll_user(@ta, 'TaEnrollment', :enrollment_state => 'active', :section => @section1) # only in 1 section
            student_in_section(@section1)
            student_in_section(@section2)
            @user = @ta
          end

          it 'should receive all assignments including other sections' 

        end
      end

      context 'as observer' do
        before :once do
          @student = user_factory(active_all: true, :active_state => 'active')
          @observer = user_factory(active_all: true, :active_state => 'active')
        end

        context 'when not observing any students' do
          before :once do
            @course.enroll_user(@observer,
                                'ObserverEnrollment',
                                :enrollment_state => 'active',
                                :section => @course.default_section)
          end

          it 'should return assignment for enrollment' 

        end

        context 'when no sections' do
          it 'should return assignments with no override' 


          context 'observing single student' do
            before :once do
              @student_enrollment = @course.enroll_user(@student, 'StudentEnrollment', :enrollment_state => 'active', :section => @course.default_section)
              @observer_enrollment = @course.enroll_user(@observer, 'ObserverEnrollment', :enrollment_state => 'active', :section => @course.default_section)
              @observer_enrollment.update_attribute(:associated_user_id, @student.id)
            end

            it 'should return student specific overrides' 


            it 'should return standard assignment' 

          end
        end

        context 'with sections' do
          before :once do
            @section1 = @course.course_sections.create!(:name => 'Section A')
            @section2 = @course.course_sections.create!(:name => 'Section B')
            @student_enrollment = @course.enroll_user(@student, 'StudentEnrollment', :enrollment_state => 'active', :section => @section1)
            @observer_enrollment = @course.enroll_user(@observer, 'ObserverEnrollment', :enrollment_state => 'active', :section => @section1)
            @observer_enrollment.update_attribute(:associated_user_id, @student.id)
          end

          context 'observing single student' do
            it 'should return linked student specific override' 


            it 'should return only override for student section' 

          end

          context 'observing multiple students' do
            before :once do
              @student2 = user_factory(active_all: true, :active_state => 'active')
            end

            context 'when in same course section' do
              before :each do
                @student_enrollment2 = @course.enroll_user(@student2, 'StudentEnrollment', enrollment_state: 'active', section: @section1)
                @observer_enrollment2 = ObserverEnrollment.new(user: @observer,
                                                               course: @course,
                                                               course_section: @section1,
                                                               workflow_state: 'active')

                @observer_enrollment2.associated_user_id = @student2.id
                @observer_enrollment2.save!
              end

              it 'should return a single assignment event' 

            end

            context 'when in same course different sections' do
              before :each do
                @student_enrollment2 = @course.enroll_user(@student2, 'StudentEnrollment', :enrollment_state => 'active', :section => @section2)
                @observer_enrollment2 = ObserverEnrollment.create!(:user => @observer,
                                                                   :course => @course,
                                                                   :course_section => @section2,
                                                                   :workflow_state => 'active')

                @observer_enrollment2.update_attribute(:associated_user_id, @student2.id)
              end

              it 'should return two assignments one for each section' 

            end

            context 'when in different courses' do
              before(:each) do
                @course1 = @course
                @course2 = course_factory(active_all: true)

                @assignment1 = @default_assignment
                @assignment2 = @course2.assignments.create!(:title => 'Override2', :due_at => '2012-01-13 12:00:00Z')
                [@assignment1, @assignment2].each { |a| a.save! }

                @student1_enrollment = StudentEnrollment.create!(:user => @student, :workflow_state => 'active', :course_section => @course1.default_section, :course => @course1)
                @student2_enrollment = StudentEnrollment.create!(:user => @student2, :workflow_state => 'active', :course_section => @course2.default_section, :course => @course2)
                @observer1_enrollment = ObserverEnrollment.create!(:user => @observer, :workflow_state => 'active', :course_section => @course1.default_section, :course => @course1)
                @observer2_enrollment = ObserverEnrollment.create!(:user => @observer, :workflow_state => 'active', :course_section => @course2.default_section, :course => @course2)

                @observer1_enrollment.update_attribute(:associated_user_id, @student.id)
                @observer2_enrollment.update_attribute(:associated_user_id, @student2.id)
                @user = @observer
              end

              it 'should return two assignments' 

            end
          end
        end
      end

      # Admins who are not enrolled in the course
      context 'as admin' do
        before :once do
          @admin = account_admin_user
          @section1 = @course.default_section
          @section2 = @course.course_sections.create!(:name => 'Section B')
          student_in_section(@section2)
          @user = @admin
        end

        context 'when viewing own calendar' do
          it 'should return 0 course assignments' 

        end

        context 'when viewing course calendar' do
          it 'should display assignments and overrides' do # behave like teacher
            override = assignment_override_model(:assignment => @default_assignment,
                                                 :due_at => DateTime.parse('2012-01-15 12:00:00'),
                                                 :set => @section2)
            json = api_call(:get, "/api/v1/calendar_events?&type=assignment&start_date=2012-01-07&end_date=2012-01-16&per_page=25&context_codes[]=course_#{@course.id}", {
              :controller => 'calendar_events_api', :action => 'index', :format => 'json', :type => 'assignment',
              :context_codes => ["course_#{@course.id}"], :start_date => '2012-01-07', :end_date => '2012-01-16', :per_page => '25'})
            expect(json.size).to eq 2
            # Should include the default and override in return
            json.sort_by! { |a| a['end_at'] }
            expect(json[0]['end_at']).to eq '2012-01-12T12:00:00Z'
            expect(json[0]['override_id']).to be_nil
            expect(json[0].keys).not_to include('assignment_override')
            expect(json[1]['end_at']).to eq '2012-01-15T12:00:00Z'
            expect(json[1]['assignment_overrides'][0]['id']).to eq override.id
          end
        end
      end
    end
  end

  context "user index" do
    before :once do
      @student = user_factory(active_all: true, active_state: 'active')
      @course.enroll_student(@student, enrollment_state: 'active')
      @observer = user_factory(active_all: true, active_state: 'active')
      @course.enroll_user(
        @observer,
        'ObserverEnrollment',
        enrollment_state: 'active',
        associated_user_id: @student.id
      )
      @observer.as_observer_observation_links.create do |uo|
        uo.user_id = @student.id
      end
      @contexts = [@course.asset_string]
      @ctx_str = @contexts.join("&context_codes[]=")
      @me = @observer
    end

    it "should return observee's calendar events" 


    it "should return submissions with assignments" 

  end

  context "calendar feed" do
    before :once do
      time = Time.utc(Time.now.year, Time.now.month, Time.now.day, 4, 20)
      @student = user_factory(active_all: true, :active_state => 'active')
      @course.enroll_student(@student, :enrollment_state => 'active')
      @student2 = user_factory(active_all: true, :active_state => 'active')
      @course.enroll_student(@student2, :enrollment_state => 'active')


      @event = @course.calendar_events.create(:title => 'course event', :start_at => time + 1.day)
      @assignment = @course.assignments.create(:title => 'original assignment', :due_at => time + 2.days)
      @override = assignment_override_model(
        :assignment => @assignment, :due_at => @assignment.due_at + 3.days, :set => @course.default_section)

      @appointment_group = AppointmentGroup.create!(
        :title => "appointment group", :participants_per_appointment => 4,
        :new_appointments => [
          [time + 3.days, time + 3.days + 1.hour],
          [time + 3.days + 1.hour, time + 3.days + 2.hours],
          [time + 3.days + 2.hours, time + 3.days + 3.hours]],
        :contexts => [@course])

      @appointment_event = @appointment_group.appointments[0]
      @appointment = @appointment_event.reserve_for(@student, @student)

      @appointment_event2 = @appointment_group.appointments[1]
      @appointment2 = @appointment_event2.reserve_for(@student2, @student2)
    end

    it "should have events for the teacher" 


    it "should have events for the student" 


    it "should render unauthorized feed for bad code" 

  end

  context 'save_selected_contexts' do
    it 'persists contexts' 

  end

  context 'visible_contexts' do
    it 'includes custom colors' 


    it 'includes whether the context has been selected' 


    it 'includes course sections' 

  end

  describe '#set_course_timetable' do
    before :once do
      @path = "/api/v1/courses/#{@course.id}/calendar_events/timetable"
      @course.start_at = DateTime.parse("2016-05-06 1:00pm -0600")
      @course.conclude_at = DateTime.parse("2016-05-19 9:00am -0600")
      @course.time_zone = 'America/Denver'
      @course.save!
    end

    it "should check for valid options" 


    it "should create course-level events" 


    it "should create section-level events" 


    it "should be able to retrieve the timetable afterwards" 

  end

  describe '#set_course_timetable_events' do
    before :once do
      @path = "/api/v1/courses/#{@course.id}/calendar_events/timetable_events"
      @events = [
        { :start_at => DateTime.parse("2016-05-09 2:00 pm -0600"), :end_at => DateTime.parse("2016-05-09 3:30 pm -0600")},
        { :start_at => DateTime.parse("2016-05-12 2:00 pm -0600"), :end_at => DateTime.parse("2016-05-12 3:30 pm -0600")},
      ]
    end

    it "should be able to create a bunch of events directly from a list" 


    it "should be able to create events for a course section" 

  end
end


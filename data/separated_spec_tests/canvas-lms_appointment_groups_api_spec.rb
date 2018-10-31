#
# Copyright (C) 2011 Instructure, Inc.
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

describe AppointmentGroupsController, type: :request do
  before :once do
    course_with_teacher(:active_all => true, :user => user_with_pseudonym(:active_user => true))
    @course1 = @course
    course_with_teacher(:active_all => true, :user => @user)
    @course2 = @course
    @me = @user
    @student1 = student_in_course(:course => @course, :active_all => true).user
    @student2 = student_in_course(:course => @course, :active_all => true).user
    @user = @me
  end

  expected_fields = [
    'appointments_count', 'context_codes', 'created_at', 'description',
    'end_at', 'html_url', 'id', 'location_address', 'location_name',
    'max_appointments_per_participant', 'min_appointments_per_participant',
    'participant_type', 'participant_visibility',
    'participants_per_appointment', 'requiring_action', 'start_at',
    'sub_context_codes', 'title', 'updated_at', 'url', 'workflow_state'
  ]

  it 'should return manageable appointment groups' 


  it "should return past manageable appointment groups, if requested" 


  it "should restrict manageable appointment groups by context_codes" 


  it 'should return reservable appointment groups' 


  it "should restrict reservable appointment groups by context_codes" 


  it "should return past reservable appointment groups, if requested" 


  it 'should paginate appointment groups' 


  it 'should include appointments and child_events, if requested' 


  it 'should include all associated context codes, if requested' 


  it 'should get a manageable appointment group' 


  it 'should include child_events, if requested' 


  it 'should get a reservable appointment group' 


  it "should return the correct context for appointment slots with existing signups in a different course" 


  it 'should require action until the min has been met' 


  describe 'past appointments' do
    before :once do
      @ag = AppointmentGroup.create!(:title => "yay",
                                     :new_appointments => [["#{Time.now.year - 1}-01-01 12:00:00", "#{Time.now.year - 1}-01-01 13:00:00"],
                                                           ["#{Time.now.year + 1}-01-01 12:00:00", "#{Time.now.year + 1}-01-01 13:00:00"]],
                                     :contexts => [@course])
      @ag.publish!
    end

    it 'returns past appointment slots for teachers' 


    it 'does not return past appointment slots for students' 

  end

  it 'should enforce create permissions' 


  it 'should create a new appointment group' 


  it 'should forbid creating an appointment group for a concluded course' 



  it 'should create a new appointment group with a sub_context' 


  it 'should enforce update permissions' 


  it 'should update an appointment group' 


  it 'should publish an appointment group in an update through the api' 


  it 'should publish an appointment group when creating through the api when requested' 


  it 'should enforce delete permissions' 


  it 'should delete an appointment group' 


  it 'should delete an appointment group with appointments' 


  it 'should include participant count, if requested' 


  it "should include the user's reserved times, if requested" 


  types = {
    'users' => proc {
      @ag = AppointmentGroup.create!(:title => "yay", :new_appointments => [["#{Time.now.year + 1}-01-01 12:00:00", "#{Time.now.year + 1}-01-01 13:00:00"], ["#{Time.now.year + 1}-01-01 13:00:00", "#{Time.now.year + 1}-01-01 14:00:00"]], :contexts => [@course])
      @ag.publish!
      @ag.appointments.first.reserve_for @student1, @me
    },
    'groups' => proc {
      cat = @course.group_categories.create(name: "foo")
      @ag = AppointmentGroup.create!(:title => "yay", :sub_context_codes => [cat.asset_string], :new_appointments => [["#{Time.now.year + 1}-01-01 12:00:00", "#{Time.now.year + 1}-01-01 13:00:00"], ["#{Time.now.year + 1}-01-01 13:00:00", "#{Time.now.year + 1}-01-01 14:00:00"]], :contexts => [@course])
      @ag.publish!
      group1 = cat.groups.create(:context => @course)
      group1.users << @student1
      @ag.appointments.first.reserve_for group1, @me
      group2 = cat.groups.create(:context => @course)
      group2.users << @student2
    }
  }
  types.each do |type, block|
    context "#{type.singularize}-level appointment groups" do
      before :once, &block

      it "should return all #{type}" 


      it "should paginate #{type}" 


      it "should return registered #{type}" 


      it "should return unregistered #{type}" 


      it "should not return non-#{type.singularize} participants" 

    end
  end

  describe "next_appointment" do
    before :once do
      @ag1 = AppointmentGroup.create!(
        :title => "past",
        :contexts => [@course2],
        :new_appointments => [[1.year.ago, 1.year.ago + 1.hour]]
      )
      @ag1.publish!
      one_year_from_now = 1.year.from_now
      @ag2 = AppointmentGroup.create!(
        :title => "future1",
        :contexts => [@course2],
        :participants_per_appointment => 1,
        :max_appointments_per_participant => 1,
        :new_appointments => [
          [one_year_from_now, one_year_from_now + 1.hour],
          [one_year_from_now + 1.hour, one_year_from_now + 2.hours]
        ]
      )
      @ag2.publish!
      @ag2.appointments.first.reserve_for(@student1, @me)
      @path = "/api/v1/appointment_groups/next_appointment?appointment_group_ids[]=#{@ag1.to_param}&appointment_group_ids[]=#{@ag2.to_param}"
      @params = { :controller => 'appointment_groups', :action => 'next_appointment', :format => 'json',
                  :appointment_group_ids => [@ag1.to_param, @ag2.to_param] }
    end

    it 'returns the first available appointment in the future' 


    it 'returns an empty array if no future appointments are available' 


    it 'doesnt get confused by appointment groups with both past and future' 

  end
end


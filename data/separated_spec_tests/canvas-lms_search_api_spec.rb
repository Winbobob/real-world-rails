#
# Copyright (C) 2012 - present Instructure, Inc.
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
require File.expand_path(File.dirname(__FILE__) + '/../../sharding_spec_helper')

describe SearchController, type: :request do
  before :once do
    @account = Account.default
    course_with_teacher(:active_course => true, :active_enrollment => true, :user => user_with_pseudonym(:active_user => true))
    @course.update_attribute(:name, "the course")
    @course.default_section.update_attributes(:name => "the section")
    @other_section = @course.course_sections.create(:name => "the other section")
    @me = @user

    @bob = student_in_course(name: "robert", short_name: "bob")
    @billy = student_in_course(:name => "billy")
    @jane = student_in_course(:name => "jane")
    @joe = student_in_course(:name => "joe")
    @tommy = student_in_course(:name => "tommy", :section => @other_section)
  end

  def student_in_course(options = {})
    section = options.delete(:section)
    u = User.create(options)
    enrollment = @course.enroll_user(u, 'StudentEnrollment', :section => section)
    enrollment.workflow_state = 'active'
    enrollment.save
    u
  end

  context "recipients" do
    before :once do
      @group = @course.groups.create(:name => "the group")
      @group.users = [@me, @bob, @joe]
    end

    it "should return recipients" 


    it "should return recipients for a given course" 


    it "should return recipients for a given group" 


    it "should return recipients for a given section" 


    it "should return recipients found by id" 


    it "should return recipients found by sis id" 


    it "should ignore other parameters when searching by id" 


    it "should return recipients by id if contactable, or if a shared conversation is referenced" 


    context "observers" do
      def observer_in_course(options = {})
        section = options.delete(:section)
        associated_user = options.delete(:associated_user)
        u = User.create(options)
        enrollment = @course.enroll_user(u, 'ObserverEnrollment', :section => section)
        enrollment.associated_user = associated_user
        enrollment.workflow_state = 'active'
        enrollment.save
        u
      end

      before :once do
        @bobs_mom = observer_in_course(:name => "bob's mom", :associated_user => @bob)
        @lonely = observer_in_course(:name => "lonely observer")
      end

      it "should show all observers to a teacher" 


      it "should not show non-linked students to observers" 


      it "should not show non-linked observers to students" 

    end

    context "synthetic contexts" do
      it "should return synthetic contexts within a course" 


      it "should return synthetic contexts within a section" 


      it "should return groups within a course" 


      it "should return sections within a course" 

    end

    context "permissions" do
      it "should return valid permission data" 


      it "should not return invalid permission data" 

    end

    context "pagination" do
      it "should paginate even if no type is specified" 


      it "should paginate users and return proper pagination headers" 


      it "should paginate contexts and return proper pagination headers" 


      it "should ignore invalid per_page" 


      it "should paginate combined context/user results" 

    end

    describe "sorting contexts" do
      it "should sort contexts by workflow state first when searching" 


      it "should sort contexts by type second when searching" 


      it "should sort contexts by name third when searching" 

    end

    context "sharding" do
      specs_require_sharding

      it "should find top-level groups from any shard" 

    end
  end

end


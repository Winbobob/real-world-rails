#
# Copyright (C) 2012 Instructure, Inc.
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

describe CollaborationsController, type: :request do
  before :once do
    PluginSetting.new(:name => 'etherpad', :settings => {}).save!
    course_with_teacher(:active_all => true)
  end

  context '/api/v1/course/:course_id/collaborations' do
    before :once do
      group_model(:context => @course)
      @student = user_with_pseudonym(:active_all => true)
      @course.enroll_student(@student).accept!
      @course_collaboration = collaboration_model(
        :user => @student,
        :context => @course,
        :type => "ExternalToolCollaboration"
      )
      @group_collaboration = collaboration_model(
        :user => @student,
        :context => @group,
        :type => "ExternalToolCollaboration"
      )
      @user = @student
    end

    let(:url) { "/api/v1/courses/#{@course.id}/collaborations"}
    let(:url_options) do
      {
        :controller => 'collaborations',
        :action     => 'api_index',
        :course_id  => @course.id,
        :format     => 'json'
      }
    end

    let(:group_url) { "/api/v1/groups/#{@group.id}/collaborations"}
    let(:group_url_options) do
      {
        :controller => 'collaborations',
        :action     => 'api_index',
        :group_id   => @group.id,
        :format     => 'json'
      }
    end

    it 'should require authorization' 


    it 'is unauthorized when trying to access a courses collaboration when they are not a member of the course' 


    it 'is unauthorized when trying to access a groups collaborations they are not a member of' 


    it 'doesnt return course collaborations for which the user is not a collaborator on' 


    it 'only returns collaborations of type ExternalToolCollaboration' 


    it 'returns the creating users name in the response' 


    it 'returns collaborations the user is a collaborator on' 


    it 'returns course collaborations for which a user has access to through their group membership' 


    it 'returns group collaborations for which a user has access to through their group membership' 


  end

  context '/api/v1/collaborations/:id/members' do
    before :once do
      @members = (1..5).map do
        user = user_with_pseudonym(:active_all => true)
        @course.enroll_student(user).accept!
        user
      end
      collaboration_model(:user => @teacher, :context => @course)
      @user = @teacher
      @collaboration.update_members(@members)
    end

    let(:url) { "/api/v1/collaborations/#{@collaboration.to_param}/members.json" }
    let(:url_options) { { :controller => 'collaborations',
                          :action     => 'members',
                          :id         => @collaboration.to_param,
                          :format     => 'json' } }

    describe 'a group member' do
      it 'should see group members' 


      it 'should receive a paginated response' 


      it 'should be formatted by collaborator_json' 


      it 'should include groups' 

    end

    describe 'a non-group member' do
      before(:each) do
        user_factory
      end

      it 'should receive a 401' 

    end
  end

  context '/api/v1/courses/:course_id/potential_collaborators' do
    before :once do
      collaboration_model(:user => @teacher, :context => @course)
    end

    it 'requires :read_roster rights' 


    it 'returns course members for course collaborations' 

  end

  context '/api/v1/groups/:group_id/potential_collaborators' do
    it 'returns group members plus course admins for group collaborations' 

  end
end


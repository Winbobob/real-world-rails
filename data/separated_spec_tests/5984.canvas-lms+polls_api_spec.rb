#
# Copyright (C) 2014 Instructure, Inc.
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

require File.expand_path(File.dirname(__FILE__) + '/../../api_spec_helper')

describe Polling::PollsController, type: :request do
  before :once do
    course_with_teacher active_all: true
  end

  describe 'GET index' do
    before :once do
      5.times do |n|
        @teacher.polls.create!(question: "Example Poll #{n+1}")
      end
    end

    def get_index(raw = false, data = {}, headers = {})
      helper = method(raw ? :raw_api_call : :api_call)
      helper.call(:get,
                  "/api/v1/polls",
                  { controller: 'polling/polls', action: 'index', format: 'json' },
                  data,
                  headers)
    end

    it "returns all existing polls" 


    it "paginates to the jsonapi standard if requested" 


    context "as a site admin" do
      it "you can view polls you have created" 

    end
  end

  describe 'GET show' do
    before :once do
      @poll = @teacher.polls.create!(question: 'An Example Poll')
    end

    def get_show(raw = false, data = {})
      helper = method(raw ? :raw_api_call : :api_call)
      helper.call(:get,
                  "/api/v1/polls/#{@poll.id}",
                  { controller: 'polling/polls', action: 'show', format: 'json',
                    id: @poll.id.to_s
                  }, data)
    end


    it "retrieves the poll specified" 


    context "as a teacher" do
      it "displays the total results of all sessions" 


      it "returns the id of the user that created the poll" 

    end

    context "as a student" do
      it "doesn't display the total results of all sessions" 


      it "shouldn't return the id of the user that created the poll" 


      it "is authorized if there are sessions that belong to a course or course section the user is enrolled in" 


      it "is unauthorized if there are no sessions that belong to a course or course section the user is enrolled in" 


    end
  end

  describe 'POST create' do
    def post_create(params, raw=false)
      helper = method(raw ? :raw_api_call : :api_call)
      helper.call(:post,
                  "/api/v1/polls",
                  { controller: 'polling/polls', action: 'create', format: 'json' },
                  { polls: [params] }, {}, {})
    end

    context "as a teacher" do
      it "creates a poll successfully" 

    end

    context "as a student" do
      it "is unauthorized" 

    end

  end

  describe 'PUT update' do
    before :once do
      @poll = @teacher.polls.create!(question: 'An Old Title')
    end

    def put_update(params, raw=false)
      helper = method(raw ? :raw_api_call : :api_call)

      helper.call(:put,
               "/api/v1/polls/#{@poll.id}",
               { controller: 'polling/polls', action: 'update', format: 'json',
                 id: @poll.id.to_s },
               { polls: [params] }, {}, {})

    end

    context "as a teacher" do
      it "updates a poll successfully" 

    end

    context "as a student" do
      it "is unauthorized" 

    end

  end

  describe 'DELETE destroy' do
    before :once do
      @poll = @teacher.polls.create!(question: 'An Old Title')
      @choice = @poll.poll_choices.create!(text: 'Blah')
      @session = @poll.poll_sessions.create!(course: @course)
      @session.publish!

      @student = student_in_course(active_user: true).user
      @submission = @session.poll_submissions.create!(
        user: @student,
        poll: @poll,
        poll_choice: @choice
      )
    end

    def delete_destroy
      raw_api_call(:delete,
               "/api/v1/polls/#{@poll.id}",
               { controller: 'polling/polls', action: 'destroy', format: 'json',
                 id: @poll.id.to_s },
               {}, {}, {})

    end

    context "as a teacher" do
      it "deletes a poll successfully" 


      it "deletes all associated poll choices" 

    end

    context "as a student" do
      it "is unauthorized" 

    end
  end
end


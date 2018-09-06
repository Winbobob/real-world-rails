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

describe Polling::PollSessionsController, type: :request do
  before :once do
    course_with_teacher active_all: true
    @section = @course.course_sections.first
  end

  describe 'GET index' do
    before :once do
      @poll = @teacher.polls.create!(question: "Example Poll")
      3.times do |n|
        @poll.poll_sessions.create!(course: @course, course_section: @section)
      end
    end

    def get_index(raw = false, data = {}, header = {})
      helper = method(raw ? :raw_api_call : :api_call)
      helper.call(:get,
                  "/api/v1/polls/#{@poll.id}/poll_sessions",
                  { controller: 'polling/poll_sessions', action: 'index', format: 'json',
                    poll_id: @poll.id.to_s
                  }, data, header)
    end

    it "returns all existing poll sessions" 


    it "paginates to the jsonapi standard if requested" 

  end

  describe 'GET show' do
    def create_submission(choice)
      student = student_in_course(active_user:true).user
      @poll_session.poll_submissions.create!(
        poll: @poll,
        user: student,
        poll_choice: choice
      )
    end

    before :once do
      @poll = @teacher.polls.create!(question: 'An Example Poll')
      @poll_session = @poll.poll_sessions.new(course: @course, course_section: @section)
      @poll_session.publish!
    end

    def get_show(raw = false, data = {})
      helper = method(raw ? :raw_api_call : :api_call)
      helper.call(:get,
                  "/api/v1/polls/#{@poll.id}/poll_sessions/#{@poll_session.id}",
                  { controller: 'polling/poll_sessions', action: 'show', format: 'json',
                    poll_id: @poll.id.to_s,
                    id: @poll_session.id.to_s
                  }, data)
    end

    it "retrieves the poll session specified" 


    context "as a teacher" do
      it "retrieves the poll session specified even if closed" 


      it "embeds the associated poll submissions" 


      it "shows the results of a current poll session" 

    end

    context "as a student" do
      it "doesn't display if the student isn't enrolled in the associated course or course section" 


      it "returns has_submitted as true if the student has made a submission" 


      it "doesn't embed the associated poll submissions" 


      it "does embed the student's own submission" 


      context "when has_public_results is false" do
        it "doesn't show the results of a current poll session" 

      end

      context "when has_public_results is true" do
        it "shows the results of the current poll session" 

      end
    end
  end

  describe 'POST create' do
    before :once do
      @poll = @teacher.polls.create!(question: 'An Example Poll')
    end

    def post_create(params, raw=false)
      helper = method(raw ? :raw_api_call : :api_call)
      helper.call(:post,
                  "/api/v1/polls/#{@poll.id}/poll_sessions",
                  { controller: 'polling/poll_sessions', action: 'create', format: 'json',
                    poll_id: @poll.id.to_s
                  },
                  { poll_sessions: [params] }, {}, {})
    end

    context "as a teacher" do
      it "creates a poll session successfully" 


      it "defaults has_public_results to false if has_public_results is blank" 


      it "returns an error if the supplied course section is invalid" 

    end
  end

  describe 'PUT update' do
    before :once do
      @poll = @teacher.polls.create!(question: 'An Old Title')
      @poll_session = @poll.poll_sessions.create!(course: @course, course_section: @section)
    end

    def put_update(params, raw=false)
      helper = method(raw ? :raw_api_call : :api_call)

      helper.call(:put,
               "/api/v1/polls/#{@poll.id}/poll_sessions/#{@poll_session.id}",
               { controller: 'polling/poll_sessions', action: 'update', format: 'json',
                 poll_id: @poll.id.to_s,
                 id: @poll_session.id.to_s
               },
               { poll_sessions: [params] }, {}, {})
    end

    context "as a teacher" do
      it "updates a session successfully" 


      it "updates courses and sections gracefully" 

    end

    context "as a student" do
      it "is unauthorized" 

    end
  end

  describe 'GET open' do
    before :once do
      @poll = @teacher.polls.create!(question: 'An Old Title')
      @poll_session = @poll.poll_sessions.create!(course: @course, course_section: @section)
    end

    def get_open
      raw_api_call(:get,
               "/api/v1/polls/#{@poll.id}/poll_sessions/#{@poll_session.id}/open",
               { controller: 'polling/poll_sessions', action: 'open', format: 'json',
                 poll_id: @poll.id.to_s,
                 id: @poll_session.id.to_s
               },
               {}, {}, {})
    end

    context "as a teacher" do
      it "publishes a poll session successfully" 


      context "not teaching the course" do
        it "doesn't publish the poll session" 

      end
    end

    context "as a student" do
      it "is unauthorized" 

    end
  end

  describe 'GET close' do
    before :once do
      @poll = @teacher.polls.create!(question: 'An Old Title')
      @poll_session = @poll.poll_sessions.create!(course: @course, course_section: @section)
      @poll_session.publish!
    end

    def get_close
      raw_api_call(:get,
               "/api/v1/polls/#{@poll.id}/poll_sessions/#{@poll_session.id}/close",
               { controller: 'polling/poll_sessions', action: 'close', format: 'json',
                 poll_id: @poll.id.to_s,
                 id: @poll_session.id.to_s
               },
               {}, {}, {})
    end

    context "as a teacher" do
      it "closes a published poll session successfully" 


      context "not teaching the course" do
        it "doesn't close the poll session" 

      end
    end

    context "as a student" do
      it "is unauthorized" 

    end
  end

  describe 'GET opened' do
    before :once do
      @course1 = course_model
      @course2 = course_model
      @teacher1 = teacher_in_course(course: @course1).user
      @teacher2 = teacher_in_course(course: @course2).user
      @poll1 = Polling::Poll.create!(user: @teacher1, question: 'A Test Poll')
      @poll2 = Polling::Poll.create!(user: @teacher2, question: 'Another Test Poll')
    end

    def get_opened(headers = {})
      api_call(:get,
               "/api/v1/poll_sessions/opened",
               { controller: 'polling/poll_sessions', action: 'opened', format: 'json' },
               {}, headers)
    end

    it "returns all poll sessions available to the current user that are published" 


    it "doesn't return poll sessions for course sections the user is not enrolled in" 


    it "paginates to the jsonapi standard if requested" 

  end

  describe 'GET closed' do
    before :once do
      @course1 = course_model
      @course2 = course_model
      @teacher1 = teacher_in_course(course: @course1).user
      @teacher2 = teacher_in_course(course: @course2).user
      @poll1 = Polling::Poll.create!(user: @teacher1, question: 'A Test Poll')
      @poll2 = Polling::Poll.create!(user: @teacher2, question: 'Another Test Poll')
    end

    def get_closed(headers = {})
      api_call(:get,
               "/api/v1/poll_sessions/closed",
               { controller: 'polling/poll_sessions', action: 'closed', format: 'json' },
               {}, headers)
    end

    it "returns all poll sessions available to the current user that are closed" 


    it "doesn't return poll sessions for course sections the user is not enrolled in" 


    it "paginates to the jsonapi standard if requested" 

  end
end


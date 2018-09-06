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

describe Polling::PollSubmissionsController, type: :request do
  before :once do
    course_with_teacher active_all: true
    @section = @course.course_sections.first
    @poll = @teacher.polls.create!(question: "What is your favorite color?")

    ["Red", "Blue", "Green"].each do |choice|
      correct = choice == "Green" ? true : false
      @poll.poll_choices.create!(text: choice, is_correct: correct)
    end

    @session = @poll.poll_sessions.create!(
      course: @course
    )

    @session.publish!
  end

  describe 'GET show' do
    before :once do
      @student = student_in_course(active_user: true).user

      @selected = @poll.poll_choices.where(text: "Green").first
      @submission = @session.poll_submissions.create!(
        user: @student,
        poll: @poll,
        poll_choice: @selected
      )
    end

    def get_show(raw = false, data = {})
      helper = method(raw ? :raw_api_call : :api_call)
      helper.call(:get,
                  "/api/v1/polls/#{@poll.id}/poll_sessions/#{@session.id}/poll_submissions/#{@submission.id}",
                  { controller: 'polling/poll_submissions', action: 'show', format: 'json',
                    poll_id: @poll.id.to_s,
                    poll_session_id: @session.id.to_s,
                    id: @submission.id.to_s
                  }, data)
    end

    it "retrieves the poll submission specified" 

  end

  describe 'POST create' do
    before :once do
      @selected = @poll.poll_choices.where(text: "Green").first
    end

    def post_create(params, raw=false)
      helper = method(raw ? :raw_api_call : :api_call)
      helper.call(:post,
                  "/api/v1/polls/#{@poll.id}/poll_sessions/#{@session.id}/poll_submissions",
                  { controller: 'polling/poll_submissions', action: 'create', format: 'json',
                    poll_id: @poll.id.to_s,
                    poll_session_id: @session.id.to_s
                  },
                  { poll_submissions: [params] }, {}, {})
    end

    context "as a student" do
      it "creates a poll submission successfully" 


      it "is invalid if the poll choice does not exist" 


      it "doesn't submit if the student isn't enrolled in the specified section" 


      it "allows submission if the student is enrolled in the specified section" 

    end
  end

end


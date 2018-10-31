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

describe Polling::PollChoicesController, type: :request do
  before :once do
    course_with_teacher active_all: true
  end

  describe 'GET index' do
    before :once do
      @poll = @teacher.polls.create!(question: "Example Poll")
      @poll.poll_choices.create!(text: "Poll Choice 1", is_correct:false, position: 1)
      @poll.poll_choices.create!(text: "Poll Choice 3", is_correct:false, position: 3)
      @poll.poll_choices.create!(text: "Poll Choice 4", is_correct:false, position: 4)
      @poll.poll_choices.create!(text: "Poll Choice 2", is_correct:false, position: 2)
      @poll.poll_choices.create!(text: "Poll Choice 5", is_correct:false, position: 5)
    end

    def get_index(raw = false, data = {}, headers = {})
      helper = method(raw ? :raw_api_call : :api_call)
      helper.call(:get,
                  "/api/v1/polls/#{@poll.id}/poll_choices",
                  { controller: 'polling/poll_choices', action: 'index', format: 'json',
                    poll_id: @poll.id.to_s
                  }, data, headers)
    end

    it "returns all existing poll choices" 


    it "returns the poll choices in the correct order" 



    it "paginates to the jsonapi standard if requested" 


    context "as a student" do
      before :once do
        student_in_course(:active_all => true, :course => @course)
      end

      it "is unauthorized if there are no open sessions" 


      it "doesn't display is_correct within the poll choices" 

    end
  end

  describe 'GET show' do
    before :once do
      @poll = @teacher.polls.create!(question: 'An Example Poll')
      @poll_choice = @poll.poll_choices.create!(text: 'A Poll Choice', is_correct: true)
    end

    def get_show(raw = false, data = {})
      helper = method(raw ? :raw_api_call : :api_call)
      helper.call(:get,
                  "/api/v1/polls/#{@poll.id}/poll_choices/#{@poll_choice.id}",
                  { controller: 'polling/poll_choices', action: 'show', format: 'json',
                    poll_id: @poll.id.to_s,
                    id: @poll_choice.id.to_s
                  }, data)
    end

    it "retrieves the poll specified" 


    context "as a student" do
      before :once do
        student_in_course(:active_all => true, :course => @course)
      end

      it "is unauthorized if there are no existing sessions" 


      it "is authorized if there are existing sessions" 


      context "with opened sessions" do
        it "doesn't display is_correct within poll choices" 

      end

      context "with closed, available sessions" do
        it "displays is_correct within poll choices" 

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
                  "/api/v1/polls/#{@poll.id}/poll_choices",
                  { controller: 'polling/poll_choices', action: 'create', format: 'json',
                    poll_id: @poll.id.to_s
                  },
                  { poll_choices: [params] }, {}, {})
    end

    context "as a teacher" do
      it "creates a poll choice successfully" 


      it "sets is_correct to false if is_correct is provided but blank" 

    end

    context "as a student" do
      it "is unauthorized" 

    end
  end

  describe 'PUT update' do
    before :once do
      @poll = @teacher.polls.create!(question: 'An Old Title')
      @poll_choice = @poll.poll_choices.create!(text: 'Old Poll Choice', is_correct: true)
    end

    def put_update(params, raw=false)
      helper = method(raw ? :raw_api_call : :api_call)

      helper.call(:put,
               "/api/v1/polls/#{@poll.id}/poll_choices/#{@poll_choice.id}",
               { controller: 'polling/poll_choices', action: 'update', format: 'json',
                 poll_id: @poll.id.to_s,
                 id: @poll_choice.id.to_s
               },
               { poll_choices: [params] }, {}, {})
    end

    context "as a teacher" do
      it "updates a poll choice successfully" 


      it "sets is_correct to the poll choice's original value if is_correct is provided but blank" 

    end

    context "as a student" do
      it "is unauthorized" 

    end
  end

  describe 'DELETE destroy' do
    before :once do
      @poll = @teacher.polls.create!(question: 'A Poll Title')
      @poll_choice = @poll.poll_choices.create!(text: 'Poll Choice', is_correct: true)
    end

    def delete_destroy
      raw_api_call(:delete,
                  "/api/v1/polls/#{@poll.id}/poll_choices/#{@poll_choice.id}",
      { controller: 'polling/poll_choices', action: 'destroy', format: 'json',
        poll_id: @poll.id.to_s,
        id: @poll_choice.id.to_s
      },
      {}, {}, {})

    end

    context "as a teacher" do
      it "deletes a poll choice successfully" 

    end

    context "as a student" do
      it "is unauthorized" 

    end
  end

end


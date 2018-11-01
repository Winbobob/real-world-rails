#
# Copyright (C) 2018 - present Instructure, Inc.
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

require_relative '../common'
require_relative 'pages/student_planner_page'

describe "student planner" do
  include_context "in-process server selenium tests"
  include PlannerPageObject

  before :once do
    Account.default.enable_feature!(:student_planner)
    course_with_teacher(active_all: true, new_user: true, course_name: "Planner Course")
    @student1 = User.create!(name: 'Student First')
    @course.enroll_student(@student1).accept!
  end

  before :each do
    user_session(@student1)
  end

  context "Graded discussion" do
    before :once do
      @assignment_d = @course.assignments.create!(name: 'assignment',
                                                  due_at: Time.zone.now.advance(days:2),
                                                  points_possible: 5)
      @discussion = @course.discussion_topics.create!(user: @teacher, title: 'Discussion 1',
                                                      message: 'Graded discussion',
                                                      assignment: @assignment_d)
    end

    it "shows and navigates to graded discussions page from student planner", priority: "1", test_id: 3259301 do
      go_to_list_view
      validate_object_displayed(@course.name,'Discussion')
      validate_link_to_url(@discussion, 'discussion_topics')
    end

    it "navigates to submission page once the graded discussion has a reply" 


    it "shows new replies tag for discussion with new replies", priority: "1", test_id: 3284231 do
      @discussion.reply_from(user: @teacher, text: 'teacher reply')
      go_to_list_view
      validate_pill('Replies')
    end

    it "shows the new activity button", priority: "1", test_id: 3263164 do
      # create discussions in the future and in the past to be able to see the new activity button
      past_discussion = graded_discussion_in_the_past
      graded_discussion_in_the_future
      go_to_list_view
      # confirm the past discussion is not loaded
      expect(planner_app_div).not_to contain_link(past_discussion.title.to_s)
      expect(new_activity_button).to be_displayed
      new_activity_button.click
      expect(planner_app_div).to contain_link_partial_text(past_discussion.title.to_s)
    end
  end

  context "ungraded discussion" do
    before :once do
      @ungraded_discussion = @course.discussion_topics.create!(user: @teacher, title: 'somebody topic title',
                                                               message: 'somebody topic message',
                                                               todo_date: Time.zone.now + 2.days)
    end

    it "shows and navigates to ungraded discussions with todo dates from student planner", priority:"1", test_id: 3259305 do
      go_to_list_view
      validate_object_displayed(@course.name,'Discussion')
      validate_link_to_url(@ungraded_discussion, 'discussion_topics')
    end

    it 'shows the date in the index page' 


    it 'shows the date in the show page' 

  end
end


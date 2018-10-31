#
# Copyright (C) 2014 - present Instructure, Inc.
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

require_relative './pages/discussions_index_page'

describe "discussions index" do
  include_context "in-process server selenium tests"

  context "as a teacher" do
    discussion1_title = 'Meaning of life'
    discussion2_title = 'Meaning of the universe'

    before :once do
      @teacher = user_with_pseudonym(active_user: true)
      course_with_teacher(user: @teacher, active_course: true, active_enrollment: true)
      course_with_student(course: @course, active_enrollment: true)
      DiscussionsIndex.set_section_specific_discussions_flag(@course,'on')

      # Discussion attributes: title, message, delayed_post_at, user
      @discussion1 = @course.discussion_topics.create!(
        title: discussion1_title,
        message: 'Is it really 42?',
        user: @teacher,
        pinned: false
      )
      @discussion2 = @course.discussion_topics.create!(
        title: discussion2_title,
        message: 'Could it be 43?',
        delayed_post_at: 1.day.from_now,
        user: @teacher,
        locked: true,
        pinned: false
      )

      @discussion1.discussion_entries.create!(user: @student, message: "I think I read that somewhere...")
      @discussion1.discussion_entries.create!(user: @student, message: ":eyeroll:")
    end

    def login_and_visit_course(teacher, course)
      user_session(teacher)
      DiscussionsIndex.visit(course)
    end

    def create_course_and_discussion(opts)
      opts.reverse_merge!({ locked: false, pinned: false })
      course = course_factory(:active_all => true)
      discussion = course.discussion_topics.create!(
        title: opts[:title],
        message: opts[:message],
        user: @teacher,
        locked: opts[:locked],
        pinned: opts[:pinned]
      )
      [course, discussion]
    end

    it "discussions can be filtered", test_id:3481189, priority: "1" 


    it "search by title works correctly", test_id:3481190, priority: "1" 


    it 'clicking the Add Discussion button redirects to new discussion page', test_id:3481193, priority: "1" 


    it 'clicking the publish button changes the published status', test_id:3481203, priority: "1" 


    it 'clicking the subscribe button changes the subscribed status', test_id:3481204, priority: "1" 


    it 'discussion can be moved between groups using Pin menu item', test_id:3481207, priority: "1" 


    it 'unpinning an unlocked discussion goes to the regular bin' 


    it 'unpinning a locked discussion goes to the locked bin' 


    it 'discussion can be moved to Closed For Comments group using menu item', test_id:3481191, priority: "1" 


    it 'closing a pinned discussion stays pinned' 


    it 'opening an unpinned discussion moves to "regular"' 


    it 'clicking the discussion goes to the discussion page', test_id:3481194, priority: "1" 


    it 'a discussion can be deleted by using Delete menu item and modal', test_id:3481192, priority: "1" 


    it 'a discussion can be duplicated by using Duplicate menu item', test_id:3481202, priority: "1" 


    it 'pill on announcement displays correct number of unread replies', test_id:3481195, priority: "1" 


    it 'should allow teachers to edit discussions settings' 

  end
end


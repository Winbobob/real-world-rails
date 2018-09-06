#
# Copyright (C) 2017 - present Instructure, Inc.
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
require_relative './announcement_index_page'
require_relative './external_feed_page'

describe "announcements index v2" do
  include_context "in-process server selenium tests"

  context "as a teacher" do
    announcement1_title = 'Free food!'
    announcement2_title = 'Flu Shot'

    before :once do
      @teacher = user_with_pseudonym(active_user: true)
      course_with_teacher(user: @teacher, active_course: true, active_enrollment: true)
      course_with_student(course: @course, active_enrollment: true)

      # Announcement attributes: title, message, delayed_post_at, allow_rating, user
      @announcement1 = @course.announcements.create!(
        title: announcement1_title,
        message: 'In the cafe!',
        user: @teacher
      )
      @announcement2 = @course.announcements.create!(
        title: announcement2_title,
        message: 'In the cafe!',
        delayed_post_at: 1.day.from_now,
        user: @teacher
      )

      @announcement1.discussion_entries.create!(user: @student, message: "I'm coming!")
      @announcement1.discussion_entries.create!(user: @student, message: "It's already gone! :(")
    end

    before :each do
      user_session(@teacher)
      AnnouncementIndex.visit(@course)
    end

    it "announcements can be filtered", test_id: 3469716, priority: "1" 


    it "search by title works correctly", test_id: 3469717, priority: "1" 


    it "an announcement can be locked for commenting", test_id: 3469718, priority: "1" 


    it 'multiple announcements can be locked for commenting', test_id: 3469719, priority: "1" 


    it 'an announcement can be deleted', test_id: 3469720, priority: "1" 


    it 'multiple announcements can be deleted', test_id: 3469721, priority: "1" 


    it 'clicking the Add Announcement button redirects to new announcement page', test_id: 3469722, priority: "1" 


    it 'clicking the announcement goes to the discussion page for that announcement', test_id: 3469726, priority: "1" 


    it 'pill on announcement displays correct number of unread replies', test_id: 3469727, priority: "1" 


    it 'RSS feed info displayed', test_id: 3469723, priority: "1" 


    it 'an external feed can be added', test_id: 3469724, priority: "1" 


    it 'an external feed can be deleted', test_id: 3469725, priority: "1" 

  end
end


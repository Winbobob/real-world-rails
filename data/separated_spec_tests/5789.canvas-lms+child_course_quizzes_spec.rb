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

require_relative '../../common'

describe "master courses - child courses - quiz locking" do
  include_context "in-process server selenium tests"

  before :once do
    Account.default.enable_feature!(:master_courses)
    enable_all_rcs Account.default

    qd = { question_type: "text_only_question", id: 1, question_name: 'the hardest question ever'}.with_indifferent_access
    due_date = format_date_for_view(Time.zone.now - 1.month)
    @copy_from = course_factory(:active_all => true)
    @template = MasterCourses::MasterTemplate.set_as_master_course(@copy_from)
    @original_quiz = @copy_from.quizzes.create!(:title => "blah", :description => "bloo", :due_at => due_date)
    @original_quiz.quiz_questions.create! question_data: qd
    @tag = @template.create_content_tag_for!(@original_quiz)

    course_with_teacher(:active_all => true)
    @copy_to = @course
    @template.add_child_course!(@copy_to)
    @quiz_copy = @copy_to.quizzes.new(:title => "blah", :description => "bloo", :due_at => due_date) # just create a copy directly instead of doing a real migration
    @quiz_copy.migration_id = @tag.migration_id
    @quiz_copy.save!
    @quiz_copy.quiz_questions.create! question_data: qd
    @quiz_copy.save!
  end

  before :each do
    user_session(@teacher)
    stub_rcs_config
  end

  it "should allow editing questions if content is not locked" 

end


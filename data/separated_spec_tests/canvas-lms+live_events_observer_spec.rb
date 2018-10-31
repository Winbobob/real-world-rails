#
# Copyright (C) 2015 - present Instructure, Inc.
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

require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe LiveEventsObserver do
  describe "general" do
    it "doesn't post events for no change" 

    it "doesn't post events for NOP fields" 

    it "does post event for actual change" 

  end
  describe "syllabus" do
    it "doesn't post for no changes" 


    it "posts update events" 

  end

  describe "wiki" do
    it "posts create events" 


    it "posts update events for title" 


    it "posts update events for body" 


    it "does not post trivial update events" 


    it "posts soft delete events" 


    it "posts delete events" 

  end

  describe "course" do
    it "posts create events" 


    it "posts update events" 

  end

  describe "discussion topic" do
    it "posts create events" 

  end

  describe "discussion entry" do
    it "posts create events" 

  end

  describe "group" do
    it "posts create events for group_categories" 


    it "posts create events for groups" 


    it "posts update events for groups" 


    it "posts create events for group_memberships" 


    it "posts update events for group_memberships" 

  end

  describe "assignment" do
    it "posts create events" 


    it "posts update events" 

  end

  describe "submission" do
    it "posts create events" 


    it "posts update events" 

  end

  describe "user" do
    it "posts create events" 


    it "posts update events" 

  end

  describe "enrollment" do
    it "posts create events" 


    it "posts update events" 

  end

  describe "enrollment_state" do
    it "posts create events" 


    it "posts update events" 

  end

  describe "user_account_association" do
    it "posts create events" 

  end

  describe "account_notification" do
    it "posts create events" 

  end

  describe "quiz_export_complete" do
    it "posts update events for quizzes2" 


    it "does not post for other ContentExport types" 


    def enable_quizzes_next(course)
      course.enable_feature!(:quizzes_next)
      # do quizzes next provision
      # quizzes_next is available to users only after quizzes next provisioning
      course.root_account.settings[:provision] = {'lti' => 'lti url'}
      course.root_account.save!
    end
  end


  describe "content_migration_completed" do
    it "posts update events" 

  end

  describe "modules" do
    it "posts create events" 


    it "posts update events" 

  end

  describe "context events" do
    let(:course) { Account.default.courses.create! }

    context "the tag_type is context_module" do
      it "posts create events" 


      it "posts update events" 

    end

    context "the tag_type is context_module_progression" do
      let(:context_module) { course.context_modules.create! }
      let(:context_module_progression) { context_module.context_module_progressions.create!(user_id: user_model.id) }

      it "posts update events if module and course are complete" 


      it "does not post update events if module is not complete" 


      it "does not post update events if course is not complete" 

    end

    context "the tag_type is not context_module or context_module_progression" do
      it "does nothing" 

    end
  end
end


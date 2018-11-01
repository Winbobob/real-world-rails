#
# Copyright (C) 2012 - 2013 Instructure, Inc.
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

require_relative '../../api_spec_helper'

describe MasterCourses::MasterTemplatesController, type: :request do
  def setup_template
    Account.default.enable_feature!(:master_courses)
    course_factory
    @template = MasterCourses::MasterTemplate.set_as_master_course(@course)
    account_admin_user(:active_all => true)
    @base_params = {:controller => 'master_courses/master_templates', :format => 'json',
      :course_id => @course.id.to_s, :template_id => 'default'}
  end

  describe "#show" do
    before :once do
      setup_template
      @url = "/api/v1/courses/#{@course.id}/blueprint_templates/default"
      @params = @base_params.merge(:action => 'show')
    end

    it "should require the feature flag" 


    it "should require authorization" 


    it "should let teachers in the master course view details" 


    it "should require am active template" 


    it "should return stuff" 

  end

  describe "#associated_courses" do
    before :once do
      setup_template
      @url = "/api/v1/courses/#{@course.id}/blueprint_templates/default/associated_courses"
      @params = @base_params.merge(:action => 'associated_courses')
    end

    it "should get some data for associated courses" 

  end

  describe "#update_associations" do
    before :once do
      setup_template
      @url = "/api/v1/courses/#{@course.id}/blueprint_templates/default/update_associations"
      @params = @base_params.merge(:action => 'update_associations')
    end

    it "should only add courses in the blueprint courses' account (or sub-accounts)" 


    it "should require account-level authorization" 


    it "should require account-level blueprint permissions" 


    it "should not try to add other blueprint courses" 


    it "should not try to add other blueprint-associated courses" 


    it "should skip existing associations" 


    it "should be able to add and remove courses" 

  end

  describe "#queue_migration" do
    before :once do
      setup_template
      @url = "/api/v1/courses/#{@course.id}/blueprint_templates/default/migrations"
      @params = @base_params.merge(:action => 'queue_migration')
      @child_course = course_factory
      @sub = @template.add_child_course!(@child_course)
    end

    it "should require some associated courses" 


    it "should not allow double-queueing" 


    it "should queue a master migration" 


    it "should accept the send_notification option" 

  end

  describe "migrations show/index" do
    before :once do
      setup_template
      @child_course = Account.default.courses.create!
      @sub = @template.add_child_course!(@child_course)
      @migration = MasterCourses::MasterMigration.start_new_migration!(@template, @user, :comment => 'Hark!')
    end

    describe "blueprint side" do
      it "should show a migration" 


      it "should show migrations" 


      it "should resolve an expired job if necessary" 

    end

    describe "minion side" do
      before :once do
        run_jobs
        @minion_migration = @child_course.content_migrations.last
        teacher_in_course(:course => @child_course, :active_all => true)
      end

      it "should show a migration" 


      it "should show migrations" 


      it "filters by subscription and enumerates old subscriptions" 

    end
  end

  describe "#restrict_item" do
    before :once do
      setup_template
      @url = "/api/v1/courses/#{@course.id}/blueprint_templates/default/restrict_item"
      @params = @base_params.merge(:action => 'restrict_item')
    end

    it "should validate content type" 


    it "should give a useful error when content is missing" 


    it "should be able to find all the (currently) supported types" 


    it "should be able to set custom restrictions" 


    it "should validate custom restrictions" 


    it "should be able to unset restrictions" 


    it "should use default restrictions by object type if enabled" 


    it "should use quiz object type restrictions if the quiz assignment is locked" 

  end

  def run_master_migration
    @migration = MasterCourses::MasterMigration.start_new_migration!(@template, @admin)
    run_jobs
    @migration.reload
  end

  describe "migration_details / import_details" do
    before :once do
      Timecop.travel(1.hour.ago) do
        setup_template
        @master = @course
        @minions = (1..2).map do |n|
          @template.add_child_course!(course_factory(:name => "Minion #{n}", :active_all => true)).child_course
        end

        # set up some stuff
        @file = attachment_model(:context => @master, :display_name => 'Some File')
        @assignment = @master.assignments.create! :title => 'Blah', :points_possible => 10
        @full_migration = run_master_migration
      end

      # prepare some exceptions
      @minions.first.attachments.first.update_attribute :display_name, 'Some Renamed Nonsense'
      @minions.first.syllabus_body = 'go away'; @minions.first.save!
      @minions.last.assignments.first.update_attribute :points_possible, 11

      # now push some incremental changes
      @page = @master.wiki_pages.create! :title => 'Unicorn'
      page_tag = @template.content_tag_for(@page)
      page_tag.restrictions = @template.default_restrictions
      page_tag.save!
      @quiz = @master.quizzes.create! :title => 'TestQuiz'
      @file.update_attribute :display_name, 'I Can Rename Files Too'
      @assignment.destroy
      @master.syllabus_body = 'syllablah frd'; @master.save!
      run_master_migration
    end

    it "returns change information from the blueprint side" 


    it "returns change information from the minion side" 


    it "returns empty for a non-selective migration" 


    it "is not tripped up by subscriptions created after the sync" 


    it "requires manage rights on the course" 


    it "syncs syllabus content unless changed downstream" 

  end

  describe 'unsynced_changes' do
    before do
      local_storage!
      Timecop.travel(1.hour.ago) do
        setup_template
        @master = @course
        @template.add_child_course!(course_factory(:name => 'Minion'))
        @page = @master.wiki_pages.create! :title => 'Old News'
        @ann = @master.announcements.create! :title => 'Boring', :message => 'Yawn'
        @file = attachment_model(:context => @master, :display_name => 'Some File')
        @folder = @master.folders.create!(:name => 'Blargh')
        @template.content_tag_for(@file).update_attribute(:restrictions, {:content => true})
        run_master_migration
      end
    end

    it 'detects creates, updates, and deletes since the last sync' 


    it "limits result size" 

  end

  describe 'subscriptions_index' do
    before :once do
      setup_template
      @blueprint = @template.course
      @blueprint.update_attribute(:sis_source_id, 'sisid')
      @minion = course_factory(:name => 'Minion', :active_all => true)
      @subscription = @template.add_child_course!(@minion)
    end

    it "returns information about the subscription" 


    it "includes sis_course_id if the caller has permission to see it" 


    it "returns an empty array if there is no subscription" 

  end
end


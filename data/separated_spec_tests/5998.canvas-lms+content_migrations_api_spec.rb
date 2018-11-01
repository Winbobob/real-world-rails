#
# Copyright (C) 2013 - 2014 Instructure, Inc.
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

require File.expand_path(File.dirname(__FILE__) + '/../api_spec_helper')

describe ContentMigrationsController, type: :request do
  before :once do
    course_with_teacher(:active_all => true, :user => user_with_pseudonym)
    @migration_url = "/api/v1/courses/#{@course.id}/content_migrations"
    @params = { :controller => 'content_migrations', :format => 'json', :course_id => @course.id.to_param}

    @migration = @course.content_migrations.create
    @migration.migration_type = 'common_cartridge_importer'
    @migration.context = @course
    @migration.user = @user
    @migration.started_at = 1.week.ago
    @migration.finished_at = 1.day.ago
    @migration.save!
  end

  before :each do
    user_session @teacher
  end

  describe 'index' do
    before do
      @params = @params.merge( :action => 'index')
    end

    it "should return list" 


    it "should paginate" 


    it "should 401" 


    it "should create the course root folder" 


    context "User" do
      before do
        @migration = @user.content_migrations.create
        @migration.migration_type = 'zip_file_import'
        @migration.user = @user
        @migration.save!
        @migration_url = "/api/v1/users/#{@user.id}/content_migrations"
        @params = @params.reject{ |k| k == :course_id }.merge(user_id: @user.id)
      end

      it "should return list" 

    end

    context "Group" do
      before do
        group_with_user user: @user
        @migration = @group.content_migrations.create
        @migration.migration_type = 'zip_file_import'
        @migration.user = @user
        @migration.save!
        @migration_url = "/api/v1/groups/#{@group.id}/content_migrations"
        @params = @params.reject{ |k| k == :course_id }.merge(group_id: @group.id)
      end

      it "should return list" 

    end

    context "Account" do
      before do
        @account = Account.create!(:name => 'name')
        @account.account_users.create!(user: @user)
        @migration = @account.content_migrations.create
        @migration.migration_type = 'qti_converter'
        @migration.user = @user
        @migration.save!
        @migration_url = "/api/v1/accounts/#{@account.id}/content_migrations"
        @params = @params.reject{ |k| k == :course_id }.merge(account_id: @account.id)
      end

      it "should return list" 

    end

    it "should not return attachments for expired import" 


    it "should not return a blank page when master_course_import migrations exist" 

  end

  describe 'show' do
    before :once do
      @migration_url = @migration_url + "/#{@migration.id}"
      @params = @params.merge( :action => 'show', :id => @migration.id.to_param )
    end

    it "should return migration" 


    it "should return waiting_for_select when it's supposed to" 


    it "should 404" 


    it "should 401" 


    it "should not return attachment for course copies" 


    it "should return source course info for course copy" 


    it "should mark as failed if stuck in pre_processing" 


    context "Site Admin" do
      it "should contain additional auditing information for site admins" 


      it "should not contain additional auditing information if not site admin" 

    end

    context "User" do
      before do
        @migration = @user.content_migrations.create
        @migration.migration_type = 'zip_file_import'
        @migration.user = @user
        @migration.save!
        @migration_url = "/api/v1/users/#{@user.id}/content_migrations/#{@migration.id}"
        @params = @params.reject{ |k| k == :course_id }.merge(user_id: @user.id, id: @migration.to_param)
      end

      it "should return migration" 

    end

    context "Group" do
      before do
        group_with_user user: @user
        @migration = @group.content_migrations.create
        @migration.migration_type = 'zip_file_import'
        @migration.user = @user
        @migration.save!
        @migration_url = "/api/v1/groups/#{@group.id}/content_migrations/#{@migration.id}"
        @params = @params.reject{ |k| k == :course_id }.merge(group_id: @group.id, id: @migration.to_param)
      end

      it "should return migration" 

    end

    context "Account" do
      before do
        @account = Account.create!(:name => 'name')
        @account.account_users.create!(user: @user)
        @migration = @account.content_migrations.create
        @migration.migration_type = 'qti_converter'
        @migration.user = @user
        @migration.save!
        @migration_url = "/api/v1/accounts/#{@account.id}/content_migrations/#{@migration.id}"
        @params = @params.reject{ |k| k == :course_id }.merge(account_id: @account.id, id: @migration.to_param)
      end

      it "should return migration" 

    end
  end

  describe 'create' do
    before :once do
      @params = {:controller => 'content_migrations', :format => 'json', :course_id => @course.id.to_param, :action => 'create'}
      @post_params = {:migration_type => 'common_cartridge_importer', :pre_attachment => {:name => "test.zip"}}
    end

    it "should error for unknown type" 


    it "should queue a migration" 


    it "should not queue a migration if do_not_run flag is set" 


    it "should error if expected setting isn't set" 


    it "should queue if correct settings set" 


    it "should not queue for course copy and selective_import" 


    it "should queue for course copy on concluded courses" 


    it "should translate a sis source_course_id" 


    context "migration file upload" do
      it "should set attachment pre-flight data" 


      it "should not queue migration with pre_attachent on create" 


      it "should error if upload file required but not provided" 


      it "should queue the migration when file finishes uploading" 


      it "should error if course quota exceeded" 

    end

    context "by url" do
      it "should queue migration with url sent" 


    end

    context "by LTI extension" do
      it "should queue migration with LTI url sent" 


      it "should require a file upload" 

    end

    context "User" do
      before :once do
        @migration_url = "/api/v1/users/#{@user.id}/content_migrations"
        @params = @params.reject{|k| k == :course_id}.merge(:user_id => @user.to_param)
        @folder = Folder.root_folders(@user).first
      end

      it "should error for an unsupported type" 


      it "should queue a migration" 

    end

    context "Group" do
      before do
        group_with_user user: @user
        @migration_url = "/api/v1/groups/#{@group.id}/content_migrations"
        @params = @params.reject{|k| k == :course_id}.merge(:group_id => @group.to_param)
        @folder = Folder.root_folders(@group).first
      end

      it "should queue a migration" 

    end

    context "Account" do
      before do
        @account = Account.create!(:name => 'migration account')
        @account.account_users.create!(user: @user)
        @migration_url = "/api/v1/accounts/#{@account.id}/content_migrations"
        @params = @params.reject{|k| k == :course_id}.merge(:account_id => @account.to_param)
      end

      it "should queue a migration" 

    end
  end

  describe 'update' do
    before do
      @migration_url = "/api/v1/courses/#{@course.id}/content_migrations/#{@migration.id}"
      @params = {:controller => 'content_migrations', :format => 'json', :course_id => @course.id.to_param, :action => 'update', :id => @migration.id.to_param}
      @post_params = {}
    end

    it "should queue a migration" 


    it "should not queue a migration if do_not_run flag is set" 


    it "should not change migration_type" 


    it "should reset progress after queue" 


    context "selective content" do
      before :once do
        @migration.workflow_state = 'exported'
        @migration.migration_settings[:import_immediately] = false
        @migration.save!
        @post_params = {:copy => {:all_assignments => true, :context_modules => {'id_9000' => true}}}
      end

      it "should set the selective data" 


      it "should queue a course copy after selecting content" 


      it "should queue a file migration after selecting content" 


    end

  end

  describe 'migration_systems' do
    it "should return the migrators" 


    it "should filter by context type" 

  end

  describe 'content selection' do
    before :once do
      @migration_url = "/api/v1/courses/#{@course.id}/content_migrations/#{@migration.id}/selective_data"
      @params = {:controller => 'content_migrations', :format => 'json', :course_id => @course.id.to_param, :action => 'content_list', :id => @migration.id.to_param}
      @orig_course = @course

      course_factory
      @dt1 = @course.discussion_topics.create!(:message => "hi", :title => "discussion title")
      @cm = @course.context_modules.create!(:name => "some module")
      @att = Attachment.create!(:filename => 'first.txt', :uploaded_data => StringIO.new('ohai'), :folder => Folder.unfiled_folder(@course), :context => @course)
      @wiki = @course.wiki_pages.create!(:title => "wiki", :body => "ohai")
      @migration.migration_type = 'course_copy_importer'
      @migration.migration_settings[:source_course_id] = @course.id
      @migration.save!
    end

    it "should return the top-level list" 


    it "should return individual types" 

  end


end


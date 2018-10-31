#
# Copyright (C) 2012 Instructure, Inc.
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

require File.expand_path(File.dirname(__FILE__) + '/../api_spec_helper')
require File.expand_path(File.dirname(__FILE__) + '/../locked_spec')

describe "Pages API", type: :request do
  include Api::V1::User
  include AvatarHelper

  context 'locked api item' do
    let(:item_type) { 'page' }

    let(:locked_item) do
      wiki = @course.wiki
      wiki.set_front_page_url!('front-page')
      front_page = wiki.front_page
      front_page.workflow_state = 'active'
      front_page.save!
      front_page
    end

    def api_get_json
      api_call(
        :get,
        "/api/v1/courses/#{@course.id}/pages/#{locked_item.url}",
        {:controller=>'wiki_pages_api', :action=>'show', :format=>'json', :course_id=>"#{@course.id}", :url=>locked_item.url},
      )
    end

    include_examples 'a locked api item'
  end

  before :once do
    course_factory
    @course.offer!
    @wiki = @course.wiki
    @wiki.set_front_page_url!('front-page')
    @front_page = @wiki.front_page
    @front_page.workflow_state = 'active'
    @front_page.save!
    @front_page.set_as_front_page!
    @hidden_page = @course.wiki_pages.create!(:title => "Hidden Page", :body => "Body of hidden page")
    @hidden_page.unpublish!
  end

  context 'versions' do
    before :once do
      @page = @course.wiki_pages.create!(:title => 'Test Page', :body => 'Test content')
    end

    example 'creates initial version of the page' do
      expect(@page.versions.count).to eq 1
      version = @page.current_version.model
      expect(version.title).to eq 'Test Page'
      expect(version.body).to eq 'Test content'
    end

    example 'creates a version when the title changes' do
      @page.title = 'New Title'
      @page.save!
      expect(@page.versions.count).to eq 2
      version = @page.current_version.model
      expect(version.title).to eq 'New Title'
      expect(version.body).to eq 'Test content'
    end

    example 'creates a verison when the body changes' do
      @page.body = 'New content'
      @page.save!
      expect(@page.versions.count).to eq 2
      version = @page.current_version.model
      expect(version.title).to eq 'Test Page'
      expect(version.body).to eq 'New content'
    end

    example 'does not create a version when workflow_state changes' do
      @page.workflow_state = 'active'
      @page.save!
      expect(@page.versions.count).to eq 1
    end

    example 'does not create a version when editing_roles changes' do
      @page.editing_roles = 'teachers,students,public'
      @page.save!
      expect(@page.versions.count).to eq 1
    end

    example 'does not create a version when notify_of_update changes' do
      @page.notify_of_update = true
      @page.save!
      expect(@page.versions.count).to eq 1
    end

    example 'does not create a version when just the user_id changes' do
      user1 = user_factory(active_all: true)
      @page.user_id = user1.id
      @page.title = 'New Title'
      @page.save!
      expect(@page.versions.count).to eq 2
      current_version = @page.current_version.model
      expect(current_version.user_id).to eq user1.id

      user2 = user_factory(active_all: true)
      @page.user_id = user2.id
      @page.save!
      expect(@page.versions.count).to eq 2
    end
  end

  context "as a teacher" do
    before :once do
      course_with_teacher(:course => @course, :active_all => true)
    end

    describe "index" do
      it "should list pages, including hidden ones", priority: "1", test_id: 126789 do
        json = api_call(:get, "/api/v1/courses/#{@course.id}/pages",
                        :controller=>'wiki_pages_api', :action=>'index', :format=>'json', :course_id=>@course.to_param)
        expect(json.map {|entry| entry.slice(*%w(hide_from_students url created_at updated_at title front_page))}).to eq(
          [{"hide_from_students" => false, "url" => @front_page.url, "created_at" => @front_page.created_at.as_json, "updated_at" => @front_page.revised_at.as_json, "title" => @front_page.title, "front_page" => true},
           {"hide_from_students" => true, "url" => @hidden_page.url, "created_at" => @hidden_page.created_at.as_json, "updated_at" => @hidden_page.revised_at.as_json, "title" => @hidden_page.title, "front_page" => false}]
        )
      end

      it "should paginate" 


      it "should search for pages by title" 


      it "should return an error if the search term is fewer than 3 characters" 


      describe "sorting" do
        it "should sort by title (case-insensitive)" 


        it "should sort by created_at" 


        it "should sort by updated_at" 


        context 'planner feature enabled' do
          before(:once) { @course.root_account.enable_feature!(:student_planner) }

          it 'should create a page with a todo_date' 


          it 'creates a new front page with a todo date' 


          it 'should update a page with a todo_date' 


          it 'should unset page todo_date' 


          it 'should unset page todo_date only if explicitly asked for' 

        end
      end
    end

    describe "show" do
      before :once do
        @teacher.short_name = 'the teacher'
        @teacher.save!
        @hidden_page.user_id = @teacher.id
        @hidden_page.save!
      end

      it "should retrieve page content and attributes", priority: "1", test_id: 126803 do
        @hidden_page.publish
        json = api_call(:get, "/api/v1/courses/#{@course.id}/pages/#{@hidden_page.url}",
                        :controller=>"wiki_pages_api", :action=>"show", :format=>"json", :course_id=>"#{@course.id}", :url=>@hidden_page.url)
        expected = { "hide_from_students" => false,
                     "editing_roles" => "teachers",
                     "last_edited_by" => user_display_json(@teacher, @course).stringify_keys!,
                     "url" => @hidden_page.url,
                     "html_url" => "http://www.example.com/courses/#{@course.id}/#{@course.wiki.path}/#{@hidden_page.url}",
                     "created_at" => @hidden_page.created_at.as_json,
                     "updated_at" => @hidden_page.revised_at.as_json,
                     "title" => @hidden_page.title,
                     "body" => @hidden_page.body,
                     "published" => true,
                     "front_page" => false,
                     "locked_for_user" => false,
                     "page_id" => @hidden_page.id,
                     "todo_date" => nil
        }
        expect(json).to eq expected
      end

      it "should retrieve front_page", priority: "1", test_id: 126793 do
        page = @course.wiki_pages.create!(:title => "hrup", :body => "blooop")
        page.set_as_front_page!

        json = api_call(:get, "/api/v1/courses/#{@course.id}/front_page",
                        :controller=>"wiki_pages_api", :action=>"show_front_page", :format=>"json", :course_id=>"#{@course.id}")

        expected = { "hide_from_students" => false,
                     "editing_roles" => "teachers",
                     "url" => page.url,
                     "html_url" => "http://www.example.com/courses/#{@course.id}/#{@course.wiki.path}/#{page.url}",
                     "created_at" => page.created_at.as_json,
                     "updated_at" => page.revised_at.as_json,
                     "title" => page.title,
                     "body" => page.body,
                     "published" => true,
                     "front_page" => true,
                     "locked_for_user" => false,
                     "page_id" => page.id,
                     "todo_date" => nil,
        }
        expect(json).to eq expected
      end

      it "should give a meaningful error if there is no front page" 

    end

    describe "revisions" do
      before :once do
        @timestamps = %w(2013-01-01 2013-01-02 2013-01-03).map { |d| Time.zone.parse(d) }
        course_with_ta :course => @course, :active_all => true
        Timecop.freeze(@timestamps[0]) do      # rev 1
          @vpage = @course.wiki_pages.build :title => 'version test page'
          @vpage.workflow_state = 'unpublished'
          @vpage.body = 'draft'
          @vpage.save!
        end

        Timecop.freeze(@timestamps[1]) do      # rev 2
          @vpage.workflow_state = 'active'
          @vpage.body = 'published by teacher'
          @vpage.user = @teacher
          @vpage.save!
        end

        Timecop.freeze(@timestamps[2]) do      # rev 3
          @vpage.body = 'revised by ta'
          @vpage.user = @ta
          @vpage.save!
        end
        @user = @teacher
      end

      it "should list revisions of a page" 


      it "should summarize the latest revision" 


      it "should paginate the revision list" 


      it "should retrieve an old revision" 


      it "should retrieve the latest revision" 


      it "should revert to a prior revision" 


      it "should revert page content only" 


      it "show should 404 when given a bad revision number" 


      it "revert should 404 when given a bad revision number" 

    end

    describe "create" do
      it "should require a title" 


      it "should create a new page", priority: "1", test_id: 126819 do
        json = api_call(:post, "/api/v1/courses/#{@course.id}/pages",
                        { :controller => 'wiki_pages_api', :action => 'create', :format => 'json', :course_id => @course.to_param },
                        { :wiki_page => { :title => 'New Wiki Page!', :body => 'hello new page' }})
        page = @course.wiki_pages.where(url: json['url']).first!
        expect(page.title).to eq 'New Wiki Page!'
        expect(page.url).to eq 'new-wiki-page'
        expect(page.body).to eq 'hello new page'
        expect(page.user_id).to eq @teacher.id
      end

      it "should create a front page using PUT", priority: "1", test_id: 126797 do
        front_page_url = 'new-wiki-front-page'
        json = api_call(:put, "/api/v1/courses/#{@course.id}/front_page",
                        { :controller => 'wiki_pages_api', :action => 'update_front_page', :format => 'json', :course_id => @course.to_param },
                        { :wiki_page => { :title => 'New Wiki Front Page!', :body => 'hello front page' }})
        expect(json['url']).to eq front_page_url
        page = @course.wiki_pages.where(url: front_page_url).first!
        expect(page.is_front_page?).to be_truthy
        expect(page.title).to eq 'New Wiki Front Page!'
        expect(page.body).to eq 'hello front page'
      end

      it "should error when creating a front page using PUT with no value in title", priority: "3", test_id: 126814 do
        json = api_call(:put, "/api/v1/courses/#{@course.id}/front_page",
                        { :controller => 'wiki_pages_api', :action => 'update_front_page', :format => 'json', :course_id => @course.to_param },
                        { :wiki_page => { :title => '', :body => 'hello front page' }},
                        {}, {:expected_status => 400})
        error = json["errors"].first
        # As error is represented as array of arrays
        expect(error[0]).to eq('title')
        expect(error[1][0]["message"]).to eq("Title can't be blank")
      end

      it "should create front page with published set to true using PUT", priority: "3", test_id: 126821 do
        front_page_url = 'new-wiki-front-page'
        json = api_call(:put, "/api/v1/courses/#{@course.id}/front_page",
                        { :controller => 'wiki_pages_api', :action => 'update_front_page', :format => 'json', :course_id => @course.to_param },
                        { :wiki_page => { :title => 'New Wiki Front Page!', :published => true}})
        expect(json['url']).to eq front_page_url
        page = @course.wiki_pages.where(url: front_page_url).first!
        expect(page.published?).to eq(true)
      end

      it "should error when creating front page with published set to false using PUT", priority: "3", test_id: 126822 do
        json = api_call(:put, "/api/v1/courses/#{@course.id}/front_page",
                        { :controller => 'wiki_pages_api', :action => 'update_front_page', :format => 'json', :course_id => @course.to_param },
                        { :wiki_page => { :title => 'New Wiki Front Page!', :published => false}},
                        {}, {:expected_status => 400})
        error = json["errors"].first
        # As error is represented as array of arrays
        expect(error[0]).to eq('published')
        expect(error[1][0]["message"]).to eq("The front page cannot be unpublished")
      end

      it 'should process body with process_incoming_html_content' 


      it 'should not point group file links to the course' 


      it "should set as front page", priority: "1", test_id: 126818 do
        json = api_call(:post, "/api/v1/courses/#{@course.id}/pages",
                        { :controller => 'wiki_pages_api', :action => 'create', :format => 'json', :course_id => @course.to_param },
                        { :wiki_page => { :title => 'New Wiki Page!', :body => 'hello new page', :published => true, :front_page => true}})

        page = @course.wiki_pages.where(url: json['url']).first!
        expect(page.is_front_page?).to be_truthy

        wiki = @course.wiki
        wiki.reload
        expect(wiki.get_front_page_url).to eq page.url

        expect(json['front_page']).to eq true
      end

      it "should create a new page in published state", priority: "1", test_id: 126792 do
        json = api_call(:post, "/api/v1/courses/#{@course.id}/pages",
                        { :controller => 'wiki_pages_api', :action => 'create', :format => 'json', :course_id => @course.to_param },
                        { :wiki_page => { :published => true, :title => 'New Wiki Page!', :body => 'hello new page' }})
        page = @course.wiki_pages.where(url: json['url']).first!
        expect(page).to be_active
        expect(json['published']).to be_truthy
      end

      it "should create a new page in unpublished state (draft state)" 


      it "should create a published front page, even when published is blank", priority: "1", test_id: 126812 do
        front_page_url = 'my-front-page'
        json = api_call(:put, "/api/v1/courses/#{@course.id}/front_page",
                        { :controller => 'wiki_pages_api', :action => 'update_front_page', :format => 'json', :course_id => @course.to_param },
                        { :wiki_page => { :published => '', :title => 'My Front Page' }})
        expect(json['url']).to eq front_page_url
        expect(json['published']).to be_truthy

        expect(@course.wiki.get_front_page_url).to eq front_page_url
        page = @course.wiki_pages.where(url: front_page_url).first!
        expect(page).to be_published
      end

      it 'should allow teachers to set editing_roles' 


      it 'should not allow students to set editing_roles' 


      describe 'should create a linked assignment' do
        let(:page) do
          json = api_call(:post, "/api/v1/courses/#{@course.id}/pages",
                   { :controller => 'wiki_pages_api', :action => 'create', :format => 'json',
                     :course_id => @course.to_param },
                   { :wiki_page => { :title => 'Assignable Page',
                     :assignment => { :set_assignment => true, :only_visible_to_overrides => true } }})
          @course.wiki_pages.where(url: json['url']).first!
        end

        it 'unless flag is disabled' 


        it 'if flag is enabled' 

      end
    end

    describe "update" do
      it "should update page content and attributes", priority: "1", test_id: 126799 do
        api_call(:put, "/api/v1/courses/#{@course.id}/pages/#{@hidden_page.url}",
                 { :controller => 'wiki_pages_api', :action => 'update', :format => 'json', :course_id => @course.to_param,
                   :url => @hidden_page.url },
                 { :wiki_page => { :title => 'No Longer Hidden Page',
                   :body => 'Information wants to be free' }})
        @hidden_page.reload
        expect(@hidden_page.title).to eq 'No Longer Hidden Page'
        expect(@hidden_page.body).to eq 'Information wants to be free'
        expect(@hidden_page.user_id).to eq @teacher.id
      end

      it "should update front_page" 


      it 'should not crash updating front page if the wiki_page param is not available with student planner enabled' 


      it "should set as front page", priority:"3", test_id: 126813 do
        wiki = @course.wiki
        expect(wiki.unset_front_page!).to eq true


        json = api_call(:put, "/api/v1/courses/#{@course.id}/pages/#{@hidden_page.url}",
                 { :controller => 'wiki_pages_api', :action => 'update', :format => 'json', :course_id => @course.to_param,
                   :url => @hidden_page.url },
                 { :wiki_page => { :title => 'No Longer Hidden Page',
                                   :body => 'Information wants to be free', :front_page => true, :published => true}})
        no_longer_hidden_page = @hidden_page
        no_longer_hidden_page.reload
        expect(no_longer_hidden_page.is_front_page?).to be_truthy

        wiki.reload
        expect(wiki.front_page).to eq no_longer_hidden_page

        expect(json['front_page']).to eq true
      end

      it "should un-set as front page" 


      it "should not change the front page unless set differently" 


      it "should update wiki front page url if page url is updated" 


      it "should not set hidden page as front page" 


      context 'hide_from_students' do
        before :once do
          @test_page = @course.wiki_pages.build(:title => 'Test Page')
          @test_page.workflow_state = 'active'
          @test_page.save!
        end

        context 'with draft state' do
          before :once do
          end

          it 'should accept published' 


          it 'should ignore hide_from_students' 

        end
      end

      context 'with unpublished page' do
        before :once do
          @unpublished_page = @course.wiki_pages.build(:title => 'Unpublished Page', :body => 'Body of unpublished page')
          @unpublished_page.workflow_state = 'unpublished'
          @unpublished_page.save!

          @unpublished_page.reload
        end

        it 'should publish a page with published=true' 


        it 'should not publish a page otherwise' 

      end

      it "should unpublish a page" 


      it "should sanitize page content" 


      it 'should process body with process_incoming_html_content' 


      it "should not allow invalid editing_roles" 


      it "should create a page if the page doesn't exist", priority: "1", test_id: 126801 do
        api_call(:put, "/api/v1/courses/#{@course.id}/pages/nonexistent-url",
                 { :controller => 'wiki_pages_api', :action => 'update', :format => 'json', :course_id => @course.to_param,
                   :url => 'nonexistent-url' },
                 { :wiki_page => { :body => 'Nonexistent page content' } })
        page = @wiki.wiki_pages.where(url: 'nonexistent-url').first!
        expect(page).not_to be_nil
        expect(page.body).to eq 'Nonexistent page content'
      end

      describe "notify_of_update" do
        before :once do
          @notify_page = @hidden_page
          @notify_page.publish!

          @front_page.update_attribute(:created_at, 1.hour.ago)
          @notify_page.update_attribute(:created_at, 1.hour.ago)
          @notification = Notification.create! :name => "Updated Wiki Page"
          @teacher.communication_channels.create(:path => "teacher@instructure.com").confirm!
          @teacher.email_channel.notification_policies.create!(notification: @notification,
                                                               frequency: 'immediately')
        end

        it "should notify iff the notify_of_update flag is set" 

      end


      context 'feature enabled' do
        before { @course.enable_feature!(:conditional_release) }

        it 'should update a linked assignment' 


        it 'should destroy and restore a linked assignment' 

      end

      it 'should not update a linked assignment' 


      it 'should not destroy linked assignment' 

    end

    describe "delete" do
      it "should delete a page", priority: "1", test_id: 126805 do
        api_call(:delete, "/api/v1/courses/#{@course.id}/pages/#{@hidden_page.url}",
                 { :controller => 'wiki_pages_api', :action => 'destroy', :format => 'json', :course_id => @course.to_param,
                   :url => @hidden_page.url })
        expect(@hidden_page.reload).to be_deleted
      end

      it "should not delete the front_page" 

    end

    context "unpublished pages" do
      before :once do
        @deleted_page = @course.wiki_pages.create! :title => "Deleted page"
        @deleted_page.destroy
        @unpublished_page = @course.wiki_pages.create(:title => "Draft Page", :body => "Don't text and drive.")
        @unpublished_page.workflow_state = :unpublished
        @unpublished_page.save!
      end

      it "should be in index" 


      it "should not be in index if ?published=true" 


      it "should be in index exclusively if ?published=false" 


      it "should show" 

    end
  end

  context "as a student" do
    before :once do
      course_with_student(:course => @course, :active_all => true)
    end

    it "should list pages, excluding hidden ones" 

    it 'should not allow update to page todo_date if student' 


    it "should paginate, excluding hidden" 


    it "should refuse to show a hidden page" 


    it "should refuse to list pages in an unpublished course" 


    it "should deny access to wiki in an unenrolled course" 


    it "should allow access to a wiki in a public unenrolled course" 


    describe "module progression" do
      before :once do
        @mod = @course.context_modules.create!(:name => "some module")
        @tag = @mod.add_item(:id => @front_page.id, :type => 'wiki_page')
        @mod.completion_requirements = { @tag.id => {:type => 'must_view'} }
        @mod.save!
      end

      it "should not fulfill requirements with index" 


      it "should fulfill requirements with view on an unlocked page" 


      it "should not fulfill requirements with view on a locked page" 

    end

    it "should not allow editing a page" 


    describe "with students in editing_roles" do
      before :once do
        @editable_page = @course.wiki_pages.create! :title => 'Editable Page', :editing_roles => 'students'
        @editable_page.workflow_state = 'active'
        @editable_page.save!
      end

      it "should allow editing the body" 


      it 'should not allow editing attributes (with draft state)' 


      it "should fulfill module completion requirements" 


      it "should not allow creating pages" 


      it "should not allow deleting pages" 

    end

    context "unpublished pages" do
      before :once do
        @unpublished_page = @course.wiki_pages.create(:title => "Draft Page", :body => "Don't text and drive.")
        @unpublished_page.workflow_state = :unpublished
        @unpublished_page.save!
      end

      it "should not be in index" 


      it "should not be in index even with ?published=false" 


      it "should not show" 


      it "should not show unpublished on public courses" 

    end

    context "revisions" do
      before :once do
        @vpage = @course.wiki_pages.build :title => 'student version test page', :body => 'draft'
        @vpage.workflow_state = 'unpublished'
        @vpage.save! # rev 1

        @vpage.workflow_state = 'active'
        @vpage.body = 'published but hidden'
        @vpage.save! # rev 2

        @vpage.body = 'now visible to students'
        @vpage.save! # rev 3
      end

      it "should refuse to list revisions" 


      it "should refuse to retrieve a revision" 


      it "should refuse to revert a page" 


      it "should describe the latest version" 


      context "with page-level student editing role" do
        before :once do
          @vpage.editing_roles = 'teachers,students'
          @vpage.body = 'with student editing roles'
          @vpage.save! # rev 4
        end

        it "should list revisions" 


        it "should retrieve an old revision" 


        it "should retrieve a (formerly) hidden revision" 


        it "should retrieve a (formerly) unpublished revision" 


        it "should not retrieve a version of a locked page" 


        it "should not revert page content" 

      end

      context "with course-level student editing role" do
        before :once do
          @course.default_wiki_editing_roles = 'teachers,students'
          @course.save!
        end

        it "should revert page content" 

      end
    end
  end

  context "group" do
    before :once do
      group_with_user(:active_all => true)
      5.times { |i| @group.wiki_pages.create!(:title => "Group Wiki Page #{i}", :body => "<blink>Content of page #{i}</blink>") }
    end

    it "should list the contents of a group wiki" 


    it "should retrieve page content from a group wiki" 


    it "should create a group wiki page" 


    it "should update a group wiki page" 


    it "should delete a group wiki page" 


    context "revisions" do
      before :once do
        @vpage = @group.wiki_pages.create! :title => 'revision test page', :body => 'old version'
        @vpage.body = 'new version'
        @vpage.save!
      end

      it "should list revisions for a page" 


      it "should retrieve an old revision of a page" 


      it "should retrieve the latest version of a page" 


      it "should revert to an old version of a page" 


      it "should summarize the latest version" 

    end
  end

  context "differentiated assignments" do
    def create_page_for_da(assignment_opts={})
      assignment = @course.assignments.create!(assignment_opts)
      assignment.submission_types = 'wiki_page'
      assignment.save!
      page = @course.wiki_pages.build(
        user: @teacher,
        editing_roles: "teachers,students",
        title: assignment_opts[:title])
      page.assignment = assignment
      page.save!
      [assignment, page]
    end

    def get_index
      raw_api_call(:get, api_v1_course_wiki_pages_path(@course.id, format: :json),
        controller: 'wiki_pages_api', action: 'index', format: :json,
        course_id: @course.id)
    end

    def get_show(page)
      raw_api_call(:get, api_v1_course_wiki_page_path(@course.id, page.url, format: :json),
        controller: 'wiki_pages_api', action: 'show', format: :json,
        course_id: @course.id, url: page.url)
    end

    def put_update(page)
      raw_api_call(:put, "/api/v1/courses/#{@course.id}/pages/#{page.url}.json",
        {controller: 'wiki_pages_api', action: 'update', format: :json,
          course_id: @course.id, url: page.url}, { wiki_page: {} })
    end

    def get_revisions(page)
      raw_api_call(:get, "/api/v1/courses/#{@course.id}/pages/#{page.url}/revisions.json",
        controller: 'wiki_pages_api', action: 'revisions', format: :json,
        course_id: @course.id, url: page.url)
    end

    def get_show_revision(page)
      raw_api_call(:get, "/api/v1/courses/#{@course.id}/pages/#{page.url}/revisions/latest.json",
        controller: 'wiki_pages_api', action: 'show_revision', format: :json,
        course_id: @course.id, url: page.url)
    end

    def post_revert(page)
      raw_api_call(:post, "/api/v1/courses/#{@course.id}/pages/#{page.url}/revisions/1.json",
        controller: 'wiki_pages_api', action: 'revert', format: :json,
        course_id: @course.id, url: page.url, revision_id: 1)
    end

    let(:calls){ %i(get_show put_update get_revisions get_show_revision post_revert) }

    def calls_succeed(page, opts={except: []})
      get_index
      expect(JSON.parse(response.body).to_s).to include(page.title)

      calls.reject!{|call| opts[:except].include?(call) }
      calls.each{ |call| expect(self.send(call, page).to_s).to eq "200"}
    end

    def calls_fail(page)
      get_index
      expect(JSON.parse(response.body).to_s).not_to include("#{page.title}")

      calls.each{ |call| expect(self.send(call, page).to_s).to eq "401"}
    end

    before :once do
      course_with_teacher(active_all: true, user: user_with_pseudonym)
      @student_with_override, @student_without_override = create_users(2, return_type: :record)

      @assignment_1, @page_assigned_to_override = create_page_for_da(
        title: "assigned to student_with_override",
        only_visible_to_overrides: true)
      @assignment_2, @page_assigned_to_all = create_page_for_da(
        title: "assigned to all",
        only_visible_to_overrides: false)
      @page_unassigned = @course.wiki_pages.create!(
        title: "definitely not assigned",
        user: @teacher,
        editing_roles: "teachers,students")

      @course.enroll_student(@student_without_override, enrollment_state: 'active')
      @section = @course.course_sections.create!(name: "test section")
      student_in_section(@section, user: @student_with_override)
      create_section_override_for_assignment(@assignment_1, course_section: @section)

      @observer = User.create
      @observer_enrollment = @course.enroll_user(@observer, 'ObserverEnrollment',
        section: @course.course_sections.first,
        enrollment_state: 'active')
    end

    context "enabled" do
      before(:once) do
        @course.enable_feature!(:conditional_release)
      end

      it "lets the teacher see all pages" 


      it "lets students with visibility see pages" 


      it "restricts access to students without visibility" 


      it "gives observers same visibility as unassigned student" 


      it "gives observers same visibility as assigned student" 


      it "gives observers without visibility all the things" 

    end

    context "disabled" do
      before(:once) do
        @course.disable_feature!(:conditional_release)
      end

      it "lets the teacher see all pages" 


      it "lets students with visibility see pages" 


      it "lets students without visibility see pages" 


      it "gives observers same visibility as unassigned student" 


      it "gives observers same visibility as assigned student" 


      it "gives observers without visibility all the things" 

    end
  end
end


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

describe "Modules API", type: :request do
  before :once do
    course_factory.offer!

    @module1 = @course.context_modules.create!(:name => "module1")
    @assignment = @course.assignments.create!(:name => "pls submit", :submission_types => ["online_text_entry"], :points_possible => 42)
    @assignment.publish! if @assignment.unpublished?

    @assignment_tag = @module1.add_item(:id => @assignment.id, :type => 'assignment')
    @quiz = @course.quizzes.create!(:title => "score 10")
    @quiz.publish! if @quiz.unpublished?

    @quiz_tag = @module1.add_item(:id => @quiz.id, :type => 'quiz')
    @topic = @course.discussion_topics.create!(:message => 'pls contribute')
    @topic.publish! if @topic.unpublished?

    @topic_tag = @module1.add_item(:id => @topic.id, :type => 'discussion_topic')
    @subheader_tag = @module1.add_item(:type => 'context_module_sub_header', :title => 'external resources')
    @external_url_tag = @module1.add_item(:type => 'external_url', :url => 'http://example.com/lolcats',
                                          :title => 'pls view', :indent => 1)
    @external_url_tag.publish! if @external_url_tag.unpublished?

    @module1.completion_requirements = {
        @assignment_tag.id => { :type => 'must_submit' },
        @quiz_tag.id => { :type => 'min_score', :min_score => 10 },
        @topic_tag.id => { :type => 'must_contribute' },
        @external_url_tag.id => { :type => 'must_view' } }
    @module1.save!

    @christmas = Time.zone.local(Time.now.year + 1, 12, 25, 7, 0)
    @module2 = @course.context_modules.create!(:name => "do not open until christmas",
                                               :unlock_at => @christmas,
                                               :require_sequential_progress => true)
    @module2.prerequisites = "module_#{@module1.id}"
    @wiki_page = @course.wiki_pages.create!(:title => "Front Page", :body => "")
    @wiki_page.workflow_state = 'active'; @wiki_page.save!
    @wiki_page_tag = @module2.add_item(:id => @wiki_page.id, :type => 'wiki_page')

    @module3 = @course.context_modules.create(:name => "module3")
    @module3.workflow_state = 'unpublished'
    @module3.save!
  end

  before do
    @attachment = attachment_model(:context => @course, :usage_rights => @course.usage_rights.create!(legal_copyright: '(C) 2012 Initrode', use_justification: 'creative_commons', license: 'cc_by_sa'), :uploaded_data => stub_file_data("test_image.jpg", File.read(Rails.root+"spec/fixtures/test_image.jpg"), "image/jpeg"))

    @attachment_tag = @module2.add_item(:id => @attachment.id, :type => 'attachment')
    @module2.save!
  end

  context "as a teacher" do
    before :once do
      course_with_teacher(:course => @course, :active_all => true)
    end

    describe "duplicating" do
      it "can duplicate if no quiz" 


      it "cannot duplicate module with quiz" 


      it "cannot duplicate nonexistent module" 


      it "cannot duplicate if feature disabled" 

    end

    describe "index" do
      it "should list published and unpublished modules" 


      it "should include items if requested" 


      it "should only fetch visibility information once" 


      context 'index including content details' do
        let(:json) do
          api_call(:get, "/api/v1/courses/#{@course.id}/modules?include[]=items&include[]=content_details",
            :controller => "context_modules_api", :action => "index", :format => "json",
            :course_id => "#{@course.id}", :include => %w(items content_details))
        end
        let(:assignment_details) { json.find{|mod| mod['id'] == @module1.id}['items'].find{|item| item['id'] == @assignment_tag.id}['content_details'] }
        let(:wiki_page_details) { json.find{|mod| mod['id'] == @module2.id}['items'].find{|item| item['id'] == @wiki_page_tag.id}['content_details'] }
        let(:attachment_details) { json.find{|mod| mod['id'] == @module2.id}['items'].find{|item| item['id'] == @attachment_tag.id}['content_details'] }

        it 'should include user specific details' 


        it 'should include thumbnail_url' 


        it 'should include usage_rights information' 


        it 'should include lock information' 

      end

      it "should skip items for modules that have too many" 


      it "should paginate the module list" 


      it "should search for modules by name" 


      it "should search for modules and items by name" 

    end

    describe "show" do
      it "should show a single module" 


      context 'show including content details' do
        let(:module1_json) do
          api_call(:get, "/api/v1/courses/#{@course.id}/modules/#{@module1.id}?include[]=items&include[]=content_details",
            :controller => "context_modules_api", :action => "show", :format => "json",
            :course_id => "#{@course.id}", :include => %w(items content_details), :id => "#{@module1.id}")
        end
        let(:module2_json) do
          api_call(:get, "/api/v1/courses/#{@course.id}/modules/#{@module2.id}?include[]=items&include[]=content_details",
            :controller => "context_modules_api", :action => "show", :format => "json",
            :course_id => "#{@course.id}", :include => %w(items content_details), :id => "#{@module2.id}")
        end
        let(:assignment_details) { module1_json['items'].find{|item| item['id'] == @assignment_tag.id}['content_details'] }
        let(:wiki_page_details) { module2_json['items'].find{|item| item['id'] == @wiki_page_tag.id}['content_details'] }

        it 'should include user specific details' 


        it 'sould include lock information' 

      end

      it "should show a single unpublished module" 


      it "should include items if requested" 


      it "should not include items if there are too many" 

    end

    describe "batch update" do
      before :once do
        @path = "/api/v1/courses/#{@course.id}/modules"
        @path_opts = { :controller => "context_modules_api", :action => "batch_update", :format => "json",
                       :course_id => @course.to_param }
        @test_modules = (1..4).map { |x| @course.context_modules.create! :name => "test module #{x}" }
        @test_modules[2..3].each { |m| m.update_attribute(:workflow_state , 'unpublished') }
        @modules_to_update = [@test_modules[1], @test_modules[3]]

        @wiki_page = @course.wiki_pages.create(:title => 'Wiki Page Title')
        @wiki_page.unpublish!
        @wiki_page_tag = @test_modules[3].add_item(:id => @wiki_page.id, :type => 'wiki_page')

        @ids_to_update = @modules_to_update.map(&:id)
      end

      it "should publish modules (and their tags)" 


      it "should unpublish modules" 


      it "should delete modules" 


      it "should convert module ids to integer and ignore non-numeric ones" 


      it "should not update soft-deleted modules" 


      it "should 404 if no modules exist with the given ids" 


      it "should 404 if only non-numeric ids are given" 


      it "should succeed if only some ids don't exist" 


      it "should 400 if :module_ids is missing" 


      it "should 400 if :event is missing" 


      it "should 400 if :event is invalid" 


      it "should scope to the course" 

    end

    describe "update" do
      before :once do
        course_with_teacher(:active_all => true)

        @module1 = @course.context_modules.create(:name => "unpublished")
        @module1.workflow_state = 'unpublished'
        @module1.save!

        @wiki_page = @course.wiki_pages.create(:title => 'Wiki Page Title')
        @wiki_page.unpublish!
        @wiki_page_tag = @module1.add_item(:id => @wiki_page.id, :type => 'wiki_page')

        @module2 = @course.context_modules.create!(:name => "published")
      end

      it "should update the attributes" 


      it "should update the position" 


      it "should publish modules (and their tags)" 


      it "should publish module tag items even if the tag itself is already published" 


      it "should unpublish modules" 


      it "should set prerequisites" 


      it "should only reset prerequisites if parameter is included and is blank" 


    end

    describe "create" do
      before :once do
        course_with_teacher(:active_all => true)
      end

      it "should create a module with attributes" 


      it "should require a name" 


      it "should insert new module into specified position" 


      it "should set prerequisites" 

    end

    it "should delete a module" 


    it "should show module progress for a student" 

  end

  context "as a student" do
    before :once do
      course_with_student(:course => @course, :active_all => true)
    end

    it "should show locked state" 


    it "cannot duplicate" 


    it "should show module progress" 


    context 'show including content details' do
      let(:module1_json) do
        api_call(:get, "/api/v1/courses/#{@course.id}/modules/#{@module1.id}?include[]=items&include[]=content_details",
          :controller => "context_modules_api", :action => "show", :format => "json",
          :course_id => "#{@course.id}", :include => %w(items content_details), :id => "#{@module1.id}")
      end
      let(:module2_json) do
        api_call(:get, "/api/v1/courses/#{@course.id}/modules/#{@module2.id}?include[]=items&include[]=content_details",
          :controller => "context_modules_api", :action => "show", :format => "json",
          :course_id => "#{@course.id}", :include => %w(items content_details), :id => "#{@module2.id}")
      end
      let(:assignment_details) { module1_json['items'].find{|item| item['id'] == @assignment_tag.id}['content_details'] }
      let(:wiki_page_details) { module2_json['items'].find{|item| item['id'] == @wiki_page_tag.id}['content_details'] }

      it 'should include user specific details' 


      it 'sould include lock information' 

    end

    it "should not list unpublished modules" 


    it "should not show a single unpublished module" 


    describe "batch update" do
      it "should disallow deleting" 


      it "should disallow publishing" 


      it "should disallow unpublishing" 

    end

    it "should disallow update" 


    it "should disallow create" 


    it "should disallow destroy" 


    it "should not show progress for other students" 

  end

  context "differentiated assignments" do
    before(:once) do
      @assignment.only_visible_to_overrides = true; @assignment.save!
      @other_section = @course.course_sections.create! name: "other section"
      create_section_override_for_assignment(@assignment, {course_section: @other_section})
    end

    it "should exclude unassigned assignments" 


    it "should include override assignments" 


    it "should include observed students' assigned assignment items" 

  end

  context "unauthorized user" do
    before do
      user_factory
    end

    it "should check permissions" 

  end
end


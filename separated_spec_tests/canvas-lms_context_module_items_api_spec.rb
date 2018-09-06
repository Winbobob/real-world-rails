#
# Copyright (C) 2013 Instructure, Inc.
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

describe "Module Items API", type: :request do
  before :once do
    course_factory.offer!

    @module1 = @course.context_modules.create!(:name => "module1")
    @assignment = @course.assignments.create!(:name => "pls submit", :submission_types => ["online_text_entry"], :points_possible => 20)
    @assignment.publish! if @assignment.unpublished?
    @assignment_tag = @module1.add_item(:id => @assignment.id, :type => 'assignment')

    @quiz = @course.quizzes.create!(:title => "score 10")
    @quiz.publish!
    @quiz_tag = @module1.add_item(:id => @quiz.id, :type => 'quiz')

    @topic = @course.discussion_topics.create!(:message => 'pls contribute')
    @topic.publish! if @topic.unpublished?
    @topic_tag = @module1.add_item(:id => @topic.id, :type => 'discussion_topic')

    @subheader_tag = @module1.add_item(:type => 'context_module_sub_header', :title => 'external resources')
    @subheader_tag.publish! if @subheader_tag.unpublished?

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
    @wiki_page = @course.wiki_pages.create!(:title => "wiki title", :body => "")
    @wiki_page.workflow_state = 'active'; @wiki_page.save!
    @wiki_page_tag = @module2.add_item(:id => @wiki_page.id, :type => 'wiki_page')
    @attachment = attachment_model(:context => @course)
    @attachment_tag = @module2.add_item(:id => @attachment.id, :type => 'attachment')
    @module2.save!

    @module3 = @course.context_modules.create(:name => "module3")
    @module3.workflow_state = 'unpublished'
    @module3.save!
  end

  context "as a teacher" do
    before :once do
      course_with_teacher(:course => @course, :active_all => true)
    end

    it 'properly shows a wiki page item locked by CYOE from progressions' 


    it "should list module items" 


    context 'index with content details' do
      let(:json) do
        api_call(:get, "/api/v1/courses/#{@course.id}/modules/#{@module1.id}/items?include[]=content_details",
          :controller => "context_module_items_api", :action => "index", :format => "json",
          :course_id => "#{@course.id}", :module_id => "#{@module1.id}", :include => ['content_details'])
      end
      let(:assignment_details) { json.find{|item| item['id'] == @assignment_tag.id }['content_details'] }

      it "should include item details" 

    end

    it 'should return the url for external tool items' 


    it 'should return the url for external tool manually entered urls' 


    it "should return the url for external tool with tool_id" 


    it "should show module items individually" 


    context 'with differentiated assignments' do
      before :each do
        course_with_student(:course => @course, :active_all => true)
        @user = @student
      end

      it "should find module items" 


      it "should not find module items when hidden" 

    end

    context 'show with content details' do
      let(:json) do
        api_call(:get, "/api/v1/courses/#{@course.id}/modules/#{@module1.id}/items/#{@assignment_tag.id}?include[]=content_details",
          :controller => "context_module_items_api", :action => "show", :format => "json",
          :course_id => "#{@course.id}", :module_id => "#{@module1.id}", :include => ['content_details'],
          :id => "#{@assignment_tag.id}")
      end
      let(:assignment_details) { json['content_details'] }

      it "should include item details" 

    end

    it "should frame_external_urls" 


    it "should paginate the module item list" 


    it "should search for module items by name" 


    describe "POST 'create'" do
      it "should create a module item" 


      it "creates an unpublished tag for an unpublished item" 


      it "should create with page_url for wiki page items" 


      it "should require valid page_url" 


      it "should require a non-deleted page_url" 


      it "should create with new_tab for external tool items" 


      it "should create with url for external url items" 


      it "should insert into correct position" 


      it "should set completion requirement" 


      it "should require valid completion requirement type" 

    end

    describe "PUT 'update'" do
      it "should update attributes" 


      it "should update the user for a wiki page sync" 


      it "should update new_tab" 


      it "should update the url for an external url item" 


      it "should ignore the url for a non-applicable type" 


      it "should update the position" 


      it "should set completion requirement" 


      it "should remove completion requirement" 


      it "should publish module items" 


      it "should unpublish module items" 


      describe "moving items between modules" do
        it "should move a module item" 


        it "should move completion requirements" 


        it "should set the position in the target module" 


        it "should verify the target module is in the course" 

      end
    end

    it "should delete a module item" 


    it "should show module item completion for a student" 


    describe "GET 'module_item_sequence'" do
      it "should 400 if the asset_type is missing" 


      it "should 400 if the asset_id is missing" 


      it "should return a skeleton json structure if referencing an item that isn't in a module" 


      it "should work with the first item" 


      it "should skip subheader items" 


      it "should find a (non-deleted) wiki page by url" 


      it "should skip a deleted module" 


      it "should skip a deleted item" 


      it "should find an item containing the assignment associated with a quiz" 


      it "should find an item containing the assignment associated with a graded discussion topic" 


      it "should deal with multiple modules having the same position" 


      it "should treat a nil position as sort-last" 


      context "with duplicate items" do
        before :once do
          @other_quiz_tag = @module3.add_item(:id => @quiz.id, :type => 'quiz')
        end

        it "should return multiple items" 


        it "should limit the number of sequences returned to 10" 


        it "should return a single item, given the content tag" 

      end
    end

    describe 'POST select_mastery_path' do
      before do
        allow(ConditionalRelease::Service).to receive(:enabled_in_context?).and_return(true)
        allow(ConditionalRelease::Service).to receive(:select_mastery_path).and_return({ code: '200', body: {} })
        student_in_course(course: @course)
      end

      def call_select_mastery_path(item, assignment_set_id, student_id, opts = {})
        api_call(:post, "/api/v1/courses/#{@course.id}/modules/#{@module1.id}/items/#{item.id}/select_mastery_path",
                        { controller: "context_module_items_api", action: 'select_mastery_path', format: 'json',
                          course_id: "#{@course.id}", module_id: "#{@module1.id}", id: "#{item.id}" },
                        { assignment_set_id: assignment_set_id, student_id: student_id },
                        {},
                        opts)
      end

      it 'should require mastery paths to be enabled' 


      it 'should require a student_id specified' 


      it 'should require an assignment_set_id specified' 


      it 'should require the module item be attached to an assignment' 


      it 'should return the CYOE error if the action is unsuccessful' 


      it 'should not allow unpublished items' 


      context 'successful' do
        def cyoe_returns(assignment_ids)
          cyoe_ids = assignment_ids.map {|id| { 'assignment_id' => "#{id}" }} # cyoe ids in strings
          cyoe_response = { 'assignments' => cyoe_ids }
          allow(ConditionalRelease::Service).to receive(:select_mastery_path).and_return({ code: '200', body: cyoe_response })
        end

        it 'should return a list of assignments if the action is successful' 


        it 'should return a list of associated module items' 


        it 'should return assignments in the same order as cyoe' 


        it 'should return only published assignments' 

      end
    end
  end

  context "as a student" do
    before :once do
      course_with_student(:course => @course, :active_all => true)
    end

    def override_assignment
      @due_at = Time.zone.now + 2.days
      @unlock_at = Time.zone.now + 1.days
      @lock_at = Time.zone.now + 3.days
      @override = assignment_override_model(:assignment => @assignment, :due_at => @due_at, :unlock_at => @unlock_at, :lock_at => @lock_at)
      @override_student = @override.assignment_override_students.build
      @override_student.user = @student
      @override_student.save!
      overrides = AssignmentOverrideApplicator.overrides_for_assignment_and_user(@assignment, @student)
      @student = nil
      overrides
    end

    it "should list module items" 


    context 'differentiated_assignments' do
      before do
        @new_section = @course.course_sections.create!(name: "test section")
        @student.enrollments.each(&:destroy_permanently!)
        student_in_section(@new_section, user: @student)
        @assignment.only_visible_to_overrides = true
        @assignment.save!
      end

      context 'enabled' do
        context 'with override' do
          before{create_section_override_for_assignment(@assignment, {course_section: @new_section})}
          it "should list all assignments" 

        end
        context 'without override' do
          it "should exclude unassigned assignments" 

        end
      end
    end

    context 'index including content details' do
      let(:json) do
        api_call(:get, "/api/v1/courses/#{@course.id}/modules/#{@module1.id}/items?include[]=content_details",
          :controller => "context_module_items_api", :action => "index", :format => "json",
          :course_id => "#{@course.id}", :module_id => "#{@module1.id}", :include => ['content_details'])
      end
      let(:assignment_details) { json.find{|item| item['id'] == @assignment_tag.id}['content_details'] }
      let(:external_url_details) { json.find{|item| item['id'] == @external_url_tag.id}['content_details'] }

      before :once do
        override_assignment
        @module1.update_attribute(:require_sequential_progress, true)
      end

      it "should include user specific details" 


      it "should include lock information" 


      it "should include lock information for contentless tags" 

    end

    context "index including mastery_paths (CYOE)" do
      def has_assignment_model?(item)
        rules = item.deep_symbolize_keys
        return false unless rules[:mastery_paths].present?
        rules[:mastery_paths][:assignment_sets].find do |set|
          set[:assignments].find do |asg|
            asg.key? :model
          end
        end
      end

      before :once do
        @cyoe_module1 = @course.context_modules.create!(:name => "cyoe_module1")
        @cyoe_module2 = @course.context_modules.create!(:name => "cyoe_module2")
        @cyoe_module3 = @course.context_modules.create!(:name => "cyoe_module3")

        [@cyoe_module1, @cyoe_module2, @cyoe_module3].each do |mod|
          mod.add_item(:id => @assignment.id, :type => 'assignment')
          mod.add_item(:id => @quiz.id, :type => 'quiz')
          mod.add_item(:id => @topic.id, :type => 'discussion_topic')
          mod.add_item(:id => @wiki_page.id, :type => 'wiki_page')
          mod.add_item(:type => 'external_url', :url =>
                       'http://example.com/cyoe', :title => 'cyoe link',
                       :indent => 1, :updated_at => nil).publish!
          mod.publish
        end
      end

      before :each do
        @resp = [{
                  locked: false,
                  trigger_assignment: @quiz.assignment_id,
                  assignment_sets: [{
                    id: 1,
                    scoring_range_id: 1,
                    created_at: @assignment.created_at,
                    updated_at: @assignment.updated_at,
                    position: 1,
                    assignments: [{
                      id: 1,
                      assignment_id: @assignment.id,
                      created_at: @assignment.created_at,
                      updated_at: @assignment.updated_at,
                      assignment_set_id: 1,
                      position: 1
                    }]
                  }]
                }]
        allow(ConditionalRelease::Service).to receive_messages(headers_for: {}, submissions_for: [],
          domain_for: "canvas.xyz", "enabled_in_context?" => true,
          rules_summary_url: "cyoe.abc/rules", request_rules: @resp)
      end

      describe "CYOE interaction" do
        it "makes a request to the CYOE service when included" 

      end

      describe "module item list response data" do
        it "includes conditional release information from CYOE" 


        it 'properly omits a wiki page item locked by CYOE from progressions' 


        it 'does not show an unpublished wiki page in progressions' 


        it 'does not omit a wiki page item if CYOE is disabled' 


        it "includes model data merge from Canvas" 

      end

      describe "module item sequence response data" do
        it "should include mastery path information" 

      end

      describe "caching CYOE data" do
        it "uses the cache when requested again" 

      end
    end

    context 'show including content details' do
      let(:json) do
        api_call(:get, "/api/v1/courses/#{@course.id}/modules/#{@module1.id}/items/#{@assignment_tag.id}?include[]=content_details",
          :controller => "context_module_items_api", :action => "show", :format => "json",
          :course_id => "#{@course.id}", :module_id => "#{@module1.id}", :include => ['content_details'],
          :id => "#{@assignment_tag.id}")
      end
      let(:assignment_details) { json['content_details'] }

      before :once do
        override_assignment
      end

      it "should include user specific details" 


      it "should include lock information" 

    end

    it "should show module item completion" 


    it "should not show unpublished items" 


    it "should mark viewed and redirect external URLs" 


    it "should disallow update" 


    it "should disallow create" 


    it "should disallow destroy" 


    it "should not show module item completion for other students" 


    context 'mark_as_done' do
      before :once do
        @module = @course.context_modules.create(:name => "mark_as_done_module")
        wiki_page = @course.wiki_pages.create!(:title => "mark_as_done page", :body => "")
        wiki_page.workflow_state = 'active'
        wiki_page.save!
        @tag = @module.add_item(:id => wiki_page.id, :type => 'wiki_page')
        @module.completion_requirements = {
          @tag.id => { :type => 'must_mark_done' },
        }
        @module.save!
      end

      def mark_done_api_call
        api_call(:put,
                 "/api/v1/courses/#{@course.id}/modules/#{@module.id}/items/#{@tag.id}/done",
                 :controller => "context_module_items_api",
                 :action     => "mark_as_done",
                 :format     => "json",
                 :course_id  => @course.to_param,
                 :module_id  => @module.to_param,
                 :id => @tag.to_param,
                )
      end

      def mark_not_done_api_call
        api_call(:delete,
                 "/api/v1/courses/#{@course.id}/modules/#{@module.id}/items/#{@tag.id}/done",
                 :controller => "context_module_items_api",
                 :action     => "mark_as_not_done",
                 :format     => "json",
                 :course_id  => @course.to_param,
                 :module_id  => @module.to_param,
                 :id => @tag.to_param,
                )
      end

      describe "PUT" do
        it "should fulfill must-mark-done requirement" 

      end

      describe "DELETE" do
        it "should remove must-mark-done requirement" 


        it "should work even when there is none must-mark-done requirement to delete" 

      end
    end

    describe "POST 'mark_item_read'" do
      it "should fulfill must-view requirement" 


      it "should not fulfill must-view requirement on unpublished item" 


      it "should not fulfill must-view requirement on locked item" 

    end

    describe "GET 'module_item_sequence'" do
      context "unpublished item" do
        before :once do
          @quiz_tag.unpublish
        end

        it "should not find an unpublished item" 


        it "should skip an unpublished item in the sequence" 

      end

      context "unpublished module" do
        before :once do
          @new_assignment_1 = @course.assignments.create!
          @new_assignment_1_tag = @module3.add_item :type => 'assignment', :id => @new_assignment_1.id
          @module4 = @course.context_modules.create!
          @new_assignment_2 = @course.assignments.create!
          @new_assignment_2_tag = @module4.add_item :type => 'assignment', :id => @new_assignment_2.id
        end

        it "should not find an item in an unpublished module" 


        it "should skip an unpublished module in the sequence" 

      end
    end

    describe 'POST select_mastery_path' do
      before do
        allow(ConditionalRelease::Service).to receive(:enabled_in_context?).and_return(true)
        allow(ConditionalRelease::Service).to receive(:select_mastery_path).and_return({ code: '200', body: { 'assignments' => [] } })
      end

      it 'should allow a mastery path' 


      it 'should allow specifying own student id' 


      it 'should not allow selecting another student' 

    end
  end

  describe 'POST duplicate' do
    before :once do
      course_with_teacher(:course => @course, :active_all => true)
    end

    it 'should duplicate module item' 


    it 'should not duplicate invalid module item' 

  end

  context "unauthorized user" do
    before :once do
      user_factory
    end

    it "should check permissions" 

  end
end


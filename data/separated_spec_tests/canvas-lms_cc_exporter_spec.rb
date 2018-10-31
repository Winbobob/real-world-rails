#
# Copyright (C) 2011 - present Instructure, Inc.
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

require File.expand_path(File.dirname(__FILE__) + '/cc_spec_helper')
require File.expand_path(File.dirname(__FILE__) + '/../../lti2_course_spec_helper')

require 'nokogiri'

describe "Common Cartridge exporting" do
  let(:ccc_schema) do
    get_ccc_schema
  end

  it "should collect errors and finish running" 


  context "creating .zip exports" do
    include WebMock::API

    before :once do
      course_with_teacher(:active_all => true)
      @ce = @course.content_exports.build
      @ce.export_type = ContentExport::COURSE_COPY
      @ce.user = @user
    end

    after(:each) do
      if @file_handle && File.exist?(@file_handle.path)
        FileUtils::rm_rf(@file_handle.path)
      end
    end

    def run_export(opts = {})
      @ce.export_without_send_later(opts)
      expect(@ce.error_messages).to eq []
      @file_handle = @ce.attachment.open :need_local_file => true
      @zip_file = Zip::File.open(@file_handle.path)
      @manifest_body = @zip_file.read("imsmanifest.xml")
      @manifest_doc = Nokogiri::XML.parse(@manifest_body)
    end

    def mig_id(obj)
      CC::CCHelper.create_key(obj)
    end

    def check_resource_node(obj, type, selected=true)
      res = @manifest_doc.at_css("resource[identifier=#{mig_id(obj)}][type=\"#{type}\"]")
      if selected
        expect(res).not_to be_nil
      else
        expect(res).to be_nil
      end
    end

    it "should selectively export all object types" 


    it "should use instfs to host export files if it is enabled" 


    it "should create a quizzes-only export" 


    it "should export quizzes with groups that point to external banks" 


    it "should selectively create a quizzes-only export" 


    it "should include any files referenced in html" 


    it "should export web content files properly when display name is changed" 


    it "should not fail when answers are missing for FIMB" 


    it "should deal with file URLs in anchor bodies" 


    it "has valid course settings XML" 


    it "should not export syllabus if not selected" 


    it "should export syllabus when selected" 


    describe "tool proxies" do
      include_context "lti2_course_spec_helper"

      before(:each) do
        tool_proxy.context = @course
        tool_proxy.save!
      end

      it "should export tool profiles" 

    end

    it "should use canvas_export.txt as flag" 


    it "should not error if the course name is too long" 


    it "should export media tracks" 


    it "should export CC 1.3 assignments" 


    context 'similarity detection tool associations' do
      include_context "lti2_course_spec_helper"

      before(:each) do
        allow_any_instance_of(Lti::AssignmentSubscriptionsHelper).to receive(:create_subscription) { SecureRandom.uuid }
        allow_any_instance_of(Lti::AssignmentSubscriptionsHelper).to receive(:destroy_subscription) { SecureRandom.uuid }
        allow(Lti::ToolProxy).to receive(:find_all_proxies_for_context) { Lti::ToolProxy.where(id: tool_proxy.id) }
        tool_proxy.context = @course
        tool_proxy.save!

        assignment = @course.assignments.create! name: 'test assignment', submission_types: 'online_upload'
        assignment.tool_settings_tool = message_handler
        assignment.save!
        @ce.export_type = ContentExport::COMMON_CARTRIDGE
        @ce.save!
      end

      describe 'attributes' do
        let(:assignment_xml_doc) do
          run_export
          assignment_xml_file = @manifest_doc.at_css("resource[href*='test-assignment.html'] file[href*='.xml']").attr('href')
          Nokogiri::XML(@zip_file.read(assignment_xml_file))
        end

        let(:similarity_tool_el) do
          assignment_xml_doc.elements.first.elements.find { |e| e.name == 'similarity_detection_tool' }
        end

        it 'exports the vendor code' 


        it 'exports the product code' 


        it 'exports the resource type code' 


        it 'exports the originality report visibility setting' 

      end
    end

    context 'tool settings' do
      include_context "lti2_course_spec_helper"

      let(:custom) do
        {
          'custom_var_1' => 'value one',
          'custom_var_2' => 'value two'
        }
      end

      let(:custom_parameters) do
        {
          'custom_parameter_1' => 'param value one',
          'custom_parameter_2' => 'param value two'
        }
      end

      let(:assignment_xml_doc) do
        run_export
        assignment_xml_file = @manifest_doc.at_css("resource[href*='test-assignment.html'] file[href*='.xml']").attr('href')
        Nokogiri::XML(@zip_file.read(assignment_xml_file))
      end

      before(:each) do
        allow_any_instance_of(Lti::AssignmentSubscriptionsHelper).to receive(:create_subscription) { SecureRandom.uuid }
        allow_any_instance_of(Lti::AssignmentSubscriptionsHelper).to receive(:destroy_subscription) { SecureRandom.uuid }
        allow(Lti::ToolProxy).to receive(:find_all_proxies_for_context) { Lti::ToolProxy.where(id: tool_proxy.id) }

        assignment = @course.assignments.create! name: 'test assignment', submission_types: 'online_upload'
        assignment.tool_settings_tool = message_handler
        assignment.save!

        tool_proxy.context = @course
        tool_proxy.save!
        tool_proxy.tool_settings.create!(
          context: course,
          tool_proxy: tool_proxy,
          resource_link_id: assignment.lti_context_id,
          custom: custom,
          custom_parameters: custom_parameters,
          product_code: tool_proxy.product_family.product_code,
          vendor_code: tool_proxy.product_family.vendor_code
        )

        @ce.export_type = ContentExport::COMMON_CARTRIDGE
        @ce.save!
      end

      describe 'tool attributes' do
        it 'exports the vendor code' 


        it 'exports the product code' 

      end

      describe 'custom values' do
        it 'exports the custom hash' 


        it 'exports the custom parameters hash' 

      end
    end

    it "should export unpublished modules and items" 


    it "should export file copyright information" 


    context "considering rights of provided user" do
      before :once do
        @ag = @course.assignment_groups.create!(:name => 'group1')
        @published = @course.assignments.create!({
          :title => 'Assignment 1', :points_possible => 10, :assignment_group => @ag
        })
        @unpublished = @course.assignments.create!({
          :title => 'Assignment 2', :points_possible => 10, :assignment_group => @ag
        })
        @unpublished.unpublish
        @ce.save!
      end

      it "should show unpublished assignmnets for a teacher" 


      it "should not show unpublished assignments for a student" 


      it "should always use relevant migration ids in anchor tags when exporting for ePub" 

    end

    context 'locked items' do
      it "should not export locked items for a student" 


      describe 'for teachers in concluded courses' do
        before :once do
          teacher_in_course :active_all => true
          @ce.user = @teacher
          @ce.save!
          @course.complete!
        end

        it "still exports topics that are closed for comments" 

      end
    end

    context 'attachment permissions' do
      before do
        folder = Folder.root_folders(@course).first
        @visible = Attachment.create!({
          :uploaded_data => stub_png_data('visible.png'),
          :folder => folder,
          :context => @course
        })
        @hidden = Attachment.create!({
          :uploaded_data => stub_png_data('hidden.png'),
          :folder => folder,
          :context => @course,
          :hidden => true
        })
        @locked = Attachment.create!({
          :uploaded_data => stub_png_data('locked.png'),
          :folder => folder,
          :context => @course,
          :locked => true
        })
        @ce.selected_content = {
          all_attachments: "1"
        }
        @ce.export_type = ContentExport::COMMON_CARTRIDGE
        @ce.save!
      end

      it "should include all files for teacher" 


      it "should not include hidden or locked attachments for student" 

    end
  end
end


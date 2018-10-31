# encoding: utf-8
#
# Copyright (C) 2016 - present Instructure, Inc.
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

require 'nokogiri'

describe CC::BasicLTILinks do
  subject { (Class.new { include CC::BasicLTILinks }).new }

  let (:tool) do
    ContextExternalTool.new
  end

  before do
    allow(subject).to receive(:for_course_copy).and_return false
  end

  describe "#create_blti_link" do

    let(:lti_doc) { Builder::XmlMarkup.new(target: xml, indent: 2) }
    #this is the target for Builder::XmlMarkup. this is how you access the generated XML
    let(:xml) { '' }

    it "sets the encoding to 'UTF-8'" 


    it "sets the version to '1.0'" 


    it "sets the namespaces correctly" 


    it "sets the title from the tool name" 


    it "sets the description from the tool description" 


    it "sets a launch_url if the url uses the http scheme" 


    it "sets a secure_launch_url if the url uses the https scheme" 


    it "add an icon element if found in the tool settings" 


    it "sets the vendor code to 'unknown'" 


    it "sets the vendor name to 'unknown'" 


    it "adds custom fields" 


    context "extensions" do

      it "creates an extensions node" 


      it "adds the tool_id if one is present" 


      it "adds the privacy level if there is a workflow_state on the tool" 


      it "adds the domain if set" 


      it "adds the selection_width if set" 


      it "adds the selection_height if set" 


      it "adds non placment extensions" 


      it "doesn't add non placement extensions if their value is a collection" 


      context "course_copy" do
        before do
          allow(subject).to receive(:for_course_copy).and_return true
        end

        it "sets the consumer_key if it's a course copy" 


        it "sets the shared_secret if it's a course copy" 

      end

      context "Placements" do
        it "adds the placement node if it exists" 


        it "adds settings for placements" 


        it "adds labels correctly" 


        it "adds custom_fields" 

      end

      context "vendor extensions" do
        it "adds vendor extensions" 


        it "adds custom fields" 


      end

    end
  end
end


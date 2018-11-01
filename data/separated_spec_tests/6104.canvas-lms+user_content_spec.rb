#
# Copyright (C) 2011 Instructure, Inc.
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

require File.expand_path(File.dirname(__FILE__) + '/api_spec_helper')

require 'nokogiri'

describe UserContent, type: :request do
  before :once do
    course_with_teacher(:active_all => true)
    attachment_model
  end

  it "should translate course file download links to directly-downloadable urls" 


  it "should translate group file download links to directly-downloadable urls" 


  it "should translate file download links to directly-downloadable urls for deleted and replaced files" 


  it "should not corrupt absolute links" 


  it "should not remove wrap parameter on file download links" 


  it "should translate file preview links to directly-downloadable preview urls" 


  it "should translate media comment links to embedded video tags" 


  it "should translate media comment audio tags" 


  it "should not translate links in content not viewable by user" 


  it "should prepend the hostname to all absolute-path links" 


  it "should not choke on funny email addresses" 


  context "data api endpoints" do
    context "course context" do
      it "should process links to each type of object" 

    end

    context "group context" do
      it "should process links to each type of object" 

    end

    context "user context" do
      it "should process links to each type of object" 

    end
  end

  context "process_incoming_html_content" do
    class Tester
      include Api
    end

    let(:tester) { Tester.new }

    it "should add the expected href to instructure_inline_media_comment anchors" 


    it "should translate video and audio instructure_inline_media_comment tags" 


    context "with verified user-context file links" do
      before do
        user_factory
        attachment_model :context => @user
      end

      def confirm_url_stability(url)
        link = %Q{<a href="#{url}">what</a>}
        html = tester.process_incoming_html_content(link)
        doc = Nokogiri::HTML::DocumentFragment.parse(html)
        expect(doc.at_css('a')['href']).to eq url
      end

      it "ignores them when scoped to the file" 


      it "ignores them when scoped to the user" 

    end

    context "with verified user-context file links" do
      before do
        user_factory
        attachment_model :context => @user
      end

      def confirm_url_stability(url)
        link = %Q{<a href="#{url}">what</a>a>}
        html = tester.process_incoming_html_content(link)
        doc = Nokogiri::HTML::DocumentFragment.parse(html)
        expect(doc.at_css('a')['href']).to eq url
      end

      it "ignores them when scoped to the file" 


      it "ignores them when scoped to the user" 


      it "ignores them when they include the host" 

    end
  end

  describe ".api_bulk_load_user_content_attachments" do
    it "returns a hash of assignment_id => assignment" 

  end

  describe "latex_to_mathml" do
    it "returns mathml on success" 


    it "returns empty string on parse error" 

  end

  describe "escape" do
    describe "with equation images" do
      context "valid latex" do
        before do
          @latex = '\frac{a}{b}'
          @html = "<img class='equation_image' alt='#{@latex}' />"
        end

        it "retains the alt attribute" 


        it "adds mathml in a span" 

      end

      context "invalid latex" do
        before do
          @latex = '\frac{a}{' # incomplete
          @html = "<img class='equation_image' alt='#{@latex}' />"
        end

        it "handles error gracefully" 


        it "retains the alt attribute" 


        it "doesn't add mathml span" 

      end
    end
  end
end


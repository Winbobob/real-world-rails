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

require 'nokogiri'

describe AlignmentsHelper do
  include AlignmentsHelper
  include ApplicationHelper
  include Rails.application.routes.url_helpers

  before(:once) do
    account_model
    assignment_model
  end

  let_once(:outcome) {
    @course.created_learning_outcomes.create!(title: 'outcome')
  }

  let_once(:account_outcome) {
    @account.created_learning_outcomes.create!(title: 'account outcome!')
  }

  let_once(:alignment) {
    tag = ContentTag.create(
      content: outcome,
      context: outcome.context,
      tag_type: 'learning_outcome')
    outcome.alignments << tag
    tag
  }

  let_once(:graded_alignment) {
    tag = ContentTag.create(
        content: @assignment,
        context: outcome.context,
        tag_type: 'learning_outcome')
    outcome.alignments << tag
    tag
  }

  describe "outcome_alignment_url" do
    context "without an alignment" do
      it "should return nil if context is an account" 

    end

    context "with an alignment" do
      it "should return a url path" 

    end
  end

  describe "link_to_outcome_alignment" do
    context "without an alignment" do
      let(:string) { link_to_outcome_alignment(@course, outcome) }

      it "should not include an icon-* html class" 


      it "should be a blank link tag" 

    end

    context "with an alignment" do
      let(:string) {
        link_to_outcome_alignment(@course, outcome, alignment)
      }

      it "should not include an icon-* html class" 


      it "should be a blank link tag" 

    end
  end

  describe "outcome_alignment_tag" do
    context "without an alignment" do
      let(:string) { outcome_alignment_tag(@course, outcome) {} }
      let(:html) { Nokogiri::HTML.fragment(string).children[0] }

      it "should include an id of 'alignment_blank'" 


      it "should include class alignment" 


      it "should include 1 data-* attribute" 


      it "should be hidden" 

    end

    context "with an alignment" do
      let(:string) { outcome_alignment_tag(@course, outcome, alignment) {} }
      let(:html) { Nokogiri::HTML.fragment(string).children[0] }

      it "should include an id of 'alignment_{id}'" 


      it "should have classes alignment & its content_type_class" 


      it "should data-id & data-url attributes" 


      it "should not be hidden" 

    end

    context "with a graded alignment" do
      let(:string) { outcome_alignment_tag(@course, outcome, graded_alignment) {} }
      let(:html) { Nokogiri::HTML.fragment(string).children[0] }

      it "should include html class 'also_assignment'" 

    end

    context "with a rubric association" do
      before(:once) {
        rubric_association_model({
          purpose: "grading"
        })
      }
      let(:string) { outcome_alignment_tag(@course, outcome, graded_alignment) {} }
      let(:html) { Nokogiri::HTML.fragment(string).children[0] }

      it "should have html 'data-has-rubric-association' data attritbute" 

    end
  end
end


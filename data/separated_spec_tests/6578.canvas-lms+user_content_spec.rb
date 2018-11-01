#
# Copyright (C) 2012 - present Instructure, Inc.
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

require File.expand_path(File.dirname(__FILE__) + '/../spec_helper.rb')

require 'nokogiri'

describe UserContent do
  describe ".find_user_content" do
    it "should not yield non-string width/height fields" 

  end

  describe ".find_equation_images" do
    it "yields each equation image one at a time" 

  end

  describe "css_size" do
    it "should be nil for non-numbers" 


    it "should be nil for numbers that equate to 0" 


    it "should preserve percents" 


    it "should preserve px" 


    # TODO: these ones are questionable
    it "should add 10 to raw numbers and make them px" 


    it "should be nil for numbers with an unrecognized prefix" 


    it "should keep just the raw number from numbers with an unrecognized suffix" 

  end

  describe 'HtmlRewriter' do
    let(:rewriter) do
      course_with_teacher
      UserContent::HtmlRewriter.new(@course, @teacher)
    end

    it "handler should not convert id to integer for 'wiki' matches" 


    it "handler should not convert id to integer for 'pages' matches" 


    it "should not grant public access to locked files" 


    describe "@toplevel_regex" do
      let(:regex) do
        rewriter.instance_variable_get(:@toplevel_regex)
      end

      it "matches relative paths" 


      it "matches relative paths with no content prefix" 


      it "matches absolute paths with http" 


      it "matches absolute paths with https" 


      it "doesn't match invalid hostnames" 

    end
  end

  describe ".latex_to_mathml" do
    it "translates valid latex string cleanly" 


    it "returns a blank string for invalid latex" 


    it "prefers not translating over bombing with invalid-but-understandable latex" 

  end

  describe ".escape" do
    it "stuffs mathml into a data attribute on equation images" 

  end
end


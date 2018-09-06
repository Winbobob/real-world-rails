# encoding: UTF-8
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
#

require File.expand_path(File.dirname(__FILE__) + '/../spec_helper.rb')

describe TextHelper do

  class TestClassForMixins
    extend TextHelper
    def self.t(*args)
      I18n.t(*args)
    end
  end

  def th
    TestClassForMixins
  end

  context "datetime_string" do
    it "formats datetimes" 

  end

  context "time_string" do
    around do |example|
      Timecop.freeze(Time.utc(2010, 8, 18, 12, 21), &example)
    end

    it "should be formatted properly" 


    it "should omit the minutes if it's on the hour" 


    it "accepts a timezone override" 


  end

  context "date_string" do

    it "should return correct date before the year 1000" 


    it "should include the year if the current year isn't the same" 


    it "should say the Yesterday/Today/Tomorrow if it's yesterday/today/tomorrow" 


    it "should not say the day of the week if it's exactly a few years away" 


    it "should ignore the end date if it matches the start date" 


    it "should do date ranges if the end date differs from the start date" 

  end

  context "truncate_html" do
    it "should truncate in the middle of an element" 


    it "should truncate at the end of an element" 


    it "should truncate at the beginning of an element" 

  end

  it "should insert reply to into subject" 


  context "markdown" do
    context "safety" do
      it "should escape Strings correctly" 

    end
    context "i18n" do
      it "should automatically escape Strings" 


      it "should not escape MarkdownSafeBuffers" 


      it "should inlinify single paragraphs by default" 


      it "should not inlinify single paragraphs if :inlinify => :never" 


      it "should allow wrapper with markdown" 


      it "should inlinify complex single paragraphs" 


      it "should not inlinify multiple paragraphs" 

    end
  end
end


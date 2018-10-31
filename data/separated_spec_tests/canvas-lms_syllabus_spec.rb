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

require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

require 'nokogiri'

describe "syllabus" do
  def anonymous_syllabus_access_allowed(property, value=true)
    course_with_teacher(:course => @course, :active_all => true)
    @course.send("#{property}=", value)
    @course.save!

    get "/courses/#{@course.id}/assignments/syllabus"

    expect(response).to be_success
    page = Nokogiri::HTML(response.body)
    expect(page.css('#identity a[href="/login"]')).not_to be_nil
    expect(page.at_css('#syllabusContainer')).not_to be_nil
  end

  it "should allow access to public courses" 


  it "should allow access to a public syllabus" 


  shared_examples_for "public syllabus file verifiers" do
    it "should allow viewing available files in a public syllabus" 


    it "should not allow viewing locked files in a public syllabus" 

  end

  shared_examples_for "public syllabus for authenticated file verifiers" do
    it "should allow viewing available files in a public to authenticated syllabus" 


    it "should not allow viewing locked files in a public to authenticated syllabus" 

  end

  context "as an authenticated non-course user" do
    before :each do
      user_factory(active_all: true)
      user_session(@user)
    end

    include_examples "public syllabus for authenticated file verifiers"
  end

  context "as an anonymous user" do
    include_examples "public syllabus file verifiers"
  end

  context "as an authenticated non-course user" do
    before :each do
      user_factory(active_all: true)
      user_session(@user)
    end

    include_examples "public syllabus file verifiers"
  end

  it "as an authenticated non-course user with public_syllabus_to_auth true" 


  it "should display syllabus description on syllabus course home pages" 

end


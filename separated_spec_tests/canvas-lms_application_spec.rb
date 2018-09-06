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

describe "site-wide" do
  before do
    consider_all_requests_local(false)
  end

  after do
    consider_all_requests_local(true)
  end

  let(:x_frame_options) { 'X-Frame-Options' }
  let(:x_canvas_meta) { 'X-Canvas-Meta' }
  let(:x_canvas_user_id) { 'X-Canvas-User-Id' }
  let(:x_canvas_real_user_id) { 'X-Canvas-Real-User-Id' }

  it "should render 404 when user isn't logged in" 


  it "should set the x-ua-compatible http header" 


  it "should set no-cache headers for html requests" 


  it "should NOT set no-cache headers for API/xhr requests" 


  it "should set the x-frame-options http header" 


  it "should not set x-frame-options when on a files domain" 


  context "x-canvas-meta header" do
    it "should set action information in API requests" 


    it "should set page view information in user requests" 

  end

  context "user headers" do
    before(:each) do
      course_with_teacher

      student_in_course
      user_with_pseudonym :user => @student, :username => 'student@example.com', :password => 'password'
      @student_pseudonym = @pseudonym

      account_admin_user :account => Account.site_admin
      user_with_pseudonym :user => @admin, :username => 'admin@example.com', :password => 'password'
    end

    it "should not set the logged in user headers when no one is logged in" 


    it "should set them when a user is logged in" 


    it "should set them when masquerading" 

  end

  context "breadcrumbs" do
    it "should be absent for error pages" 


    it "should be absent for error pages with user info" 

  end

  context "policy cache" do
    it "should clear the in-process policy cache between requests" 

  end

  it "should use the real user's timezone and locale setting when masquerading as a fake student" 


  it "should use the masqueree's timezone and locale setting when masquerading" 


  context "csrf protection" do
    it "returns a real status code for csrf errors" 

  end

  context "error templates" do
    it "returns an html error page even for non-html requests" 

  end

  context "stringifying ids" do
    it "stringifies ids when objects are passed to render" 

  end
end


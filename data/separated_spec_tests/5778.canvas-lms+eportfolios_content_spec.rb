#
# Copyright (C) 2014 - present Instructure, Inc.
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

require File.expand_path(File.dirname(__FILE__) + '/common')
require File.expand_path(File.dirname(__FILE__) + '/helpers/eportfolios_common')

describe "add content box" do
  include_context "in-process server selenium tests"
  include EportfoliosCommon

  before(:each) do
    course_with_student_logged_in
    @assignment = @course.assignments.create(:name => 'new assignment')
    @assignment.submit_homework(@student)
    attachment_model(:context => @student)
    eportfolio_model({:user => @user, :name => "student content"})
    get "/eportfolios/#{@eportfolio.id}?view=preview"
    f("#right-side .edit_content_link").click
    wait_for_ajaximations
  end

  it "should click on the How Do I..? button" 


  it "should preview rich text content" 


  it "should add rich text content" 


  it "should add a user file" 


  context "adding html content" do
    before(:each) do
      @html_content="<b>student</b>"
      f(".add_html_link").click
      wait_for_ajaximations
      f("#edit_page_section_0").send_keys(@html_content)
    end

    def add_html
      submit_form(".form_content")
      #driver.execute_script("$('.form_content .btn-primary').click()")
      wait_for_ajaximations
      expect(f(".section_content b").text).to eq "student"
      entry_verifier ({:section_type => "html", :content => @html_content})
    end

    def put_comment_in_html
      allow_comments = "#eportfolio_entry_allow_comments"
      f(allow_comments).click
      expect(is_checked(allow_comments)).to be_truthy
      comment_public="#eportfolio_entry_show_comments"
      f(comment_public).click
      expect(is_checked(comment_public)).to be_truthy
      submit_form(".form_content")
      wait_for_ajaximations
      expect(f(".section_content b").text).to eq "student"
      entry_verifier ({:section_type => "html", :content => @html_content})
      refresh_page
      f("#page_comment_message").send_keys("hi student")
      submit_form("#add_page_comment_form")
      wait_for_ajax_requests
      expect(f("#page_comments .message")).to include_text("hi student")
      expect(@eportfolio_entry.page_comments[0].message).to eq "hi student"
    end

    it "should verify that the html is there" 


    it "should put comment in html" 


    it "should delete the html content" 


    it "should delete html comment" 

  end
end


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

require File.expand_path(File.dirname(__FILE__) + '/../common')

describe "new account course search" do
  include_context "in-process server selenium tests"

  before :once do
    account_model
    @account.enable_feature!(:course_user_search)
    account_admin_user(:account => @account, :active_all => true)
  end

  before do
    user_session(@user)
  end

  def get_rows
    ff('[data-automation="courses list"] tr')
  end

  def wait_for_loading_to_disappear
    expect(f('[data-automation="courses list"]')).not_to contain_css('tr:nth-child(2)') #wait for ajax
  end


  it "should not show the courses tab without permission" 


  it "should hide courses without enrollments if checked", test_id: 3454769, priority: 1 do
    empty_course = course_factory(:account => @account, :course_name => "no enrollments")
    not_empty_course = course_factory(:account => @account, :course_name => "yess enrollments", :active_all => true)
    student_in_course(:course => not_empty_course, :active_all => true)

    get "/accounts/#{@account.id}"

    rows = get_rows
    expect(rows.count).to eq 2
    expect(rows[0]).to include_text(empty_course.name)
    expect(rows[1]).to include_text(not_empty_course.name)

    fj('label:contains("Hide courses without students")').click
    wait_for_loading_to_disappear

    rows = get_rows
    expect(rows.count).to eq 1
    expect(rows[0]).to include_text(not_empty_course.name)
    expect(rows[0]).not_to include_text(empty_course.name)
  end

  it "should paginate", test_id: 3454771, priority: 1 do
    16.times { |i| @account.courses.create!(:name => "course #{i + 1}") }

    get "/accounts/#{@account.id}"

    expect(get_rows.count).to eq 15
    expect(get_rows.first).to include_text("course 1")
    expect(f('[data-automation="courses list"]')).not_to include_text("course 16")
    expect(f("#content")).not_to contain_css('button[title="Previous Page"]')

    f('button[title="Next Page"]').click
    wait_for_ajaximations

    expect(get_rows.count).to eq 1
    expect(get_rows.first).to include_text("course 16")
    expect(f("#content")).to contain_css('button[title="Previous Page"]')
    expect(f("#content")).not_to contain_css('button[title="Next Page"]')
  end

  it "should search by term", test_id: 3454772, priority: 1 do
    term = @account.enrollment_terms.create!(:name => "some term")
    term_course = course_factory(:account => @account, :course_name => "term course_factory")
    term_course.enrollment_term = term
    term_course.save!

    other_course = course_factory(:account => @account, :course_name => "other course_factory")

    get "/accounts/#{@account.id}"

    click_option('select:has([label="Show courses from"])', term.name)
    wait_for_loading_to_disappear

    rows = get_rows
    expect(rows.count).to eq 1
    expect(rows.first).to include_text(term_course.name)
  end

  it "should search by name" 


  it "should bring up course page when clicking name", priority: "1", test_id: 3415212 do
    named_course = course_factory(:account => @account, :course_name => "named_course")
    named_course.default_view = 'feed'
    named_course.save
    get "/accounts/#{@account.id}"

    fj("[data-automation='courses list'] tr a:contains(#{named_course.name})").click
    wait_for_ajax_requests
    expect(f("#content h2")).to include_text named_course.name
  end

  it "should search but not find bogus course", priority: "1", test_id: 3415214 do
    bogus = 'jtsdumbthing'
    get "/accounts/#{@account.id}"

    f('input[placeholder="Search courses..."]').send_keys(bogus)

    expect(f("#content")).not_to contain_css("[data-automation='courses list'] tr")
  end

  it "should show teachers" 


  it "should show manageable roles in new enrollment dialog" 


  it "should load sections in new enrollment dialog" 


  it "should create a new course from the 'Add a New Course' dialog", test_id: 3454775, priority: 1 do
    @account.enrollment_terms.create!(:name => "Test Enrollment Term")
    subaccount = @account.sub_accounts.create!(name: "Test Sub Account")

    get "/accounts/#{@account.id}"

    # fill out the form
    fj('button:has([name="IconPlusLine"]):contains("Course")').click
    dialog = f('[aria-label="Add a New Course"]')
    expect(dialog).to be_displayed
    set_value(fj('label:contains("Course Name") input', dialog), 'Test Course Name')
    set_value(fj('label:contains("Reference Code") input', dialog), 'TCN 101')
    click_option('[aria-label="Add a New Course"] label:contains("Subaccount") select', subaccount.to_param, :value)
    click_option('[aria-label="Add a New Course"] label:contains("Enrollment Term") select', "Test Enrollment Term")
    submit_form(dialog)

    # make sure it got saved to db correctly
    new_course = Course.last
    expect(new_course.name).to eq('Test Course Name')
    expect(new_course.course_code).to eq('TCN 101')
    expect(new_course.account.name).to eq('Test Sub Account')
    expect(new_course.enrollment_term.name).to eq('Test Enrollment Term')

    # make sure it shows up on the page
    expect(get_rows.first).to include_text('Test Course Name')
  end

  it "should list course name at top of add user modal", priority: "1", test_id: 3391719 do
    named_course = course_factory(:account => @account, :course_name => "course factory with name")

    get "/accounts/#{@account.id}"
    el = get_rows.first.find('[name="IconPlusLine"]')
    move_to_click_element(el)
    expect(f('#add_people_modal h2')).to include_text(named_course.name)
  end
end


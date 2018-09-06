# frozen_string_literal: true

require 'rails_helper'

def set_up_suite
  page.current_window.resize_to(1920, 1080)
  stub_oauth_edit
end

def fill_out_course_creator_form
  fill_in 'Course title:', with: 'My course'
  fill_in 'Course term:', with: 'Spring 2016'
  fill_in 'Course school:', with: 'University of Oklahoma'
  find('#course_expected_students').set('20')
  find('#course_description').set('My course at OU')
  find('.course_start-datetime-control input').set('2015-01-04')
  find('.course_end-datetime-control input').set('2015-02-01')
  find('div.wizard__panel').click # click to escape the calendar popup
  click_button 'Create my Course!'
end

def interact_with_clone_form
  fill_in 'Course term:', with: 'Spring 2016'
  fill_in 'Course description:', with: 'A new course'

  find('.course_start-datetime-control input').set(course.start)
  find('.course_end-datetime-control input').set(course.end)

  within('.wizard__form') { click_button 'Save New Course' }

  within('.sidebar') { expect(page).to have_content(term) }
  within('.primary') { expect(page).to have_content(desc) }

  click_button 'Save This Course'
end

def go_through_course_dates_and_timeline_dates
  find('attr[title="Wednesday"]', match: :first).click
  within('.wizard__panel.active') do
    expect(page).to have_css('button.dark[disabled=""]')
  end
  find('.wizard__form.course-dates input[type=checkbox]', match: :first).set(true)
  within('.wizard__panel.active') do
    expect(page).not_to have_css('button.dark[disabled=disabled]')
  end

  click_button 'Next'
  sleep 1
end

def go_through_researchwrite_wizard
  go_through_course_dates_and_timeline_dates

  # Choose researchwrite option
  find('.wizard__option', match: :first).find('button', match: :first).click
  click_button 'Next'
  sleep 1

  # Click through the offered choices
  find('.wizard__option', match: :first).find('button', match: :first).click # Training not graded
  click_button 'Next'
  sleep 1

  click_button 'Next' # Default getting started options
  sleep 1

  # Working in groups
  find('.wizard__option', match: :first).find('button', match: :first).click
  click_button 'Next'
  sleep 1

  # Instructor prepares list
  find('.wizard__option', match: :first).find('button', match: :first).click
  click_button 'Next'
  sleep 1

  find('.wizard__option', match: :first).find('button', match: :first).click # Yes, medical articles
  click_button 'Next'
  sleep 1

  find('.wizard__option', match: :first).find('button', match: :first).click # Biographies handout
  click_button 'Next'
  sleep 1

  click_button 'Next' # Default 2 peer reviews
  sleep 1

  click_button 'Next' # Default 3 discussions
  sleep 1

  click_button 'Next' # No supplementary assignments
  sleep 1

  click_button 'Next' # No DYK/GA
  sleep 1

  click_button 'Generate Timeline'
  sleep 1
end

describe 'New course creation and editing', type: :feature do
  before do
    set_up_suite
  end

  before :each do
    user = create(:user,
                  id: 1,
                  permissions: User::Permissions::INSTRUCTOR)
    create(:training_modules_users, user_id: user.id,
                                    training_module_id: 3,
                                    completed_at: Time.now)
    login_as(user, scope: :user)

    visit root_path
  end

  describe 'course workflow', js: true do
    let(:expected_course_blocks) { 23 }
    let(:module_name) { 'Get started on Wikipedia' }

    it 'should allow the user to create a course' 


    it 'should not allow a second course with the same slug' 


    it 'should create a full-length research-write assignment' 


    it 'should squeeze assignments into the course dates' 

  end

  describe 'returning instructor creating a new course', js: true do
    before do
      create(:course, id: 1)
      create(:courses_user,
             course_id: 1,
             user_id: 1,
             role: CoursesUsers::Roles::INSTRUCTOR_ROLE)
      create(:campaigns_course, course_id: 1, campaign_id: Campaign.first.id)
    end

    it 'should have the option of starting with no timeline' 

  end

  after do
    logout
  end
end

describe 'timeline editing', js: true do
  let(:course) do
    create(:course, id: 10001, start: Date.new(2015, 1, 1),
                    end: Date.new(2015, 2, 1), submitted: true,
                    timeline_start: Date.new(2015, 1, 1), timeline_end: Date.new(2015, 2, 1),
                    weekdays: '0111110')
  end
  let(:user) { create(:user, permissions: User::Permissions::ADMIN) }
  let!(:c_user) { create(:courses_user, course_id: course.id, user_id: user.id) }

  let(:week) { create(:week, course_id: course.id, order: 0) }
  let(:week2) { create(:week, course_id: course.id, order: 1) }

  before do
    set_up_suite
    login_as user, scope: :user, run_callbacks: false

    create(:block, week_id: week.id, kind: Block::KINDS['assignment'], order: 0, title: 'Block 1')
    create(:block, week_id: week.id, kind: Block::KINDS['in_class'], order: 1, title: 'Block 2')
    create(:block, week_id: week.id, kind: Block::KINDS['in_class'], order: 2, title: 'Block 3')
    create(:block, week_id: week2.id, kind: Block::KINDS['in_class'], order: 0, title: 'Block 4')
    create(:block, week_id: week2.id, kind: Block::KINDS['in_class'], order: 1, title: 'Block 5')
    create(:block, week_id: week2.id, kind: Block::KINDS['in_class'], order: 3, title: 'Block 6')
  end

  it 'disables reorder up/down buttons when it is the first or last block' 


  it 'allows swapping places with a block' 


  it 'allows dragging and dropping blocks' 


  it 'allows moving blocks between weeks' 


  it 'allows user to save and discard changes' 

end


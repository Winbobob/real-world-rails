# frozen_string_literal: true

require 'rails_helper'

describe 'multiwiki assignments', type: :feature, js: true do
  let(:admin) { create(:admin) }
  let(:course) { create(:course, submitted: true) }
  let(:user) { create(:user) }

  before do
    page.current_window.resize_to(1920, 1080)

    allow(Features).to receive(:disable_wiki_output?).and_return(true)
    login_as(admin)
    course.campaigns << Campaign.last
    create(:courses_user, course_id: course.id, user_id: user.id,
                          role: CoursesUsers::Roles::STUDENT_ROLE)
  end

  it 'creates a valid assignment from a wiki URL' 


  it 'creates a valid assignment from an article and an alternative project and language' 


  it 'will create a valid assignment for multilingual wikisource projects' 


  it 'will create a valid assignment for multilingual wikimedia incubator projects' 

end


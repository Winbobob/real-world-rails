# frozen_string_literal: true

require 'rails_helper'

describe 'Tracked categories and template', js: true do
  let(:course) { create(:course, type: 'ArticleScopedProgram') }
  let(:user) { create(:user) }
  before do
    JoinCourse.new(course: course, user: user, role: CoursesUsers::Roles::INSTRUCTOR_ROLE)
    login_as user
    stub_oauth_edit
  end

  it 'show up for ArticleScopedPrograms' 


  it 'lets a facilitator add and remove a category' 


  it 'lets a facilitator add a template' 

end


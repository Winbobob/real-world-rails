# frozen_string_literal: true

require 'rails_helper'
require "#{Rails.root}/lib/student_greeting_checker"

describe StudentGreetingChecker do
  describe '.check_all_ungreeted_students' do
    subject { described_class.check_all_ungreeted_students }

    before do
      create(:course, id: 1, start: 2.weeks.ago, end: Date.today + 2.weeks)
      create(:user, id: 1, username: 'Danny', greeter: true)
      create(:courses_user,
             id: 1,
             course_id: 1,
             user_id: 1,
             role: CoursesUsers::Roles::WIKI_ED_STAFF_ROLE)
      create(:user, id: 2, username: 'Ragesoss')
      create(:courses_user,
             id: 2,
             course_id: 1,
             user_id: 2,
             role: CoursesUsers::Roles::STUDENT_ROLE)
    end

    it 'does nothing for students with blank talk pages' 


    it 'skips students who are already greeted' 


    it 'updates students whose talk pages have been edited by greeters' 

  end
end


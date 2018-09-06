#
# Copyright (C) 2016 - present Instructure, Inc.
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

require_relative '../../spec_helper'
require_relative '../views_helper'

describe '/shared/_grading_standard' do

  let(:grading_standard) do
    @course.grading_standards.create!(:title => 'My Grading Standard', :standard_data => {
      :a => {:name => 'A', :value => '95'},
      :b => {:name => 'B', :value => '80'},
      :c => {:name => 'C', :value => '70'},
      :d => {:name => 'D', :value => '60'},
      :f => {:name => 'F', :value => ''}})
  end

  let(:doc) do
    Nokogiri::HTML(response.body)
  end

  before do
    account = Account.default
    @course = Course.create!(name: 'My Course', account: account)
    user = User.create!(name: 'Abby Tabby')
    @course.enroll_user(user, 'TeacherEnrollment')
    user.save!

    view_context(@course, user)
  end

  it 'renders' 


  it 'does not show find, edit, or remove links when read only' 


  it 'shows find, edit, and remove links when not read only' 


  it 'does not show the manage grading schemes link if read only' 


  it 'shows the manage grading schemes link if not read only' 


  it 'displays the proper title for the default grading standard' 


  it 'displays the proper title for a custom grading standard' 


  it 'renders the proper amount of rows for the default grading standard' 


  it 'renders the proper amount of rows for a custom grading standard' 

end



#-- encoding: UTF-8
#-- copyright
# OpenProject is a project management system.
# Copyright (C) 2012-2017 the OpenProject Foundation (OPF)
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License version 3.
#
# OpenProject is a fork of ChiliProject, which is a fork of Redmine. The copyright follows:
# Copyright (C) 2006-2017 Jean-Philippe Lang
# Copyright (C) 2010-2013 the ChiliProject Team
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
#
# See doc/COPYRIGHT.rdoc for more details.
#++
require 'legacy_spec_helper'

describe 'UserCustomField' do
  before do
    @project = FactoryGirl.create :valid_project
    role   = FactoryGirl.create :role, permissions: [:view_work_packages, :edit_work_packages]
    @users = FactoryGirl.create_list(:user, 5)
    @users.each do |user| @project.add_member!(user, role) end
    @issue = FactoryGirl.create :work_package,
                                project: @project,
                                author: @users.first,
                                type: @project.types.first
    @field = WorkPackageCustomField.create!(name: 'Tester', field_format: 'user')
  end

  it 'should possible_values_with_no_arguments' 


  it 'should possible_values_with_project_resource' 


  it 'should possible_values_with_nil_project_resource' 


  it 'should possible_values_options_with_no_arguments' 


  it 'should possible_values_options_with_project_resource' 


  it 'should cast_blank_value' 


  it 'should cast_valid_value' 


  it 'should cast_invalid_value' 

end


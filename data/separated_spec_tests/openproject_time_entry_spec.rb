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

describe TimeEntry, type: :model do
  fixtures :all

  it 'should hours format' 


  it 'should hours should default to nil' 


  it 'should spent on with blank' 


  it 'should spent on with nil' 


  it 'should spent on with string' 


  it 'should spent on with invalid string' 


  it 'should spent on with date' 


  it 'should spent on with time' 


  context '#earliest_date_for_project' do
    before do
      User.current = nil
      @public_project = FactoryGirl.create(:project, is_public: true)
      @issue = FactoryGirl.create(:work_package, project: @public_project)
      FactoryGirl.create(:time_entry, spent_on: '2010-01-01',
                          work_package: @issue,
                          project: @public_project)
    end

    context 'without a project' do
      it 'should return the lowest spent_on value that is visible to the current user' 

    end

    context 'with a project' do
      it "should return the lowest spent_on value that is visible to the current user for that project and it's subprojects only" 

    end
  end

  context '#latest_date_for_project' do
    before do
      User.current = nil
      @public_project = FactoryGirl.create(:project, is_public: true)
      @issue = FactoryGirl.create(:work_package, project: @public_project)
      FactoryGirl.create(:time_entry, spent_on: '2010-01-01',
                          work_package: @issue,
                          project: @public_project)
    end

    context 'without a project' do
      it 'should return the highest spent_on value that is visible to the current user' 

    end

    context 'with a project' do
      it "should return the highest spent_on value that is visible to the current user for that project and it's subprojects only" 

    end
  end
end


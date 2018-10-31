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
require_relative '../legacy_spec_helper'

describe Version, type: :model do
  fixtures :all

  it 'should create' 


  it 'should invalid effective date validation' 


  context '#start_date' do
    context 'with no value saved' do
      it 'should be the date of the earlist issue' 

    end

    context 'with a value saved' do
      it 'should be the value' 

    end
  end

  it 'should progress should be 0 with no assigned issues' 


  it 'should progress should be 0 with unbegun assigned issues' 


  it 'should progress should be 100 with closed assigned issues' 


  it 'should progress should consider done ratio of open assigned issues' 


  it 'should progress should consider closed issues as completed' 


  it 'should progress should consider estimated hours to weigth issues' 


  it 'should progress should consider average estimated hours to weigth unestimated issues' 


  context '#behind_schedule?' do
    before do
      ProjectCustomField.destroy_all # Custom values are a mess to isolate in tests
      @project = FactoryGirl.create(:project, identifier: 'test0')
      @project.types << FactoryGirl.create(:type)

      (@version = Version.new.tap do |v|
        v.attributes = { project: @project, effective_date: nil, name: 'test' }
      end).save!
    end

    it 'should be false if there are no issues assigned' 


    it 'should be false if there is no effective_date' 


    it 'should be false if all of the issues are ahead of schedule' 


    it 'should be true if any of the issues are behind schedule' 


    it 'should be false if all of the issues are complete' 

  end

  context '#estimated_hours' do
    before do
      (@version = Version.new.tap do |v|
        v.attributes = { project_id: 1, name: '#estimated_hours' }
      end).save!
    end

    it 'should return 0 with no assigned issues' 


    it 'should return 0 with no estimated hours' 


    it 'should return the sum of estimated hours' 


    it 'should return the sum of leaves estimated hours' 

  end

  it "should update all issue's fixed_version associations in case the hierarchy changed XXX" 


  private

  def add_work_package(version, attributes = {})
    (v = WorkPackage.new.tap do |v|
      v.attributes = { project: version.project,
                             fixed_version: version,
                             subject: 'Test',
                             author: User.first,
                             type: version.project.types.first }.merge(attributes)
    end).save!

    v
  end

  def assert_progress_equal(expected_float, actual_float, _message = '')
    assert_in_delta(expected_float, actual_float, 0.000001, message = '')
  end
end


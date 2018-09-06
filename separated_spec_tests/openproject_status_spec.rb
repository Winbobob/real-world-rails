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

describe Status, type: :model do
  fixtures :all

  it 'should create' 


  it 'should destroy' 


  it 'should destroy status in use' 


  it 'should default' 


  it 'should change default' 


  it 'should reorder should not clear default status' 


  context '#update_done_ratios' do
    before do
      @issue = WorkPackage.find(1)
      @status = Status.find(1)
      @status.update_attribute(:default_done_ratio, 50)
    end

    context 'with Setting.work_package_done_ratio using the field' do
      before do
        Setting.work_package_done_ratio = 'field'
      end

      it 'should change nothing' 

    end

    context 'with Setting.work_package_done_ratio using the status' do
      before do
        Setting.work_package_done_ratio = 'status'
      end

      it "should update all of the issue's done_ratios to match their Issue Status" 

    end
  end
end


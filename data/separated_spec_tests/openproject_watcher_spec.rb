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

describe Watcher do
  before do
    @user  = FactoryGirl.create :user
    @issue = FactoryGirl.create :work_package
    @role  = FactoryGirl.create :role, permissions: [:view_work_packages]
    @issue.project.add_member! @user, @role
  end

  it 'should add_watcher' 


  it 'should add_watcher_will_not_add_same_user_twice' 


  it 'should watched_by' 


  it 'watcher_users contains correct_classes' 



  it 'should watcher_users_should_not_validate_user' 


  it 'should watcher_user_ids' 


  it 'should watcher_user_ids' 


  it 'should watcher_user_ids_should_make_ids_uniq' 


  it 'should recipients' 


  it 'should unwatch' 


  it 'should prune_removes_watchers_that_dont_have_permission' 

end


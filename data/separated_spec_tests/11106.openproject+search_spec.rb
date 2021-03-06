#-- encoding: UTF-8
#-- copyright
# OpenProject is a project management system.
# Copyright (C) 2012-2018 the OpenProject Foundation (OPF)
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
# See docs/COPYRIGHT.rdoc for more details.
#++
require 'legacy_spec_helper'

describe 'Search' do # FIXME: naming (RSpec-port)
  fixtures :all

  before do
    @project = Project.find(1)
    @issue_keyword = '%unable to print recipes%'
    @issue = WorkPackage.find(1)
    @changeset_keyword = '%very first commit%'
    @changeset = Changeset.find(100)
  end

  it 'should search_by_anonymous' 


  it 'should search_by_user' 


  it 'should search_by_allowed_member' 


  it 'should search_by_unallowed_member' 


  it 'should search_issue_with_multiple_hits_in_journals' 


  private

  def remove_permission(role, permission)
    role.permissions = role.permissions - [permission]
    role.save
  end
end


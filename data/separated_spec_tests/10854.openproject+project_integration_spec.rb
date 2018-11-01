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
#++require 'rspec'

require 'spec_helper'
require_relative './eager_loading_mock_wrapper'

describe ::API::V3::WorkPackages::EagerLoading::Project do
  let!(:parent_work_package1) { FactoryBot.create(:work_package, project: parent_project) }
  let!(:work_package1) { FactoryBot.create(:work_package, project: project, parent: parent_work_package1) }
  let!(:work_package2) { FactoryBot.create(:work_package, project: project, parent: parent_work_package1) }
  let!(:child_work_package1) { FactoryBot.create(:work_package, project: child_project, parent: work_package1) }
  let!(:child_work_package2) { FactoryBot.create(:work_package, project: child_project, parent: work_package2) }
  let!(:project) { FactoryBot.create(:project) }
  let!(:parent_project) { FactoryBot.create(:project) }
  let!(:child_project) { FactoryBot.create(:project) }

  describe '.apply' do
    it 'preloads the projects of the work packages, their parents and children' 

  end
end

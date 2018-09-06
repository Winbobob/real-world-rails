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

require 'spec_helper'

describe Timeline, 'filtering custom fields', type: :feature, js: true do
  let(:role) { FactoryGirl.create(:role, permissions: permissions) }
  let(:permissions) do
    [:view_work_packages,
     :view_timelines,
     :edit_timelines,
     :edit_work_packages]
  end
  let(:project) { FactoryGirl.create(:project) }
  let(:user) { FactoryGirl.create(:user, member_in_project: project, member_through_role: role) }
  let(:type) { project.types.first }
  let(:bool_cf) {
    field = FactoryGirl.create(:bool_wp_custom_field, is_filter: true, is_for_all: true)

    type.custom_fields << field

    field
  }
  let(:bool_cf_local) {
    field = FactoryGirl.create(:bool_wp_custom_field, is_filter: true, is_for_all: false)

    type.custom_fields << field
    project.work_package_custom_fields << field

    field
  }
  let(:list_cf) {
    field = FactoryGirl.create(:list_wp_custom_field,
                               is_filter: true,
                               is_for_all: true,
                               possible_values: ['A', 'B', 'C'])

    type.custom_fields << field

    field
  }
  let(:list_cf_local) {
    field = FactoryGirl.create(:list_wp_custom_field,
                               is_filter: true,
                               is_for_all: false,
                               possible_values: ['A', 'B', 'C'])

    type.custom_fields << field
    project.work_package_custom_fields << field

    field
  }
  let(:wp1) do
    FactoryGirl.create(:work_package, project: project, type: type)
  end
  let(:wp2) do
    FactoryGirl.create(:work_package, project: project, type: type)
  end
  let(:wp3) do
    FactoryGirl.create(:work_package, project: project, type: type)
  end
  let(:wp4) do
    FactoryGirl.create(:work_package, project: project, type: type)
  end

  let(:timeline) do
    FactoryGirl.create(:timeline, project: project)
  end

  before do
    login_as(user)
  end

  include_context 'ui-select helpers'

  shared_examples_for 'filtering by bool custom field' do
    it 'filters accordingly' 

  end

  context 'with a global bool custom field' do
    let(:cf) { bool_cf }
    it_behaves_like 'filtering by bool custom field'
  end

  context 'with a project bool custom field' do
    let(:cf) { bool_cf_local }
    it_behaves_like 'filtering by bool custom field'
  end

  shared_examples_for 'filtering by list custom field' do
    it 'filters accordingly' 

  end

  context 'with a global list custom field' do
    let(:cf) { list_cf }
    it_behaves_like 'filtering by list custom field'
  end

  context 'with a project list custom field' do
    let(:cf) { list_cf_local }
    it_behaves_like 'filtering by list custom field'
  end
end


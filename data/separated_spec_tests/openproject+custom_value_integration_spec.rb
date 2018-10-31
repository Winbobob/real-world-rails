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

describe ::API::V3::WorkPackages::EagerLoading::CustomValue do
  let!(:work_package) { FactoryBot.create(:work_package) }
  let!(:type) { work_package.type }
  let!(:other_type) { FactoryBot.create(:type) }
  let!(:project) { work_package.project }
  let!(:other_project) { FactoryBot.create(:project) }
  let!(:user) { FactoryBot.create(:user) }
  let!(:version) { FactoryBot.create(:version, project: project) }

  describe 'multiple CFs' do
    let!(:type_project_list_cf) do
      FactoryBot.create(:list_wp_custom_field).tap do |cf|
        type.custom_fields << cf
        project.work_package_custom_fields << cf
      end
    end
    let!(:type_project_user_cf) do
      FactoryBot.create(:user_wp_custom_field).tap do |cf|
        type.custom_fields << cf
        project.work_package_custom_fields << cf
      end
    end
    let!(:type_project_version_cf) do
      FactoryBot.create(:version_wp_custom_field, name: 'blubs').tap do |cf|
        type.custom_fields << cf
        project.work_package_custom_fields << cf
      end
    end
    let!(:for_all_type_cf) do
      FactoryBot.create(:list_wp_custom_field, is_for_all: true).tap do |cf|
        type.custom_fields << cf
      end
    end
    let!(:for_all_other_type_cf) do
      FactoryBot.create(:list_wp_custom_field, is_for_all: true).tap do |cf|
        other_type.custom_fields << cf
      end
    end
    let!(:type_other_project_cf) do
      FactoryBot.create(:list_wp_custom_field).tap do |cf|
        type.custom_fields << cf
        other_project.work_package_custom_fields << cf
      end
    end
    let!(:other_type_project_cf) do
      FactoryBot.create(:list_wp_custom_field).tap do |cf|
        other_type.custom_fields << cf
        project.work_package_custom_fields << cf
      end
    end

    describe '.apply' do
      it 'preloads the custom fields and values' 

    end
  end

  describe '#usages returning an is_for_all custom field within one project (Regression #28435)' do
    let!(:for_all_type_cf) do
      FactoryBot.create(:list_wp_custom_field, is_for_all: true).tap do |cf|
        type.custom_fields << cf
      end
    end
    let(:other_project) { FactoryBot.create :project }
    subject { described_class.new [work_package] }

    before do
      # Assume that one custom field has an entry in project_custom_fields
      for_all_type_cf.projects << other_project
    end

    it 'still allows looking up the global custom field in a different project' 

  end


  describe '#usages returning an is_for_all custom field within multiple projects (Regression #28452)' do
    let!(:for_all_type_cf) do
      FactoryBot.create(:list_wp_custom_field, is_for_all: true).tap do |cf|
        type.custom_fields << cf
      end
    end
    let(:other_project) { FactoryBot.create :project }
    let(:other_project2) { FactoryBot.create :project }
    subject { described_class.new [work_package] }

    before do
      # Assume that one custom field has an entry in project_custom_fields
      for_all_type_cf.projects << other_project
      for_all_type_cf.projects << other_project2
    end

    it 'does not double add the custom field to the available CFs' 

  end
end


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

describe ::API::V3::Queries::Schemas::FilterDependencyRepresenterFactory do
  include ::API::V3::Utilities::PathHelper

  let(:operator) { Queries::Operators::Equals }
  let(:form_embedded) { true }

  describe '.create' do
    subject { described_class.create(filter, operator, form_embedded: form_embedded) }

    context 'assigned to filter' do
      let(:filter) { Queries::WorkPackages::Filter::AssignedToFilter.new }

      it 'is a assigned_to dependency' 

    end

    context 'author filter' do
      let(:filter) { Queries::WorkPackages::Filter::AuthorFilter.new }

      it 'is the user dependency' 

    end

    context 'category filter' do
      let(:filter) { Queries::WorkPackages::Filter::CategoryFilter.new }

      it 'is the category dependency' 

    end

    context 'created_at filter' do
      let(:filter) { Queries::WorkPackages::Filter::CreatedAtFilter.new }

      it 'is the date dependency' 

    end

    context 'custom_field filters' do
      let(:filter) do
        filter = Queries::WorkPackages::Filter::CustomFieldFilter.new
        filter.custom_field = custom_field

        filter
      end

      context 'type int' do
        let(:custom_field) { FactoryGirl.build_stubbed(:int_wp_custom_field) }

        it 'is the integer dependency' 

      end

      context 'type float' do
        let(:custom_field) { FactoryGirl.build_stubbed(:float_wp_custom_field) }

        it 'is the float dependency' 

      end

      context 'type text' do
        let(:custom_field) { FactoryGirl.build_stubbed(:text_wp_custom_field) }

        it 'is the text dependency' 

      end

      context 'type list' do
        let(:custom_field) { FactoryGirl.build_stubbed(:list_wp_custom_field) }

        it 'is the string object dependency' 

      end

      context 'type user' do
        let(:custom_field) { FactoryGirl.build_stubbed(:user_wp_custom_field) }

        it 'is the user dependency' 

      end

      context 'type version' do
        let(:custom_field) { FactoryGirl.build_stubbed(:version_wp_custom_field) }

        it 'is the version dependency' 

      end

      context 'type date' do
        let(:custom_field) { FactoryGirl.build_stubbed(:date_wp_custom_field) }

        it 'is the date dependency' 

      end

      context 'type bool' do
        let(:custom_field) { FactoryGirl.build_stubbed(:bool_wp_custom_field) }

        it 'is the string object dependency' 

      end

      context 'type string' do
        let(:custom_field) { FactoryGirl.build_stubbed(:string_wp_custom_field) }

        it 'is the text dependency' 

      end
    end

    context 'done_ratio filter' do
      let(:filter) { Queries::WorkPackages::Filter::DoneRatioFilter.new }

      it 'is the integer dependency' 

    end

    context 'due_date filter' do
      let(:filter) { Queries::WorkPackages::Filter::DueDateFilter.new }

      it 'is the date dependency' 

    end

    context 'estimated_hours filter' do
      let(:filter) { Queries::WorkPackages::Filter::EstimatedHoursFilter.new }

      it 'is the integer dependency' 

    end

    context 'group filter' do
      let(:filter) { Queries::WorkPackages::Filter::GroupFilter.new }

      it 'is the group dependency' 

    end

    context 'id filter' do
      let(:filter) { Queries::WorkPackages::Filter::IdFilter.new }

      it 'is the id dependency' 

    end

    context 'prioritiy filter' do
      let(:filter) { Queries::WorkPackages::Filter::PriorityFilter.new }

      it 'is the priority dependency' 

    end

    context 'project filter' do
      let(:filter) { Queries::WorkPackages::Filter::ProjectFilter.new }

      it 'is the project dependency' 

    end

    context 'responsible filter' do
      let(:filter) { Queries::WorkPackages::Filter::ResponsibleFilter.new }

      it 'is the author dependency' 

    end

    context 'role filter' do
      let(:filter) { Queries::WorkPackages::Filter::RoleFilter.new }

      it 'is the role dependency' 

    end

    context 'start_date filter' do
      let(:filter) { Queries::WorkPackages::Filter::StartDateFilter.new }

      it 'is the date dependency' 

    end

    context 'subject filter' do
      let(:filter) { Queries::WorkPackages::Filter::SubjectFilter.new }

      it 'is the subject dependency' 

    end

    context 'status filter' do
      let(:filter) { Queries::WorkPackages::Filter::StatusFilter.new }

      it 'is a status dependency' 

    end

    context 'subproject filter' do
      let(:filter) { Queries::WorkPackages::Filter::SubprojectFilter.new }

      it 'is a subproject dependency' 

    end

    context 'type filter' do
      let(:filter) { Queries::WorkPackages::Filter::TypeFilter.new }

      it 'is a type dependency' 

    end

    context 'updated_at filter' do
      let(:filter) { Queries::WorkPackages::Filter::UpdatedAtFilter.new }

      it 'is a type dependency' 

    end

    context 'version filter' do
      let(:filter) { Queries::WorkPackages::Filter::VersionFilter.new }

      it 'is a version dependency' 

    end

    context 'watcher filter' do
      let(:filter) { Queries::WorkPackages::Filter::WatcherFilter.new }

      it 'is a type dependency' 

    end
  end
end


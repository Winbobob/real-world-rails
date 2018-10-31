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

require 'spec_helper'

describe ::API::V3::Queries::Schemas::FilterDependencyRepresenterFactory do
  include ::API::V3::Utilities::PathHelper

  let(:operator) { Queries::Operators::Equals }
  let(:form_embedded) { true }

  describe '.create' do
    subject { described_class.create(filter, operator, form_embedded: form_embedded) }

    context 'assigned to filter' do
      let(:filter) { Queries::WorkPackages::Filter::AssignedToFilter.create! }

      it 'is a all principals dependency' 

    end

    context 'responsible filter' do
      let(:filter) { Queries::WorkPackages::Filter::ResponsibleFilter.create! }

      it 'is a all principals dependency' 

    end

    context 'author filter' do
      let(:filter) { Queries::WorkPackages::Filter::AuthorFilter.create! }

      it 'is the user dependency' 

    end

    context 'category filter' do
      let(:filter) { Queries::WorkPackages::Filter::CategoryFilter.create! }

      it 'is the category dependency' 

    end

    context 'created_at filter' do
      let(:filter) { Queries::WorkPackages::Filter::CreatedAtFilter.create! }

      it 'is the date dependency' 

    end

    context 'custom_field filters' do
      let(:filter) do
        Queries::WorkPackages::Filter::CustomFieldFilter.from_custom_field! custom_field: custom_field
      end

      shared_examples_for 'includes the cf json_cache_key mixin' do
        it do
          expect(subject.singleton_class.included_modules)
            .to include(::API::V3::Queries::Schemas::CustomFieldJsonCacheKeyMixin)
        end
      end

      context 'type int' do
        let(:custom_field) { FactoryBot.build_stubbed(:int_wp_custom_field) }

        it 'is the integer dependency' 


        it_behaves_like 'includes the cf json_cache_key mixin'
      end

      context 'type float' do
        let(:custom_field) { FactoryBot.build_stubbed(:float_wp_custom_field) }

        it 'is the float dependency' 


        it_behaves_like 'includes the cf json_cache_key mixin'
      end

      context 'type text' do
        let(:custom_field) { FactoryBot.build_stubbed(:text_wp_custom_field) }

        it 'is the text dependency' 


        it_behaves_like 'includes the cf json_cache_key mixin'
      end

      context 'type list' do
        let(:custom_field) { FactoryBot.build_stubbed(:list_wp_custom_field) }

        it 'is the string object dependency' 


        it_behaves_like 'includes the cf json_cache_key mixin'
      end

      context 'type user' do
        let(:custom_field) { FactoryBot.build_stubbed(:user_wp_custom_field) }

        it 'is the user dependency' 


        it_behaves_like 'includes the cf json_cache_key mixin'
      end

      context 'type version' do
        let(:custom_field) { FactoryBot.build_stubbed(:version_wp_custom_field) }

        it 'is the version dependency' 


        it_behaves_like 'includes the cf json_cache_key mixin'
      end

      context 'type date' do
        let(:custom_field) { FactoryBot.build_stubbed(:date_wp_custom_field) }

        it 'is the date dependency' 


        it_behaves_like 'includes the cf json_cache_key mixin'
      end

      context 'type bool' do
        let(:custom_field) { FactoryBot.build_stubbed(:bool_wp_custom_field) }

        it 'is the string object dependency' 


        it_behaves_like 'includes the cf json_cache_key mixin'
      end

      context 'type string' do
        let(:custom_field) { FactoryBot.build_stubbed(:string_wp_custom_field) }

        it 'is the text dependency' 


        it_behaves_like 'includes the cf json_cache_key mixin'
      end
    end

    context 'done_ratio filter' do
      let(:filter) { Queries::WorkPackages::Filter::DoneRatioFilter.create! }

      it 'is the integer dependency' 

    end

    context 'due_date filter' do
      let(:filter) { Queries::WorkPackages::Filter::DueDateFilter.create! }

      it 'is the date dependency' 

    end

    context 'estimated_hours filter' do
      let(:filter) { Queries::WorkPackages::Filter::EstimatedHoursFilter.create! }

      it 'is the integer dependency' 

    end

    context 'group filter' do
      let(:filter) { Queries::WorkPackages::Filter::GroupFilter.create! }

      it 'is the group dependency' 

    end

    context 'id filter' do
      let(:filter) { Queries::WorkPackages::Filter::IdFilter.create! }

      it 'is the id dependency' 

    end

    context 'prioritiy filter' do
      let(:filter) { Queries::WorkPackages::Filter::PriorityFilter.create! }

      it 'is the priority dependency' 

    end

    context 'project filter' do
      let(:filter) { Queries::WorkPackages::Filter::ProjectFilter.create! }

      it 'is the project dependency' 

    end

    context 'role filter' do
      let(:filter) { Queries::WorkPackages::Filter::RoleFilter.create! }

      it 'is the role dependency' 

    end

    context 'start_date filter' do
      let(:filter) { Queries::WorkPackages::Filter::StartDateFilter.create! }

      it 'is the date dependency' 

    end

    context 'subject filter' do
      let(:filter) { Queries::WorkPackages::Filter::SubjectFilter.create! }

      it 'is the subject dependency' 

    end

    context 'status filter' do
      let(:filter) { Queries::WorkPackages::Filter::StatusFilter.create! }

      it 'is a status dependency' 

    end

    context 'subproject filter' do
      let(:filter) { Queries::WorkPackages::Filter::SubprojectFilter.create! }

      it 'is a subproject dependency' 

    end

    context 'type filter' do
      let(:filter) { Queries::WorkPackages::Filter::TypeFilter.create! }

      it 'is a type dependency' 

    end

    context 'updated_at filter' do
      let(:filter) { Queries::WorkPackages::Filter::UpdatedAtFilter.create! }

      it 'is a type dependency' 

    end

    context 'version filter' do
      let(:filter) { Queries::WorkPackages::Filter::VersionFilter.create! }

      it 'is a version dependency' 

    end

    context 'watcher filter' do
      let(:filter) { Queries::WorkPackages::Filter::WatcherFilter.create! }

      it 'is a type dependency' 

    end
  end
end


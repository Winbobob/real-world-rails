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

describe ::API::V3::Queries::QueryRepresenter do
  include ::API::V3::Utilities::PathHelper

  let(:query) { FactoryBot.build_stubbed(:query, project: project) }
  let(:project) { FactoryBot.build_stubbed(:project) }
  let(:user) { double('current_user', allowed_to?: true, admin: true, admin?: true) }
  let(:embed_links) { true }
  let(:representer) do
    described_class.new(query, current_user: user, embed_links: embed_links)
  end

  let(:permissions) { [] }

  let(:policy) do
    policy_stub = double('policy stub')

    allow(QueryPolicy)
      .to receive(:new)
      .with(user)
      .and_return(policy_stub)

    allow(policy_stub)
      .to receive(:allowed?)
      .and_return(false)

    permissions.each do |permission|
      allow(policy_stub)
        .to receive(:allowed?)
        .with(query, permission)
        .and_return(true)
    end
  end

  before do
    policy
  end

  def non_empty_to_query(hash)
    hash.map do |key, value|
      if value.is_a?(Array) && value.empty?
        "#{key}=%5B%5D"
      else
        value.to_query(key)
      end
    end.compact.sort! * '&'
  end

  subject { representer.to_json }

  describe 'generation' do
    describe '_links' do
      it_behaves_like 'has a titled link' do
        let(:link) { 'self' }
        let(:href) { api_v3_paths.query query.id }
        let(:title) { query.name }
      end

      it_behaves_like 'has a titled link' do
        let(:link) { 'user' }
        let(:href) { api_v3_paths.user query.user_id }
        let(:title) { query.user.name }
      end

      it_behaves_like 'has a titled link' do
        let(:link) { 'project' }
        let(:href) { api_v3_paths.project query.project_id }
        let(:title) { query.project.name }
      end

      it_behaves_like 'has an untitled link' do
        let(:link) { 'results' }
        let(:href) do
          params = {
            offset: 1,
            showSums: false,
            showHierarchies: false,
            pageSize: Setting.per_page_options_array.first,
            filters: []
          }
          "#{api_v3_paths.work_packages_by_project(project.id)}?#{non_empty_to_query(params)}"
        end
      end

      it_behaves_like 'has an untitled link' do
        let(:link) { 'schema' }
        let(:href) { api_v3_paths.query_project_schema(project.identifier) }
      end

      context 'has no project' do
        let(:query) { FactoryBot.build_stubbed(:query, project: nil) }

        it_behaves_like 'has an empty link' do
          let(:link) { 'project' }
        end

        it_behaves_like 'has an untitled link' do
          let(:link) { 'schema' }
          let(:href) { api_v3_paths.query_schema }
        end

        it_behaves_like 'has an untitled link' do
          let(:link) { 'results' }
          let(:href) do
            params = {
              offset: 1,
              pageSize: Setting.per_page_options_array.first,
              showSums: false,
              showHierarchies: false,
              filters: []
            }
            "#{api_v3_paths.work_packages}?#{non_empty_to_query(params)}"
          end
        end
      end

      describe 'update action link' do
        it_behaves_like 'has an untitled link' do
          let(:link) { 'update' }
          let(:href) { api_v3_paths.query_form(query.id) }
        end

        context 'without a project' do
          let(:query) { FactoryBot.build_stubbed(:query, project: nil) }

          it_behaves_like 'has an untitled link' do
            let(:link) { 'schema' }
            let(:href) { api_v3_paths.query_schema }
          end
        end

        context 'when unpersisted' do
          let(:query) { FactoryBot.build(:query, project: project) }

          it_behaves_like 'has an untitled link' do
            let(:link) { 'update' }
            let(:href) { api_v3_paths.create_query_form }
          end
        end

        context 'when unpersisted outside a project' do
          let(:query) { FactoryBot.build(:query) }

          it_behaves_like 'has an untitled link' do
            let(:link) { 'update' }
            let(:href) { api_v3_paths.create_query_form }
          end
        end
      end

      describe 'delete action link' do
        let(:permissions) { [:destroy] }

        it_behaves_like 'has an untitled link' do
          let(:link) { 'delete' }
          let(:href) { api_v3_paths.query query.id }
        end

        context 'when not persisted' do
          let(:query) { FactoryBot.build(:query, project: project) }

          it_behaves_like 'has no link' do
            let(:link) { 'delete' }
          end
        end

        context 'when not allowed to delete' do
          let(:permissions) { [] }

          it_behaves_like 'has no link' do
            let(:link) { 'delete' }
          end
        end

        context 'when no user is provided' do
          let(:user) { nil }
          let(:embed_links) { false }

          it_behaves_like 'has no link' do
            let(:link) { 'delete' }
          end
        end
      end

      describe 'updateImmediately action link' do
        let(:permissions) { [:update] }

        it_behaves_like 'has an untitled link' do
          let(:link) { 'updateImmediately' }
          let(:href) { api_v3_paths.query query.id }
        end

        context 'when not persisted and lacking permission' do
          let(:query) { FactoryBot.build(:query, project: project) }

          it_behaves_like 'has no link' do
            let(:link) { 'updateImmediately' }
          end
        end

        context 'when not persisted and having permission' do
          let(:permissions) { [:create] }

          let(:query) { FactoryBot.build(:query, project: project) }

          it_behaves_like 'has an untitled link' do
            let(:link) { 'updateImmediately' }
            let(:href) { api_v3_paths.query query.id }
          end
        end

        context 'when not allowed to update' do
          let(:permissions) { [] }

          it_behaves_like 'has no link' do
            let(:link) { 'updateImmediately' }
          end
        end

        context 'when no user is provided' do
          let(:user) { nil }
          let(:embed_links) { false }

          it_behaves_like 'has no link' do
            let(:link) { 'updateImmediately' }
          end
        end
      end

      context 'with filter, sort, group by and pageSize' do
        let(:representer) do
          described_class.new(query,
                              current_user: user)
        end

        let(:query) do
          query = FactoryBot.build_stubbed(:query, project: project)
          query.add_filter('subject', '~', ['bogus'])
          query.group_by = 'author'
          query.sort_criteria = [['assigned_to', 'asc'], ['type', 'desc']]

          query
        end

        let(:expected_href) do
          params = {
            offset: 1,
            pageSize: Setting.per_page_options_array.first,
            filters: JSON::dump([{ subject: { operator: '~', values: ['bogus'] } }]),
            showSums: false,
            showHierarchies: false,
            groupBy: 'author',
            sortBy: JSON::dump([['assignee', 'asc'], ['type', 'desc']])
          }

          api_v3_paths.work_packages_by_project(project.id) + "?#{params.to_query}"
        end

        it_behaves_like 'has an untitled link' do
          let(:link) { 'results' }
          let(:href) { expected_href }
        end
      end

      context 'with offset and page size' do
        let(:representer) do
          described_class.new(query,
                              current_user: user,
                              params: { offset: 2, pageSize: 25 })
        end

        let(:expected_href) do
          params = {
            offset: 2,
            pageSize: 25,
            showSums: false,
            showHierarchies: false,
            filters: []
          }

          api_v3_paths.work_packages_by_project(project.id) + "?#{non_empty_to_query(params)}"
        end

        it_behaves_like 'has an untitled link' do
          let(:link) { 'results' }
          let(:href) { expected_href }
        end
      end

      context 'without columns' do
        let(:query) do
          query = FactoryBot.build_stubbed(:query, project: project)

          # need to write bogus here because the query
          # will otherwise sport the default columns
          query.column_names = ['blubs']

          query
        end

        it 'has an empty columns array' 

      end

      context 'with columns' do
        let(:query) do
          query = FactoryBot.build_stubbed(:query, project: project)

          query.column_names = ['status', 'assigned_to', 'updated_at']

          query
        end

        it 'has an array of columns' 

      end

      context 'without group_by' do
        it_behaves_like 'has a titled link' do
          let(:href) { nil }
          let(:link) { 'groupBy' }
          let(:title) { nil }
        end
      end

      context 'with group_by' do
        let(:query) do
          query = FactoryBot.build_stubbed(:query, project: project)

          query.group_by = 'status'

          query
        end

        it_behaves_like 'has a titled link' do
          let(:href) { '/api/v3/queries/group_bys/status' }
          let(:link) { 'groupBy' }
          let(:title) { 'Status' }
        end
      end

      context 'without sort_by' do
        it 'has an empty sortBy array' 

      end

      context 'with sort_by' do
        let(:query) do
          FactoryBot.build_stubbed(:query,
                                    sort_criteria: [['subject', 'asc'], ['assigned_to', 'desc']])
        end

        it 'has an array of sortBy' 

      end

      context 'when not starred' do
        let(:permissions) { %i(star unstar) }
        before do
          allow(query)
            .to receive(:starred)
            .and_return(false)
        end

        it_behaves_like 'has an untitled link' do
          let(:link) { 'star' }
          let(:href) { api_v3_paths.query_star query.id }
        end

        it 'has no unstar link' 


        context 'lacking permission' do
          let(:permissions) { [] }

          it 'has no star link' 

        end
      end

      context 'when starred' do
        let(:permissions) { %i(star unstar) }
        before do
          allow(query)
            .to receive(:starred)
            .and_return(true)
        end

        it_behaves_like 'has an untitled link' do
          let(:link) { 'unstar' }
          let(:href) { api_v3_paths.query_unstar query.id }
        end

        it 'has no star link' 


        context 'lacking permission' do
          let(:permissions) { [] }

          it 'has no unstar link' 

        end
      end
    end

    context 'properties' do
      it 'should show an id' 


      it 'should show the query name' 


      it 'should indicate whether sums are shown' 


      it 'should indicate whether timeline is shown' 


      it 'should show the current zoom level' 


      it 'should show the default timelineLabels' 


      it 'should indicate whether the query is publicly visible' 


      describe 'highlighting' do
        context 'with EE', with_ee: %i[conditional_highlighting] do
          it 'renders when the value is set' 


          it 'renders the default' 


          context "inline attribute highlighting" do
            let :status do
              {
                href: '/api/v3/queries/columns/status',
                title: 'Status'
              }
            end

            let :type do
              {
                href: '/api/v3/queries/columns/type',
                title: 'Type'
              }
            end

            let :priority do
              {
                href: '/api/v3/queries/columns/priority',
                title: 'Priority'
              }
            end

            let :due_date do
              {
                href: '/api/v3/queries/columns/dueDate',
                title: 'Finish date'
              }
            end

            let(:query) do
              query = FactoryBot.build_stubbed(:query, project: project)

              query.highlighted_attributes = ['status', 'type', 'priority', 'due_date']

              query
            end

            let(:highlighted_attributes) do
              [status, type, priority, due_date]
            end

            it 'links an array of highlighted attributes' 


            it 'embeds selected inline attributes' 

          end
        end

        context 'without EE' do
          it 'renders when the value is set' 


          it 'renders none when not set' 

        end
      end

      context 'showHierarchies' do
        it 'is true if query.show_hierarchies is true' 


        it 'is false if query.show_hierarchies is false' 

      end

      describe 'with filters' do
        let(:query) do
          query = FactoryBot.build_stubbed(:query)
          query.add_filter('status_id', '=', [filter_status.id.to_s])
          allow(query.filters.last)
            .to receive(:value_objects)
            .and_return([filter_status])
          query.add_filter('assigned_to_id', '!', [filter_user.id.to_s])
          allow(query.filters.last)
            .to receive(:value_objects)
            .and_return([filter_user])
          query
        end

        let(:filter_status) { FactoryBot.build_stubbed(:status) }
        let(:filter_user) { FactoryBot.build_stubbed(:user) }

        it 'should render the filters' 

      end

      describe 'with sort criteria' do
        let(:query) do
          FactoryBot.build_stubbed(:query,
                                    sort_criteria: [['subject', 'asc'], ['assigned_to', 'desc']])
        end

        it 'has the sort criteria embedded' 

      end

      describe 'with columns' do
        let(:query) do
          query = FactoryBot.build_stubbed(:query, project: project)

          query.column_names = ['status', 'assigned_to', 'updated_at']

          query
        end

        it 'has the columns embedded' 


        context 'when not embedding' do
          let(:representer) do
            described_class.new(query, current_user: user, embed_links: false)
          end

          it 'has no columns embedded' 

        end
      end

      describe 'with group by' do
        let(:query) do
          query = FactoryBot.build_stubbed(:query, project: project)

          query.group_by = 'status'

          query
        end

        it 'has the group by embedded' 


        context 'when not embedding' do
          let(:representer) do
            described_class.new(query, current_user: user, embed_links: false)
          end

          it 'has no group bys embedded' 

        end
      end

      describe 'when timeline is visible' do
        let(:query) do
          FactoryBot.build_stubbed(:query, project: project).tap do |query|
            query.timeline_visible = true
          end
        end
        it do
          is_expected.to be_json_eql('true').at_path('timelineVisible')
        end
      end

      describe 'when labels are overridden' do
        let(:query) do
          FactoryBot.build_stubbed(:query, project: project).tap do |query|
            query.timeline_labels = expected
          end
        end
        let(:expected) do
          { 'left' => 'assignee', 'right' => 'status', 'farRight' => 'type' }
        end

        it do
          is_expected.to be_json_eql(expected.to_json).at_path('timelineLabels')
        end
      end

      describe 'when timeline zoom level is changed' do
        let(:query) do
          FactoryBot.build_stubbed(:query, project: project).tap do |query|
            query.timeline_zoom_level = :weeks
          end
        end
        it do
          is_expected.to be_json_eql('weeks'.to_json).at_path('timelineZoomLevel')
        end
      end
    end

    describe 'embedded results' do
      let(:query) { FactoryBot.build_stubbed(:query) }
      let(:representer) do
        described_class.new(query,
                            current_user: user,
                            results: results_representer)
      end

      context 'results are provided' do
        let(:results_representer) do
          {
            _type: 'BogusResultType'
          }
        end

        it 'should embed the results' 

      end

      context 'no results provided' do
        let(:results_representer) { nil }

        it 'should not embed the results' 

      end
    end
  end
end


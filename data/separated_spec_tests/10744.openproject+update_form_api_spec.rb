#-- encoding: UTF-8

#-- copyright
# OpenProject is a project management system.
# Copyright (C) 2012-2015 the OpenProject Foundation (OPF)
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License version 3.
#
# OpenProject is a fork of ChiliProject, which is a fork of Redmine. The copyright follows:
# Copyright (C) 2006-2013 Jean-Philippe Lang
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

require 'spec_helper'
require 'rack/test'

describe "POST /api/v3/queries/form", type: :request do
  include API::V3::Utilities::PathHelper

  let(:path) { api_v3_paths.query_form(query.id) }
  let(:user) { FactoryBot.create(:admin) }
  let(:role) { FactoryBot.create :existing_role, permissions: permissions }
  let(:permissions) { %i(view_work_packages manage_public_queries) }

  let!(:project) { FactoryBot.create(:project_with_types) }

  let(:query) do
    FactoryBot.create(
      :query,
      name: "Existing Query",
      is_public: false,
      project: project,
      user: user
    )
  end
  let(:additional_setup) {}

  let(:parameters) { {} }
  let(:override_params) { {} }
  let(:form) { JSON.parse last_response.body }

  before do
    project.add_member! user, role

    login_as(user)

    additional_setup

    header 'CONTENT_TYPE', 'application/json'
    post path, parameters.merge(override_params).to_json
  end

  it 'should return 200(OK)' 


  it 'should be of type form' 


  it 'has the available_projects link for creation in the schema' 


  describe 'with empty parameters' do
    it 'has 0 validation errors' 

  end

  describe 'with all minimum parameters' do
    let(:parameters) do
      {
        name: "Some Query"
      }
    end

    it 'has 0 validation errors' 


    it 'has the given name set' 


    describe 'the commit link' do
      it "has the correct URL" 


      it "has the correct method" 

    end

    describe 'columns' do
      let(:relation_columns_allowed) { true }

      let(:additional_setup) do
        custom_field

        non_project_type

        # There does not seem to appear a way to generate a valid token
        # for testing purposes
        allow(EnterpriseToken).to receive(:allows_to?).and_return(false)
        allow(EnterpriseToken)
          .to receive(:allows_to?)
          .with(:work_package_query_relation_columns)
          .and_return(relation_columns_allowed)
      end

      let(:custom_field) do
        cf = FactoryBot.create(:list_wp_custom_field)
        project.work_package_custom_fields << cf
        cf.types << project.types.first

        cf
      end

      let(:non_project_type) do
        FactoryBot.create(:type)
      end

      let(:static_columns_json) do
        %w(id project assignee author
           category createdAt dueDate estimatedTime
           parent percentageDone priority responsible
           spentTime startDate status subject type
           updatedAt version).map do |id|
          {
            '_type': 'QueryColumn::Property',
            'id': id
          }
        end
      end

      let(:custom_field_columns_json) do
        [
          {
            '_type': 'QueryColumn::Property',
            'id': "customField#{custom_field.id}"
          }
        ]
      end

      let(:relation_to_type_columns_json) do
        project.types.map do |type|
          {
            '_type': 'QueryColumn::RelationToType',
            'id': "relationsToType#{type.id}"
          }
        end
      end

      let(:relation_of_type_columns_json) do
        Relation::TYPES.map do |_, value|
          {
            '_type': 'QueryColumn::RelationOfType',
            'id': "relationsOfType#{value[:sym].camelcase}"
          }
        end
      end

      let(:non_project_type_relation_column_json) do
        [
          {
            '_type': 'QueryColumn::RelationToType',
            'id': "relationsToType#{non_project_type.id}"
          }
        ]
      end

      context 'within a project' do
        context 'with relation columns allowed by the enterprise token' do
          it 'has the static, custom field and relation columns' 

        end

        context 'with relation columns disallowed by the enterprise token' do
          it 'has the static and custom field' 

        end
      end

      context 'globally (no project)' do
        let(:additional_setup) do
          custom_field

          non_project_type

          query.update_attribute(:project, nil)

          # There does not seem to appear a way to generate a valid token
          # for testing purposes
          allow(EnterpriseToken).to receive(:allows_to?).and_return(false)
          allow(EnterpriseToken)
            .to receive(:allows_to?)
            .with(:work_package_query_relation_columns)
            .and_return(relation_columns_allowed)
        end

        context 'with relation columns allowed by the enterprise token' do
          it 'has the static, custom field and relation columns' 

        end

        context 'with relation columns disallowed by the enterprise token' do
          it 'has the static, custom field and relation columns' 

        end
      end
    end
  end

  describe 'with all parameters given' do
    let(:status) { FactoryBot.create :status }

    let(:parameters) do
      {
        name: "Some Query",
        public: true,
        sums: true,
        showHierarchies: false,
        filters: [
          {
            name: "Status",
            _links: {
              filter: {
                href: "/api/v3/queries/filters/status"
              },
              operator: {
                "href": "/api/v3/queries/operators/%3D"
              },
              values: [
                {
                  href: "/api/v3/statuses/#{status.id}"
                }
              ]
            }
          }
        ],
        _links: {
          project: {
            href: "/api/v3/projects/#{project.id}"
          },
          columns: [
            {
              href: "/api/v3/queries/columns/id"
            },
            {
              href: "/api/v3/queries/columns/subject"
            }
          ],
          sortBy: [
            {
              href: "/api/v3/queries/sort_bys/id-desc"
            },
            {
              href: "/api/v3/queries/sort_bys/assignee-asc"
            }
          ],
          groupBy: {
            href: "/api/v3/queries/group_bys/assignee"
          }
        }
      }
    end

    it 'has 0 validation errors' 


    it 'has a commit link' 


    it 'has the given name set' 


    it 'has the project set' 


    it 'is set to public' 


    it 'has the filters set' 


    it 'has the columns set' 


    it 'has the groupBy set' 


    it 'has the columns set' 


    context "with the project referred to by its identifier" do
      let(:override_params) do
        links = parameters[:_links]

        links[:project] = {
          href: "/api/v3/projects/#{project.identifier}"
        }

        { _links: links }
      end

      it "still finds the project" 

    end

    context "with an unknown filter" do
      let(:override_params) do
        filter = parameters[:filters][0]

        filter[:_links][:filter][:href] = "/api/v3/queries/filters/statuz"

        { filters: [filter] }
      end

      it "returns a validation error" 


      it "has no commit link" 

    end

    context "with an unknown column" do
      let(:override_params) do
        column = { href: "/api/v3/queries/columns/wurst" }
        links = parameters[:_links]

        links[:columns] = links[:columns] + [column]

        { _links: links }
      end

      it "returns a validation error" 

    end

    context "with an invalid groupBy column" do
      let(:override_params) do
        column = { href: "/api/v3/queries/group_bys/foobar" }
        links = parameters[:_links]

        links[:groupBy] = column

        { _links: links }
      end

      it "returns a validation error" 

    end

    context "with an invalid sort criterion" do
      let(:override_params) do
        sort_criterion = { href: "/api/v3/queries/sort_bys/spentTime-desc" }
        links = parameters[:_links]

        links[:sortBy] = links[:sortBy] + [sort_criterion]

        { _links: links }
      end

      it "returns a validation error" 

    end

    context "with an unauthorized user trying to set the query public" do
      let(:user) { FactoryBot.create(:user) }
      let(:permissions) { [:view_work_packages] }

      it "should reject the request" 

    end
  end
end


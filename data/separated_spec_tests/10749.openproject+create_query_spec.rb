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

describe "POST /api/v3/queries", type: :request do
  let(:user) { FactoryBot.create :admin }
  let(:status) { FactoryBot.create :status }
  let(:project) { FactoryBot.create :project }

  let(:params) do
    {
      name: "Dummy Query",
      showHierarchies: false,
      filters: [
        {
          name: "Status",
          _links: {
            filter: {
              href: "/api/v3/queries/filters/status"
            },
            operator: {
              "href": "/api/v3/queries/operators/="
            },
            schema: {
              "href": "/api/v3/queries/filter_instance_schemas/status"
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
          },
          {
            href: "/api/v3/queries/columns/status"
          },
          {
            href: "/api/v3/queries/columns/assignee"
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

  before do
    login_as user
  end

  describe "creating a query" do
    before do
      header "Content-Type",  "application/json"
      post "/api/v3/queries", params.to_json
    end

    it 'should return 201 (created)' 


    it 'should render the created query' 


    it 'should create the query correctly' 

  end

  context "with invalid parameters" do
    def post!
      header "Content-Type",  "application/json"
      post "/api/v3/queries", params.to_json
    end

    def json
      JSON.parse last_response.body
    end

    it "yields a 422 error given an unknown project" 


    it "yields a 422 error given an unknown operator" 


    it "yields a 422 error given an unknown filter" 

  end
end


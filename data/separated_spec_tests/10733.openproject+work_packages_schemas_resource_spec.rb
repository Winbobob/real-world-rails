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
require 'rack/test'

describe API::V3::WorkPackages::Schema::WorkPackageSchemasAPI, type: :request do
  include Rack::Test::Methods
  include API::V3::Utilities::PathHelper

  let(:project) { FactoryBot.create(:project) }
  let(:type) { FactoryBot.create(:type) }
  let(:role) { FactoryBot.create(:role, permissions: [:view_work_packages]) }
  let(:current_user) do
    FactoryBot.build(:user, member_in_project: project, member_through_role: role)
  end

  describe 'GET /api/v3/work_packages/schemas/filters=...' do
    let(:filter_values) { ["#{project.id}-#{type.id}"] }
    let(:schema_path) do
      filter = [{ 'id' => {
        'operator' => '=',
        'values' => filter_values
      } }]

      "#{api_v3_paths.work_package_schemas}?#{{ filters: filter.to_json }.to_query}"
    end

    before do
      allow(User).to receive(:current).and_return(current_user)
      get schema_path
    end

    context 'authorized' do
      context 'valid' do
        it 'returns HTTP 200' 


        it 'returns a collection of schemas' 


        it 'has the self href set correctly' 

      end

      context 'for a non existing project' do
        let(:filter_values) { ["#{0}-#{type.id}"] }

        it 'returns HTTP 200' 


        it 'returns an empty collection' 

      end

      context 'for a non existing type' do
        let(:filter_values) { ["#{project.id}-#{0}"] }

        it 'returns HTTP 200' 


        it 'returns an empty collection' 

      end

      context 'for a non valid filter' do
        let(:filter_values) { ['bogus'] }

        it 'returns HTTP 400' 


        it 'returns an error' 

      end
    end

    context 'not authorized' do
      let(:role) { FactoryBot.create(:role, permissions: []) }

      it 'returns HTTP 403' 

    end
  end

  describe 'GET /api/v3/work_packages/schemas/:id' do
    let(:schema_path) { api_v3_paths.work_package_schema project.id, type.id }

    context 'logged in' do
      before do
        allow(User).to receive(:current).and_return(current_user)
        get schema_path
      end

      context 'valid schema' do
        it 'should return HTTP 200' 


        it 'should set a weak ETag' 


        it 'caches the response' 

      end

      context 'id is too long' do
        it_behaves_like 'not found' do
          let(:schema_path) { "#{api_v3_paths.work_package_schema project.id, type.id}-1" }
        end
      end

      context 'id is too short' do
        it_behaves_like 'not found' do
          let(:schema_path) { "/api/v3/work_packages/schemas/#{project.id}" }
        end
      end
    end

    context 'not logged in' do
      it 'should act as if the schema does not exist' 

    end
  end

  describe 'GET /api/v3/work_packages/schemas/sums' do
    let(:schema_path) { api_v3_paths.work_package_sums_schema }
    subject { last_response }

    before do
      allow(Setting)
        .to receive(:work_package_list_summable_columns)
        .and_return(['estimated_hours'])
    end

    context 'logged in' do
      before do
        allow(User).to receive(:current).and_return(current_user)
        get schema_path
      end

      context 'valid schema' do
        it 'should return HTTP 200' 


        # Further fields are tested in the representer specs
        it 'should return the schema for estimated_hours' 

      end
    end

    context 'not logged in' do
      it 'should act as if the schema does not exist' 

    end
  end
end


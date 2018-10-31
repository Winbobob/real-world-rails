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

describe ::API::V3::Projects::ProjectRepresenter do
  include ::API::V3::Utilities::PathHelper

  let(:project) { FactoryBot.build_stubbed(:project) }
  let(:representer) { described_class.new(project, current_user: user) }
  let(:user) do
    FactoryBot.build_stubbed(:user)
  end
  let(:permissions) { [:add_work_packages] }

  before do
    allow(user)
      .to receive(:allowed_to?)
      .and_return(false)

    permissions.each do |permission|
      allow(user)
        .to receive(:allowed_to?)
        .with(permission, project)
        .and_return(true)
    end
  end

  context 'generation' do
    subject(:generated) { representer.to_json }

    it { is_expected.to include_json('Project'.to_json).at_path('_type') }

    describe 'project' do
      it { is_expected.to have_json_path('id') }
      it { is_expected.to have_json_path('identifier') }
      it { is_expected.to have_json_path('name') }
      it { is_expected.to have_json_path('description') }

      it_behaves_like 'has UTC ISO 8601 date and time' do
        let(:date) { project.created_on }
        let(:json_path) { 'createdAt' }
      end

      it_behaves_like 'has UTC ISO 8601 date and time' do
        let(:date) { project.updated_on }
        let(:json_path) { 'updatedAt' }
      end
    end

    describe '_links' do
      it { is_expected.to have_json_type(Object).at_path('_links') }
      it 'should link to self' 

      it 'should have a title for link to self' 


      describe 'create work packages' do
        context 'user allowed to create work packages' do
          it 'has the correct path for a create form' 


          it 'has the correct path to create a work package' 

        end

        context 'user not allowed to create work packages' do
          let(:permissions) { [] }

          it { is_expected.to_not have_json_path('_links/createWorkPackage/href') }

          it { is_expected.to_not have_json_path('_links/createWorkPackageImmediate/href') }
        end
      end

      describe 'categories' do
        it 'has the correct link to its categories' 

      end

      describe 'versions' do
        it 'has the correct link to its versions' 

      end

      describe 'types' do
        context 'for a user having the view_work_packages permission' do
          let(:permissions) { [:view_work_packages] }

          it 'links to the types active in the project' 

        end

        context 'for a user having the manage_types permission' do
          let(:permissions) { [:manage_types] }

          it 'links to the types active in the project' 

        end

        context 'for a user not having the necessary permissions' do
          let(:permission) { [] }

          it 'has no types link' 

        end
      end
    end

    describe 'caching' do
      it 'is based on the representer\'s cache_key' 


      describe '#json_cache_key' do
        let!(:former_cache_key) { representer.json_cache_key }

        it 'includes the name of the representer class' 


        it 'changes when the locale changes' 


        it 'changes when the project is updated' 

      end
    end
  end

  describe '.checked_permissions' do
    it 'lists add_work_packages' 

  end
end


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

describe ::API::V3::WorkPackages::WorkPackageCollectionRepresenter do
  include API::V3::Utilities::PathHelper

  let(:self_base_link) { '/api/v3/example' }
  let(:work_packages) { WorkPackage.all }
  let(:user) { FactoryBot.build_stubbed(:user) }

  let(:query) { {} }
  let(:groups) { nil }
  let(:total_sums) { nil }
  let(:project) { nil }

  let(:page_parameter) { nil }
  let(:page_size_parameter) { nil }
  let(:default_page_size) { 30 }
  let(:total) { 5 }
  let(:embed_schemas) { false }

  let(:representer) do
    described_class.new(
      work_packages,
      self_base_link,
      query: query,
      project: project,
      groups: groups,
      total_sums: total_sums,
      page: page_parameter,
      per_page: page_size_parameter,
      current_user: user,
      embed_schemas: embed_schemas
    )
  end

  before do
    allow(user)
      .to receive(:allowed_to?)
      .and_return(true)

    FactoryBot.create_list(:work_package, total)
  end

  context 'generation' do
    subject(:collection) { representer.to_json }
    let(:collection_inner_type) { 'WorkPackage' }

    context '_links' do
      context 'representations' do
        context 'when the user has the export_work_packages permission' do
          let(:query) { { foo: 'bar' } }

          it 'has a collection of export formats' 


          context 'with project scope' do
            let(:project) { FactoryBot.build_stubbed(:project) }

            it 'has a project scoped collection of export formats if inside a project' 

          end
        end

        context 'when the user lacks the export_work_packages permission' do
          before do
            allow(user)
              .to receive(:allowed_to?)
              .with(:export_work_packages, project, global: project.nil?)
              .and_return(false)
          end

          it 'has no export links' 

        end
      end
    end

    it 'does not render groups' 


    it 'does not render sums' 


    it 'has a schemas link' 


    describe 'ancestors' do
      before do
        expect(WorkPackage).to receive(:aggregate_ancestors).and_call_original
      end

      it 'are being eager loaded' 

    end

    context 'when the user has the add_work_package permission in any project' do
      before do
        allow(user)
          .to receive(:allowed_to?)
          .and_return(false)

        allow(user)
          .to receive(:allowed_to?)
          .with(:add_work_packages, nil, global: true)
          .and_return(true)
      end

      it 'has a link to create work_packages' 


      it 'declares to use POST to create work_packages' 


      it 'has a link to create work_packages immediately' 


      it 'declares to use POST to create work_packages immediately' 


      context 'in project context' do
        let(:project) { FactoryBot.build_stubbed :project }

        it 'has no link to create work_packages' 


        it 'has no link to create work_packages immediately' 

      end
    end

    context 'when the user lacks the add_work_package permission' do
      before do
        allow(user)
          .to receive(:allowed_to?)
          .and_return(false)
      end

      it 'has no link to create work_packages' 


      it 'has no link to create work_packages immediately' 

    end

    context 'limited page size' do
      let(:page_size_parameter) { 2 }

      context 'on the first page' do
        it_behaves_like 'offset-paginated APIv3 collection' do
          let(:page) { 1 }
          let(:page_size) { page_size_parameter }
          let(:actual_count) { page_size_parameter }
          let(:collection_type) { 'WorkPackageCollection' }

          it_behaves_like 'links to next page by offset'
        end

        it_behaves_like 'has no link' do
          let(:link) { 'previousByOffset' }
        end
      end

      context 'on the last page' do
        let(:page_parameter) { 3 }

        it_behaves_like 'offset-paginated APIv3 collection' do
          let(:page) { 3 }
          let(:page_size) { page_size_parameter }
          let(:actual_count) { 1 }
          let(:collection_type) { 'WorkPackageCollection' }

          it_behaves_like 'links to previous page by offset'
        end

        it_behaves_like 'has no link' do
          let(:link) { 'nextByOffset' }
        end
      end
    end

    context 'passing a query hash' do
      let(:query) { { a: 'b', b: 'c' } }

      it_behaves_like 'has an untitled link' do
        let(:link) { 'self' }
        let(:href) { '/api/v3/example?a=b&b=c&offset=1&pageSize=30' }
      end
    end

    context 'passing groups' do
      let(:groups) do
        group = { 'custom': 'object' }
        allow(group).to receive(:has_sums?).and_return false
        [group]
      end

      it 'renders the groups object as json' 

    end

    context 'passing groups with sums' do
      let(:groups) do
        group = { 'sums': {} }
        allow(group).to receive(:has_sums?).and_return true
        [group]
      end

      it 'renders the groups object as json' 


      it 'has a link to the sums schema' 

    end

    context 'passing sums' do
      let(:total_sums) { OpenStruct.new(estimated_hours: 1) }

      it 'renders the groups object as json' 


      it 'has a link to the sums schema' 

    end

    context 'passing schemas' do
      let(:embed_schemas) { true }

      it 'embeds a schema collection' 

    end

    context 'with project admin priviliges' do
      # In this spec a user responds to `allowed_to` with true per default.
      let(:project) { FactoryBot.build_stubbed(:project) }

      it 'has a link to set the custom fields for that project' 

    end

    context 'without project admin priviliges' do
      # In this spec a user responds to `allowed_to` with true per default.
      let(:project) { FactoryBot.build_stubbed(:project) }

      before do
        allow(user).to receive(:allowed_to?).with(:edit_project, project).and_return(false)
      end

      it 'has no link to set the custom fields for that project' 

    end

    context 'with project and general admin priviliges' do
      # In this spec a user responds to `allowed_to` with true per default.
      let(:project) { FactoryBot.build_stubbed(:project) }
      let(:user) { FactoryBot.build_stubbed(:admin) }

      before do
        allow(user).to receive(:allowed_to?).with(:edit_project, project).and_return(false)
      end

      it 'has a link to set the custom fields for that project' 

    end

  end
end


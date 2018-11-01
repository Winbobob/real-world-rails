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

describe ::API::V3::Categories::CategoryRepresenter do
  let(:category) { FactoryBot.build_stubbed(:category) }
  let(:user) { FactoryBot.build(:user) }
  let(:representer) { described_class.new(category, current_user: double('current_user')) }

  context 'generation' do
    subject(:generated) { representer.to_json }

    shared_examples_for 'category has core values' do
      it { is_expected.to include_json('Category'.to_json).at_path('_type') }

      it { is_expected.to have_json_type(Object).at_path('_links') }
      it 'should link to self' 

      it 'should display its name as title in self' 

      it 'should link to its project' 

      it 'should display its project title' 


      it { is_expected.to have_json_path('id') }
      it { is_expected.to have_json_path('name') }
    end

    context 'default assignee not set' do
      it_behaves_like 'category has core values'

      it 'should not link to an assignee' 

    end

    context 'default assignee set' do
      let(:category) {
        FactoryBot.build_stubbed(:category, assigned_to: user)
      }
      it_behaves_like 'category has core values'

      it 'should link to its default assignee' 

      it 'should display the name of its default assignee' 

    end

    describe 'caching' do
      it 'is based on the representer\'s cache_key' 


      describe '#json_cache_key' do
        let(:assigned_to) { FactoryBot.build_stubbed(:user) }

        before do
          category.assigned_to = assigned_to
        end
        let!(:former_cache_key) { representer.json_cache_key }

        it 'includes the name of the representer class' 


        it 'changes when the locale changes' 


        it 'changes when the category is updated' 


        it 'changes when the category\'s project is updated' 


        it 'changes when the category\'s assigned_to is updated' 

      end
    end
  end
end


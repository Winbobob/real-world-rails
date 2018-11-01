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

describe ::API::V3::Priorities::PriorityRepresenter do
  let(:priority) { FactoryBot.build_stubbed(:priority) }
  let(:representer) { described_class.new(priority, current_user: double('current_user')) }

  include API::V3::Utilities::PathHelper

  context 'generation' do
    subject { representer.to_json }

    it 'should indicate its type' 


    describe 'links' do
      it { is_expected.to have_json_type(Object).at_path('_links') }
      it 'should link to self' 

      it 'should display its name as title in self' 

    end

    describe 'priority' do
      it 'should have an id' 

      it 'should have a name' 

      it 'should have a position' 

      it 'should have a default flag' 

      it 'should have an active flag' 

    end

    describe 'caching' do
      it 'is based on the representer\'s cache_key' 


      describe '#json_cache_key' do
        let!(:former_cache_key) { representer.json_cache_key }

        it 'includes the name of the representer class' 


        it 'changes when the locale changes' 


        it 'changes when the priority is updated' 

      end
    end
  end
end


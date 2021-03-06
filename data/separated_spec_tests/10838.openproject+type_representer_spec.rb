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

describe ::API::V3::Types::TypeRepresenter do
  let(:type) { FactoryBot.build_stubbed(:type, color: FactoryBot.build_stubbed(:color)) }
  let(:representer) { described_class.new(type, current_user: double('current_user')) }

  include API::V3::Utilities::PathHelper

  context 'generation' do
    subject { representer.to_json }

    describe 'links' do
      it_behaves_like 'has a titled link' do
        let(:link) { 'self' }
        let(:href) { api_v3_paths.type(type.id) }
        let(:title) { type.name }
      end
    end

    it 'indicates its id' 


    it 'indicates its name' 


    it 'indicates its color' 


    context 'no color set' do
      let(:type) { FactoryBot.build_stubbed(:type, color: nil) }

      it 'indicates a missing color' 

    end

    it 'indicates its position' 


    it 'indicates that it is not the default type' 


    context 'as default type' do
      let(:type) { FactoryBot.build_stubbed(:type, is_default: true) }

      it 'indicates that it is the default type' 

    end

    it 'indicates that it is not a milestone' 


    context 'as milestone' do
      let(:type) { FactoryBot.build_stubbed(:type, is_milestone: true) }

      it 'indicates that it is a milestone' 

    end

    it_behaves_like 'has UTC ISO 8601 date and time' do
      let(:date) { type.created_at }
      let(:json_path) { 'createdAt' }
    end

    it_behaves_like 'has UTC ISO 8601 date and time' do
      let(:date) { type.updated_at }
      let(:json_path) { 'updatedAt' }
    end

    describe 'caching' do
      it 'is based on the representer\'s cache_key' 


      describe '#json_cache_key' do
        let!(:former_cache_key) { representer.json_cache_key }

        it 'includes the name of the representer class' 


        it 'changes when the locale changes' 


        it 'changes when the type is updated' 

      end
    end
  end
end


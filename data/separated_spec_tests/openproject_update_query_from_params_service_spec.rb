#-- copyright
# OpenProject is a project management system.
# Copyright (C) 2012-2017 the OpenProject Foundation (OPF)
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
# See doc/COPYRIGHT.rdoc for more details.
#++

require 'spec_helper'

describe UpdateQueryFromParamsService,
         type: :model do

  let(:user) { FactoryGirl.build_stubbed(:user) }
  let(:query) { FactoryGirl.build_stubbed(:query) }

  let(:instance) { described_class.new(query, user) }

  let(:params) { {} }

  describe '#call' do
    subject { instance.call(params) }

    context 'group_by' do
      context 'for an existing value' do
        let(:params) { { group_by: 'status' } }

        it 'sets the value' 


        context 'when hierarchy was set previously' do
          it 'disables the mode when not given' 

        end
      end

      context 'when passed along with hierarchy mode' do
        let(:params) { { group_by: 'status', show_hierarchies: true } }

        it 'sets both values' 

      end
    end

    context 'filters' do
      let(:params) do
        { filters: [{ field: 'status_id', operator: '=', values: ['1', '2'] }] }
      end

      context 'for a valid filter' do
        it 'sets the filter' 

      end
    end

    context 'sort_by' do
      let(:params) do
        { sort_by: [['status_id', 'desc']] }
      end

      it 'sets the order' 

    end

    context 'columns' do
      let(:params) do
        { columns: ['assigned_to', 'author', 'category', 'subject'] }
      end

      it 'sets the columns' 

    end
  end
end


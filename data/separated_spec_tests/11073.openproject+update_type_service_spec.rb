#-- encoding: UTF-8
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
require 'services/shared_type_service'

describe UpdateTypeService do
  let(:type) { FactoryBot.build_stubbed(:type) }
  let(:user) { FactoryBot.build_stubbed(:admin) }

  let(:instance) { described_class.new(type, user) }
  let(:service_call) { instance.call(params) }

  it_behaves_like 'type service'

  describe "#validate_attribute_groups" do
    let(:params) { { name: 'blubs blubs' } }

    it 'raises an exception for invalid structure' 


    it 'fails for duplicate group names' 


    it 'passes validations for known attributes' 


    it 'passes validation for defaults' 


    it 'passes validation for reset' 


    context 'with an invalid query' do
      let(:query) { FactoryBot.build(:global_query, name: '') }
      let(:params) { { attribute_groups: [['some name', [query]]] } }

      it 'is invalid' 

    end
  end
end


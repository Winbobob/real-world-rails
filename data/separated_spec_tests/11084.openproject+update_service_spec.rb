#-- encoding: UTF-8

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

describe CustomActions::UpdateService do
  let(:action) do
    action = FactoryBot.build_stubbed(:custom_action)

    allow(action)
      .to receive(:save)
      .and_return(save_success)

    action
  end
  let(:user) { FactoryBot.build_stubbed(:user) }
  let(:save_success) { true }
  let(:contract_success) { true }
  let(:contract_errors) { double('contract errors') }
  let(:instance) do
    contract
    described_class.new(action: action, user: user)
  end
  let(:contract) do
    contract_instance = double('contract instance')

    allow(CustomActions::CUContract)
      .to receive(:new)
      .with(action)
      .and_return(contract_instance)

    allow(contract_instance)
      .to receive(:validate)
      .and_return(contract_success)
    allow(contract_instance)
      .to receive(:errors)
      .and_return(contract_errors)

    contract_instance
  end

  describe '#call' do
    it 'is successful' 


    it 'is has the action in the result' 


    it 'yields the result' 


    context 'unsuccessful saving' do
      let(:save_success) { false }

      it 'yields the result' 

    end

    context 'unsuccessful contract' do
      let(:contract_success) { false }

      it 'yields the result' 

    end

    it 'sets the name of the action' 


    it 'updates the actions' 


    it 'handles unknown actions' 


    it 'updates the conditions' 


    it 'handles unknown conditions' 

  end
end


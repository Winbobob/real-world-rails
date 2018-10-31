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

describe AddWorkPackageNoteService, type: :model do
  let(:user) { FactoryGirl.build_stubbed(:user) }
  let(:work_package) { FactoryGirl.build_stubbed(:work_package) }
  let(:instance) do
    described_class.new(user: user,
                        work_package: work_package)
  end

  describe '.contract' do
    it 'uses the CreateNoteContract contract' 

  end

  describe 'call' do
    let(:mock_contract) do
      double(WorkPackages::CreateNoteContract,
             new: mock_contract_instance)
    end
    let(:mock_contract_instance) do
      mock_model(WorkPackages::CreateNoteContract)
    end
    let(:valid_contract) { true }

    let(:send_notifications) { false }

    before do
      expect(JournalManager)
        .to receive(:with_send_notifications)
        .with(send_notifications)
        .and_yield

      allow(described_class).to receive(:contract).and_return(mock_contract)
      allow(work_package).to receive(:save_journals).and_return true
      allow(mock_contract_instance).to receive(:validate).and_return valid_contract
    end

    subject { instance.call('blubs', send_notifications: send_notifications) }

    it 'is successful' 


    it 'persists the value' 


    it 'has no errors' 


    context 'when the contract does not validate' do
      let(:valid_contract) { false }

      it 'is unsuccessful' 


      it 'does not persist the changes' 


      it "exposes the contract's errors" 

    end

    context 'when the saving is unsuccessful' do
      before do
        expect(work_package).to receive(:save_journals).and_return false
      end

      it 'is unsuccessful' 


      it 'leaves the value unchanged' 


      it "exposes the work_packages's errors" 

    end
  end
end


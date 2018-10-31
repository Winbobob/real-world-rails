#-- encoding: UTF-8
#-- copyright
# OpenProject is a project management system.
# Copyright (C) 2012-2015 the OpenProject Foundation (OPF)
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License version 3.
#
# OpenProject is a fork of ChiliProject, which is a fork of Redmine. The copyright follows:
# Copyright (C) 2006-2013 Jean-Philippe Lang
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

require 'spec_helper'

describe CreateWorkPackageService do
  let(:user) { FactoryBot.build_stubbed(:user) }
  let(:work_package) { FactoryBot.build_stubbed(:work_package, author: nil) }
  let(:project) { FactoryBot.build_stubbed(:project_with_types) }
  let(:instance) { described_class.new(user: user) }
  let(:errors) { double('errors') }

  describe '.contract' do
    it 'uses the CreateContract contract' 

  end

  describe '.new' do
    it 'takes a user which is available as a getter' 

  end

  describe '#call' do
    let(:mock_contract) do
      double(WorkPackages::CreateContract,
             new: mock_contract_instance)
    end
    let(:mock_contract_instance) do
      mock_model(WorkPackages::CreateContract)
    end
    let(:attributes) do
      { project_id: 1,
        subject: 'lorem ipsum',
        status_id: 5 }
    end

    before do
      allow(instance)
        .to receive(:contract_class)
        .and_return(mock_contract)

      allow(WorkPackage)
        .to receive(:new)
        .and_return(work_package)

      allow(work_package)
        .to receive(:save)
        .and_return true
      allow(mock_contract_instance)
        .to receive(:validate)
        .and_return true
    end

    subject { instance.call(work_package) }

    context 'if contract validates and the work package saves' do
      it 'is successful' 


      it 'has no errors' 


      it 'returns the work package as a result' 


      it 'sets the user to be the author' 

    end

    context 'if contract does not validate' do
      before do
        allow(mock_contract_instance)
          .to receive(:validate)
          .and_return false
      end

      it 'is unsuccessful' 


      it "returns the contract's errors" 

    end

    context 'if work_package does not save' do
      before do
        allow(work_package)
          .to receive(:save)
          .and_return false
      end

      it 'is unsuccessful' 


      it "returns the work_package's errors" 

    end
  end
end


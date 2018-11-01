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

describe WorkPackages::UpdateService, type: :model do
  let(:user) { FactoryBot.build_stubbed(:user) }
  let(:project) do
    p = FactoryBot.build_stubbed(:project)
    allow(p).to receive(:shared_versions).and_return([])

    p
  end
  let(:work_package) do
    wp = FactoryBot.build_stubbed(:work_package, project: project)
    wp.type = FactoryBot.build_stubbed(:type)
    wp.send(:clear_changes_information)

    wp
  end
  let(:instance) do
    described_class.new(user: user,
                        work_package: work_package)
  end

  describe 'call' do
    let(:set_attributes_service) do
      service = double("WorkPackages::SetAttributesService",
                       new: set_attributes_service_instance)

      stub_const('WorkPackages::SetAttributesService', service)

      service
    end
    let(:set_attributes_service_instance) do
      instance = double("WorkPackages::SetAttributesServiceInstance")

      allow(instance)
        .to receive(:call) do |attributes|
        work_package.attributes = attributes

        set_service_results
      end

      instance
    end
    let(:errors) { [] }
    let(:set_service_results) { ServiceResult.new success: true, result: work_package }
    let(:work_package_save_result) { true }

    before do
      set_attributes_service
    end

    let(:send_notifications) { true }

    before do
      expect(JournalManager)
        .to receive(:with_send_notifications)
        .with(send_notifications)
        .and_yield

      allow(work_package)
        .to receive(:save)
        .and_return work_package_save_result
    end

    shared_examples_for 'service call' do
      subject { instance.call(attributes: call_attributes, send_notifications: send_notifications) }

      it 'is successful' 


      it 'sets the value' 


      it 'has no errors' 


      context 'when setting the attributes is unsuccessful (invalid)' do
        let(:errors) { double('set errors', empty?: false) }
        let(:set_service_results) { ServiceResult.new success: false, errors: errors, result: work_package }

        it 'is unsuccessful' 


        it 'does not persist the changes' 


        it 'exposes the errors' 

      end

      context 'when the saving is unsuccessful' do
        let(:work_package_save_result) { false }
        let(:saving_errors) { double('saving_errors', empty?: false) }

        before do
          allow(work_package)
            .to receive(:errors)
            .and_return(saving_errors)
        end

        it 'is unsuccessful' 


        it 'leaves the value unchanged' 


        it "exposes the work_packages's errors" 

      end
    end

    context 'update subject before calling the service' do
      let(:call_attributes) { {} }
      let(:attributes) { { subject: 'blubs blubs' } }

      before do
        work_package.attributes = attributes
      end

      it_behaves_like 'service call'
    end

    context 'updating subject via attributes' do
      let(:call_attributes) { attributes }
      let(:attributes) { { subject: 'blubs blubs' } }

      it_behaves_like 'service call'
    end

    context 'when switching the project' do
      let(:target_project) do
        FactoryBot.build_stubbed(:project)
      end
      let(:call_attributes) { attributes }
      let(:attributes) { { project: target_project } }

      it_behaves_like 'service call'

      context 'relations' do
        it 'removes the relations if the setting does not permit cross project relations' 


        it 'leaves the relations unchanged if the setting allows cross project relations' 

      end

      context 'time_entries' do
        it 'moves the time entries' 

      end
    end

    context 'when switching the type' do
      let(:target_type) { FactoryBot.build_stubbed(:type) }

      context 'custom_values' do
        it 'resets the custom values' 

      end
    end
  end
end


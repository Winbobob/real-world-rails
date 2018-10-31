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

describe UpdateChildWorkPackageService, type: :model do
  let(:user) { FactoryGirl.build_stubbed(:user) }
  let(:project) do
    p = FactoryGirl.build_stubbed(:project)
    allow(Project)
      .to receive(:find)
      .with(p.id)
      .and_return(p)
    allow(p).to receive(:shared_versions).and_return([])

    p
  end
  let(:type) { FactoryGirl.build_stubbed(:type) }
  let(:status) { FactoryGirl.build_stubbed(:status) }
  let(:work_package) do
    wp = FactoryGirl.build_stubbed(:work_package,
                                   type: type,
                                   status: status,
                                   project: project)
    allow(wp)
      .to receive(:new_statuses_allowed_to)
      .with(user, true)
      .and_return([status])
    wp.send(:clear_changes_information)

    wp
  end
  let(:instance) do
    UpdateChildWorkPackageService.new(user: user,
                                      work_package: work_package)
  end

  describe 'call' do
    let(:set_attributes_service) do
      service = double("SetAttributesWorkPackageService",
                       new: set_attributes_service_instance)

      stub_const('SetAttributesWorkPackageService', service)

      service
    end
    let(:set_attributes_service_instance) do
      instance = double("SetAttributesWorkPackageServiceInstance")

      allow(instance)
        .to receive(:call) do |attributes|
        work_package.attributes = attributes

        set_service_results
      end

      instance
    end
    let(:set_service_results) { double('result', success?: true, errors: work_package.errors) }

    before do
      set_attributes_service
    end

    let(:send_notifications) { true }

    before do
      expect(JournalManager)
        .to receive(:with_send_notifications)
        .with(send_notifications)
        .and_yield

      allow(work_package).to receive(:save).and_return true
    end

    context 'when switching the project' do
      let(:target_project) do
        p = FactoryGirl.build_stubbed(:project)
        allow(p).to receive(:types).and_return([type])

        p
      end

      context 'fixed_version' do
        let(:version) do
          FactoryGirl.build_stubbed(:version)
        end

        before do
          work_package.fixed_version = version
        end

        it 'is nil if the fixed version is not defined in the new project' 

      end

      context 'category' do
        let(:category) do
          FactoryGirl.build_stubbed(:category,
                                    project: work_package.project,
                                    name: 'blubs')
        end
        let(:target_category) do
          FactoryGirl.build_stubbed(:category,
                                    project: target_project,
                                    name: 'blubs')
        end

        it 'assigns a category of the same name' 


        it 'assigns nil to category if equally named category exists' 

      end

      context 'type and status' do
        let(:type2) { FactoryGirl.build_stubbed(:type) }
        let(:type3) { FactoryGirl.build_stubbed(:type) }
        let(:status2) { FactoryGirl.build_stubbed(:status) }
        let(:status3) { FactoryGirl.build_stubbed(:status) }
        let(:default_type) { FactoryGirl.build_stubbed(:type, is_default: true) }
        let(:default_status) { FactoryGirl.build_stubbed(:status, is_default: true) }

        context 'if the type is available in the project' do
          before do
            allow(target_project)
              .to receive(:types)
              .and_return([type])

            instance.call(attributes: { project: target_project })
          end

          it 'keeps the type' 


          it 'keeps the status' 

        end

        context 'if the current type is not available and the default type is' do
          before do
            allow(target_project)
              .to receive(:types)
              .and_return([type2, default_type])
          end

          it 'changes to the default type' 


          it 'keeps the status if it is part of the workflow' 


          it 'uses the default status if the current one is not part of the workflow' 


          it 'uses the first status if neither the current nor the default
            is part of the workflow' do
            allow(work_package)
              .to receive(:new_statuses_allowed_to)
              .with(user, true)
              .and_return([status2, status3])

            instance.call(attributes: { project: target_project })

            expect(work_package.status).to eql status2
          end
        end

        context 'if neither the current nor the default type is available' do
          before do
            allow(target_project)
              .to receive(:types)
              .and_return([type2, type3])
          end

          it 'takes the first type' 


          it 'keeps the status if it is part of the workflow' 


          it 'uses the default status if the current one is not part of the workflow' 


          it 'uses the first status if neither the current nor the default
            is part of the workflow' do
            allow(work_package)
              .to receive(:new_statuses_allowed_to)
              .with(user, true)
              .and_return([status2, status3])

            instance.call(attributes: { project: target_project })

            expect(work_package.status).to eql status2
          end
        end
      end
    end
  end
end


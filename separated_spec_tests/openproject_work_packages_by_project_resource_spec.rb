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
require 'rack/test'

describe API::V3::WorkPackages::WorkPackagesByProjectAPI, type: :request do
  include Rack::Test::Methods
  include API::V3::Utilities::PathHelper

  let(:current_user) do
    FactoryGirl.build(:user, member_in_project: project, member_through_role: role)
  end
  let(:role) { FactoryGirl.create(:role, permissions: permissions) }
  let(:permissions) { [:view_work_packages] }
  let(:project) { FactoryGirl.create(:project_with_types, is_public: false) }
  let(:path) { api_v3_paths.work_packages_by_project project.id }

  before do
    allow(User).to receive(:current).and_return current_user
  end

  describe '#get' do
    let(:work_packages) { [] }
    subject { last_response }

    before do
      work_packages.each(&:save!)
      get path
    end

    it 'succeeds' 


    context 'not allowed to see the project' do
      let(:current_user) { FactoryGirl.build(:user) }

      it 'fails with HTTP Not Found' 

    end

    context 'not allowed to see work packages' do
      let(:permissions) { [:view_project] }

      it 'fails with HTTP Not Found' 

    end

    describe 'advanced query options' do
      let(:base_path) { api_v3_paths.work_packages_by_project project.id }
      let(:query) { {} }
      let(:path) { "#{base_path}?#{query.to_query}" }

      describe 'sorting' do
        let(:query) { { sortBy: '[["id", "desc"]]' } }
        let(:work_packages) { FactoryGirl.create_list(:work_package, 2, project: project) }

        it 'returns both elements' 


        it 'returns work packages in the expected order' 

      end

      describe 'filtering' do
        let(:query) do
          {
            filters: [
              {
                priority: {
                  operator: '=',
                  values: [priority1.id.to_s]
                }
              }
            ].to_json
          }
        end
        let(:priority1) { FactoryGirl.create(:priority, name: 'Prio A') }
        let(:priority2) { FactoryGirl.create(:priority, name: 'Prio B') }
        let(:work_packages) do
          [
            FactoryGirl.create(:work_package, project: project, priority: priority1),
            FactoryGirl.create(:work_package, project: project, priority: priority2)
          ]
        end

        it 'returns only one element' 


        it 'returns the matching element' 

      end

      describe 'grouping' do
        let(:query) { { groupBy: 'priority' } }
        let(:priority1) { FactoryGirl.build(:priority, name: 'Prio A', position: 2) }
        let(:priority2) { FactoryGirl.build(:priority, name: 'Prio B', position: 1) }
        let(:work_packages) do
          [
            FactoryGirl.create(:work_package,
                               project: project,
                               priority: priority1,
                               estimated_hours: 1),
            FactoryGirl.create(:work_package,
                               project: project,
                               priority: priority2,
                               estimated_hours: 2),
            FactoryGirl.create(:work_package,
                               project: project,
                               priority: priority1,
                               estimated_hours: 3)
          ]
        end
        let(:expected_group1) do
          {
            _links: {
              valueLink: [{
                href: api_v3_paths.priority(priority1.id)
              }],
              groupBy: {
                href: api_v3_paths.query_group_by('priority'),
                title: 'Priority'
              }
            },
            value: priority1.name,
            count: 2
          }
        end
        let(:expected_group2) do
          {
            _links: {
              valueLink: [{
                href: api_v3_paths.priority(priority2.id)
              }],
              groupBy: {
                href: api_v3_paths.query_group_by('priority'),
                title: 'Priority'
              }
            },
            value: priority2.name,
            count: 1
          }
        end

        it 'returns all elements' 


        it 'returns work packages ordered by priority' 


        it 'contains group elements' 


        context 'displaying sums' do
          let(:query) { { groupBy: 'priority', showSums: 'true' } }
          let(:expected_group1) do
            {
              _links: {
                valueLink: [{
                  href: api_v3_paths.priority(priority1.id)
                }],
                groupBy: {
                  href: api_v3_paths.query_group_by('priority'),
                  title: 'Priority'
                }
              },
              value: priority1.name,
              count: 2,
              sums: {
                estimatedTime: 'PT4H'
              }
            }
          end
          let(:expected_group2) do
            {
              _links: {
                valueLink: [{
                  href: api_v3_paths.priority(priority2.id)
                }],
                groupBy: {
                  href: api_v3_paths.query_group_by('priority'),
                  title: 'Priority'
                }
              },
              value: priority2.name,
              count: 1,
              sums: {
                estimatedTime: 'PT2H'
              }
            }
          end

          it 'contains extended group elements' 

        end
      end

      describe 'displaying sums' do
        let(:query) { { showSums: 'true' } }
        let(:work_packages) do
          [
            FactoryGirl.create(:work_package, project: project, estimated_hours: 1),
            FactoryGirl.create(:work_package, project: project, estimated_hours: 2)
          ]
        end

        it 'returns both elements' 


        it 'contains the sum element' 

      end
    end
  end

  describe '#post' do
    let(:permissions) { [:add_work_packages, :view_project] }
    let(:status) { FactoryGirl.build(:status, is_default: true) }
    let(:priority) { FactoryGirl.build(:priority, is_default: true) }
    let(:parameters) do
      {
        subject: 'new work packages',
        _links: {
          type: {
            href: api_v3_paths.type(project.types.first.id)
          }
        }
      }
    end

    before do
      status.save!
      priority.save!

      FactoryGirl.create(:user_preference, user: current_user, others: { no_self_notified: false })
      post path, parameters.to_json, 'CONTENT_TYPE' => 'application/json'
    end

    context 'notifications' do
      let(:permissions) { [:add_work_packages, :view_project, :view_work_packages] }

      it 'sends a mail by default' 


      context 'without notifications' do
        let(:path) { "#{api_v3_paths.work_packages_by_project(project.id)}?notify=false" }

        it 'should not send a mail' 

      end

      context 'with notifications' do
        let(:path) { "#{api_v3_paths.work_packages_by_project(project.id)}?notify=true" }

        it 'should send a mail' 

      end
    end

    it 'should return Created(201)' 


    it 'should create a work package' 


    it 'should use the given parameters' 


    context 'no permissions' do
      let(:current_user) { FactoryGirl.create(:user) }

      it 'should hide the endpoint' 

    end

    context 'view_project permission' do
      # Note that this just removes the add_work_packages permission
      # view_project is actually provided by being a member of the project
      let(:permissions) { [:view_project] }

      it 'should point out the missing permission' 

    end

    context 'empty parameters' do
      let(:parameters) { {} }

      it_behaves_like 'multiple errors', 422

      it 'should not create a work package' 

    end

    context 'bogus parameters' do
      let(:parameters) do
        {
          bogus: 'bogus',
          _links: {
            type: {
              href: api_v3_paths.type(project.types.first.id)
            }
          }
        }
      end

      it_behaves_like 'constraint violation' do
        let(:message) { "Subject can't be blank" }
      end

      it 'should not create a work package' 

    end

    context 'invalid value' do
      let(:parameters) do
        {
          subject: nil,
          _links: {
            type: {
              href: api_v3_paths.type(project.types.first.id)
            }
          }
        }
      end

      it_behaves_like 'constraint violation' do
        let(:message) { "Subject can't be blank" }
      end

      it 'should not create a work package' 

    end
  end
end


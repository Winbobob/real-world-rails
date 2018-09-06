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

describe Authorization::UserAllowedService do
  let(:user) { FactoryGirl.build_stubbed(:user) }
  let(:instance) { described_class.new(user) }
  let(:action) { :an_action }
  let(:action_hash) { { controller: '/controller', action: 'action' } }
  let(:project) { FactoryGirl.build_stubbed(:project) }
  let(:other_project) { FactoryGirl.build_stubbed(:project) }
  let(:role) { FactoryGirl.build_stubbed(:role) }
  let(:user_roles_in_project) { [role] }
  let(:role_grants_action) { true }
  let(:project_allows_to) { true }

  describe '#initialize' do
    it 'has the user' 

  end

  shared_examples_for 'successful run' do
    it 'is successful' 

  end

  shared_examples_for 'allowed to checked' do
    before do
      Array(context).each do |project|
        project.status = Project::STATUS_ACTIVE

        allow(project)
          .to receive(:allows_to?)
          .with(action)
          .and_return(project_allows_to)

        allow(Authorization)
          .to receive(:roles)
          .with(user, project)
          .and_return(user_roles_in_project)
      end

      allow(role)
        .to receive(:allowed_to?)
        .with(action)
        .and_return(role_grants_action)
    end

    context 'with the user having a granting role' do
      it_behaves_like 'successful run' do
        it 'is true' 


        it 'does not call the db twice for a project' 

      end
    end

    context 'with the user having a nongranting role' do
      let(:role_grants_action) { false }

      it_behaves_like 'successful run' do
        it 'is false' 

      end
    end

    context 'with the user being admin
             with the user not having a granting role' do
      let(:user_roles_in_project) { [] }

      before do
        user.admin = true
      end

      it_behaves_like 'successful run' do
        it 'is true' 

      end
    end

    context 'with the project not being active' do
      before do
        Array(context).each do |project|
          project.status = Project::STATUS_ARCHIVED
        end
      end

      it_behaves_like 'successful run' do
        it 'is false' 


        it 'is false even if the user is admin' 

      end
    end

    context 'with the project not having the action enabled' do
      let(:project_allows_to) { false }

      it_behaves_like 'successful run' do
        it 'is false' 


        it 'is false even if the user is admin' 

      end
    end

    context 'with having precached the results' do
      before do
        auth_cache = double('auth_cache')

        allow(User::ProjectAuthorizationCache)
          .to receive(:new)
          .and_return(auth_cache)

        allow(auth_cache)
          .to receive(:cache)
          .with(action)

        allow(auth_cache)
          .to receive(:cached?)
          .with(action)
          .and_return(true)

        Array(context).each do |project|
          allow(auth_cache)
            .to receive(:allowed?)
            .with(action, project)
            .and_return(true)
        end

        instance.preload_projects_allowed_to(action)
      end

      it_behaves_like 'successful run' do
        it 'is true' 


        it 'does not call the db' 

      end
    end
  end

  describe '#call' do
    context 'for a project' do
      let(:context) { project }

      it_behaves_like 'allowed to checked'
    end

    context 'for an array of projects' do
      let(:context) { [project, other_project] }

      it_behaves_like 'allowed to checked'

      context 'with the array being empty' do
        it_behaves_like 'successful run' do
          it 'is false' 

        end
      end

      context 'with one project not allowing an action' do
        before do
          allow(project)
            .to receive(:allows_to?)
            .with(action)
            .and_return(false)
        end

        it_behaves_like 'successful run' do
          it 'is false' 

        end
      end
    end

    context 'for a relation of projects' do
      let(:context) { double('relation', class: ActiveRecord::Relation, to_a: [project]) }

      it_behaves_like 'allowed to checked'
    end

    context 'for anything else' do
      let(:context) { nil }

      it 'is false' 


      it 'is unsuccessful' 

    end

    context 'for a global check' do
      context 'with the user being admin' do
        before do
          user.admin = true
        end

        it 'is true' 


        it 'is successful' 

      end

      context 'with the user having a granting role' do
        before do
          allow(Authorization)
            .to receive(:roles)
            .with(user, nil)
            .and_return([role])

          allow(role)
            .to receive(:allowed_to?)
            .with(action)
            .and_return(true)
        end

        it 'is true' 


        it 'is successful' 

      end

      context 'with the user not having a granting role' do
        before do
          allow(Authorization)
            .to receive(:roles)
            .with(user, nil)
            .and_return([role])

          allow(role)
            .to receive(:allowed_to?)
            .with(action)
            .and_return(false)
        end

        it 'is false' 


        it 'is successful' 

      end
    end
  end
end


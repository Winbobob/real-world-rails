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

describe MembersController, type: :controller do
  let(:admin) { FactoryBot.create(:admin) }
  let(:user) { FactoryBot.create(:user) }
  let(:project) { FactoryBot.create(:project, identifier: 'pet_project') }
  let(:role) { FactoryBot.create(:role) }
  let(:member) {
    FactoryBot.create(:member, project: project,
                                user: user,
                                roles: [role])
  }

  before do
    allow(User).to receive(:current).and_return(admin)
  end

  describe 'create' do
    let(:admin) { FactoryBot.create(:admin) }
    let(:project_2) { FactoryBot.create(:project) }

    before do
      allow(User).to receive(:current).and_return(admin)
    end

    it 'should work for multiple users' 

  end

  describe 'update' do
    let(:admin) { FactoryBot.create(:admin) }
    let(:project_2) { FactoryBot.create(:project) }
    let(:role_1) { FactoryBot.create(:role) }
    let(:role_2) { FactoryBot.create(:role) }
    let(:member_2) do
      FactoryBot.create(
        :member,
        project: project_2,
        user: admin,
        roles: [role_1])
    end

    before do
      allow(User).to receive(:current).and_return(admin)
    end

    it 'should, however, allow roles to be updated through mass assignment' 

  end

  describe '#autocomplete_for_member' do
    let(:params) { { 'project_id' => project.identifier.to_s } }

    before do
      login_as(user)
    end

    describe "WHEN the user is authorized
              WHEN a project is provided" do
      before do
        role.add_permission! :manage_members
        member
      end

      it 'should be success' 

    end

    describe 'WHEN the user is not authorized' do
      it 'should be forbidden' 

    end
  end

  describe '#create' do
    render_views
    let(:user2) { FactoryBot.create(:user) }
    let(:user3) { FactoryBot.create(:user) }
    let(:user4) { FactoryBot.create(:user) }

    context 'post :create' do
      context 'single member' do
        let(:action) do
          post :create,
               params: {
                 project_id: project.id,
                 member: { role_ids: [role.id], user_id: user2.id }
               }
        end

        it 'should add a member' 

      end

      context 'multiple members' do
        let(:action) do
          post :create,
               params: {
                 project_id: project.id,
                 member: { role_ids: [role.id], user_ids: [user2.id, user3.id, user4.id] }
               }
        end

        it 'should add all members' 

      end
    end

    context 'with a failed save' do
      let(:invalid_params) do
        { project_id: project.id,
          member: { role_ids: [],
                    user_ids: [user2.id, user3.id, user4.id] } }
      end

      before do
        post :create, params: invalid_params
      end

      it 'should not redirect to the members index' 


      it 'should show an error message' 

    end
  end

  describe '#destroy' do
    let(:action) { post :destroy, params: { id: member.id } }
    before do
      member
    end

    it 'should destroy a member' 

  end

  describe '#update' do
    let(:action) {
      post :update,
           params: {
             id: member.id,
             member: { role_ids: [role2.id], user_id: user.id }
           }
    }
    let(:role2) { FactoryBot.create(:role) }

    before do
      member
    end

    it 'should update the member' 

  end
end


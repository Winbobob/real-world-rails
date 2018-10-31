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

describe Authorization::UserGlobalRolesQuery do
  let(:user) { FactoryBot.build(:user) }
  let(:anonymous) { FactoryBot.build(:anonymous) }
  let(:project) { FactoryBot.build(:project, is_public: false) }
  let(:project2) { FactoryBot.build(:project, is_public: false) }
  let(:public_project) { FactoryBot.build(:project, is_public: true) }
  let(:role) { FactoryBot.build(:role) }
  let(:role2) { FactoryBot.build(:role) }
  let(:anonymous_role) { FactoryBot.build(:anonymous_role) }
  let(:non_member) { FactoryBot.build(:non_member) }
  let(:member) {
    FactoryBot.build(:member, project: project,
                               roles: [role],
                               principal: user)
  }
  let(:member2) {
    FactoryBot.build(:member, project: project2,
                               roles: [role2],
                               principal: user)
  }

  describe '.query' do
    before do
      non_member.save!
      anonymous_role.save!
      user.save!
    end

    it 'is a user relation' 


    context 'w/ the user being a member in a project' do
      before do
        member.save!
      end

      it 'is the member and non member role' 

    end

    context 'w/ the user being a member in two projects' do
      before do
        member.save!
        member2.save!
      end

      it 'is both member and the non member role' 

    end

    context 'w/o the user being a member in a project' do
      it 'is the non member role' 

    end

    context 'w/ the user being anonymous' do
      it 'is the anonymous role' 

    end
  end
end


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

describe 'Journalized Objects' do
  before(:each) do
    @project ||= FactoryBot.create(:project_with_types)
    @type ||= @project.types.first
    @current = FactoryBot.create(:user, login: 'user1', mail: 'user1@users.com')
    allow(User).to receive(:current).and_return(@current)
  end

  it 'should work with work packages' 


  it 'should work with news' 


  it 'should work with wiki content' 


  it 'should work with messages' 


  it 'should work with time entries' 


  it 'should work with attachments' 


  it 'should work with changesets' 


  describe 'journal_editable_by?' do
    context 'when the journable is a work package' do
      let!(:user) { FactoryBot.create(:user) }
      let!(:project) { FactoryBot.create(:project_with_types) }
      let!(:role) { FactoryBot.create(:role, permissions: [:edit_work_packages]) }
      let!(:member) {
        FactoryBot.create(:member, project: project,
                                    roles: [role],
                                    principal: user)
      }
      let!(:work_package) {
        FactoryBot.build(:work_package, type: project.types.first,
                                         author: user,
                                         project: project,
                                         description: '')
      }

      subject { work_package.journal_editable_by?(user) }

      context 'and the user has no permission to "edit_work_packages"' do
        before do
          role.remove_permission! :edit_work_packages
        end

        it { is_expected.to be_falsey }
      end
    end
  end
end


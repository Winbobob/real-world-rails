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

describe WorkPackagePolicy, type: :controller do
  let(:user)         { FactoryBot.build_stubbed(:user) }
  let(:project)      { FactoryBot.build_stubbed(:project) }
  let(:work_package) { FactoryBot.build_stubbed(:work_package, project: project) }

  describe '#allowed?' do
    let(:subject) { described_class.new(user) }

    before do
      allow(user).to receive(:allowed_to?).and_return false
    end

    context 'for edit' do
      subject { described_class.new(user).allowed?(work_package, :edit) }

      it 'is false if the user has no permission in the project' 


      it 'is true if the user has the edit_work_package permission in the project' 


      # used to be truthy
      it 'is false if the user has only the add_work_package_notes permission in the project' 


      it 'is false if the user has the edit_work_package permission in the project' 


      it 'is false if the user has the permissions but the work package is unpersisted' 

    end

    context 'for manage_subtasks' do
      it 'is true if the user has the manage_subtasks permission in the project' 

    end

    context 'for comment' do
      subject { described_class.new(user).allowed?(work_package, :comment) }

      it 'is false if the user lacks permission' 


      it 'is true if the user has the add_work_package_notes permission' 


      it 'is true if the user has the edit_work_package permission' 


      it 'is false if the user has the edit_work_package permission
          but the work_package is unpersisted' do
        allow(user).to receive(:allowed_to?).with(:edit_work_packages, project)
          .and_return true
        allow(work_package).to receive(:persisted?).and_return false

        expect(subject).to be_falsey
      end
    end
  end
end


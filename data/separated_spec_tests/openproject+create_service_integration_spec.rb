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

describe WorkPackages::CreateService, 'integration', type: :model do
  let(:user) do
    FactoryBot.create(:user,
                      member_in_project: project,
                      member_through_role: role)
  end
  let(:role) do
    FactoryBot.create(:role,
                      permissions: permissions)
  end

  let(:permissions) do
    %i(view_work_packages add_work_packages manage_subtasks)
  end

  let(:type) do
    FactoryBot.create(:type,
                      custom_fields: [custom_field])
  end
  let(:default_type) do
    FactoryBot.create(:type_standard)
  end
  let(:project) { FactoryBot.create(:project, types: [type, default_type]) }
  let(:parent) do
    FactoryBot.create(:work_package,
                      project: project,
                      type: type)
  end
  let(:instance) { described_class.new(user: user) }
  let(:custom_field) { FactoryBot.create(:work_package_custom_field) }
  let(:other_status) { FactoryBot.create(:status) }
  let(:default_status) { FactoryBot.create(:default_status) }
  let(:priority) { FactoryBot.create(:priority) }
  let(:default_priority) { FactoryBot.create(:default_priority) }
  let(:attributes) { {} }
  let(:new_work_package) do
    service_result
      .result
  end
  let(:service_result) do
    instance
      .call(attributes: attributes)
  end

  before do
    other_status
    default_status
    priority
    default_priority
    type
    default_type
    login_as(user)
  end

  describe '#call' do
    let(:attributes) do
      { subject: 'blubs',
        project: project,
        done_ratio: 50,
        parent: parent,
        start_date: Date.today,
        due_date: Date.today + 3.days }
    end

    it 'creates the work_package with the provided attributes' 


    describe 'setting the attachments' do
      let!(:other_users_attachment) do
        FactoryBot.create(:attachment, container: nil, author: FactoryBot.create(:user))
      end
      let!(:users_attachment) do
        FactoryBot.create(:attachment, container: nil, author: user)
      end

      it 'reports on invalid attachments and sets the new if everything is valid' 

    end
  end
end


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
require 'rack/test'

describe 'API v3 posts resource', type: :request do
  include Rack::Test::Methods
  include API::V3::Utilities::PathHelper

  let(:current_user) do
    FactoryBot.create(:user, member_in_project: project, member_through_role: role)
  end
  let(:board) { FactoryBot.create(:board, project: project) }
  let(:message) { FactoryBot.create(:message, board: board) }
  let(:project) { FactoryBot.create(:project) }
  let(:role) { FactoryBot.create(:role, permissions: permissions) }
  let(:permissions) { %i(view_messages) }

  subject(:response) { last_response }

  before do
    login_as(current_user)
  end

  describe 'GET /api/v3/posts/:id' do
    let(:path) { api_v3_paths.post(message.id) }

    before do
      get path
    end

    it 'returns 200 OK' 


    it 'returns the message page' 


    context 'when lacking permissions' do
      let(:current_user) { FactoryBot.create(:user) }

      it 'returns 404 NOT FOUND' 

    end
  end
end

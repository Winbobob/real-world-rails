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

describe ::API::V3::Users::UsersAPI, type: :request do
  include API::V3::Utilities::PathHelper

  let(:path) { api_v3_paths.user(user.id) }
  let(:current_user) { FactoryGirl.build(:admin) }

  let(:user) { FactoryGirl.create(:user) }
  let(:parameters) { {} }

  before do
    login_as(current_user)
  end

  def send_request
    patch path, params: parameters.to_json, headers: { 'Content-Type' => 'application/json' }
  end

  shared_context 'successful update' do |expected_attributes|
    it 'responds with the represented updated user' 

  end

  describe 'empty request body' do
    it_behaves_like 'successful update'
  end

  describe 'attribute change' do
    let(:parameters) { { email: 'foo@example.org' } }
    it_behaves_like 'successful update', mail: 'foo@example.org'
  end

  describe 'password update' do
    let(:password) { 'my!new!password123' }
    let(:parameters) { { password: password } }

    it 'updates the users password correctly' 

  end

  describe 'attribute collision' do
    let(:parameters) { { email: 'foo@example.org' } }
    let(:collision) { FactoryGirl.create(:user, mail: 'foo@example.org') }
    before do
      collision
    end

    it 'returns an erroneous response' 

  end

  describe 'unknown user' do
    let(:parameters) { { email: 'foo@example.org' } }
    let(:path) { api_v3_paths.user(666) }

    it 'responds with 404' 

  end

  describe 'unauthorized user' do
    let(:current_user) { FactoryGirl.build(:user) }
    let(:parameters) { { email: 'new@example.org' } }

    it 'returns an erroneous response' 

  end
end


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

  let(:path) { api_v3_paths.users }
  let(:user) { FactoryGirl.build(:admin) }
  let(:parameters) { {} }

  before do
    login_as(user)
  end

  def send_request
    post path, params: parameters.to_json, headers: { 'Content-Type' => 'application/json' }
  end

  let(:errors) { parse_json(response.body)['_embedded']['errors'] }

  shared_context 'represents the created user' do |expected_attributes|
    it 'returns the represented user' 

  end

  describe 'empty request body' do
    it 'returns an erroneous response' 

  end

  describe 'active status' do
    let(:status) { 'active' }

    let(:parameters) {
      {
        status: status,
        login: 'myusername',
        firstName: 'Foo',
        lastName: 'Bar',
        email: 'foobar@example.org'
      }
    }

    context 'with auth_source' do
      let(:auth_source_id) { 'some_ldap' }
      let(:auth_source) { FactoryGirl.create :auth_source, name: auth_source_id }

      context 'ID' do
        before do
          parameters[:_links] = {
            authSource: {
              href: "/api/v3/auth_sources/#{auth_source.id}"
            }
          }
        end

        it 'creates the user with the given auth_source ID' 


        it_behaves_like 'represents the created user'
      end

      context 'name' do
        before do
          parameters[:_links] = {
            authSource: {
              href: "/api/v3/auth_sources/#{auth_source.name}"
            }
          }
        end

        it 'creates the user with the given auth_source ID' 


        it_behaves_like 'represents the created user'
      end

      context 'invalid identifier' do
        before do
          parameters[:_links] = {
            authSource: {
              href: "/api/v3/auth_sources/foobar"
            }
          }
        end

        it 'returns an error for the authSource attribute' 

      end
    end

    context 'with identity_url' do
      let(:identity_url) { 'google:3289272389298' }

      before do
        parameters[:identityUrl] = identity_url
      end

      it 'creates the user with the given identity_url' 


      it_behaves_like 'represents the created user'
    end

    context 'with password' do
      let(:password) { 'admin!admin!' }

      before do
        parameters[:password] = password
      end

      it 'returns the represented user' 


      it_behaves_like 'represents the created user'

      context 'empty password' do
        let(:password) { '' }

        it 'marks the password missing and too short' 

      end
    end
  end

  describe 'invited status' do
    let(:status) { 'invited' }
    let(:invitation_request) {
      {
        status: status,
        email: 'foo@example.org'
      }
    }

    describe 'invitation successful' do
      before do
        expect(OpenProject::Notifications).to receive(:send) do |event, _|
          expect(event).to eq 'user_invited'
        end
      end

      context 'only mail set' do
        let(:parameters) { invitation_request }

        it_behaves_like 'represents the created user',
                        firstName: 'foo',
                        lastName: '@example.org'

        it 'sets the other attributes' 

      end

      context 'mail and name set' do
        let(:parameters) { invitation_request.merge(firstName: 'First', lastName: 'Last') }

        it_behaves_like 'represents the created user'
      end
    end

    context 'missing email' do
      let(:parameters) { { status: status } }

      it 'marks the mail as missing' 

    end
  end

  describe 'invalid status' do
    let(:parameters) { { status: 'blablu' } }

    it 'returns an erroneous response' 

  end

  describe 'unauthorized user' do
    let(:user) { FactoryGirl.build(:user) }
    let(:parameters) { { status: 'invited', email: 'foo@example.org' } }

    it 'returns an erroneous response' 

  end
end


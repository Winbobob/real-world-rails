#
# Copyright (C) 2011 Instructure, Inc.
#
# This file is part of Canvas.
#
# Canvas is free software: you can redistribute it and/or modify it under
# the terms of the GNU Affero General Public License as published by the Free
# Software Foundation, version 3 of the License.
#
# Canvas is distributed in the hope that it will be useful, but WITHOUT ANY
# WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR
# A PARTICULAR PURPOSE. See the GNU Affero General Public License for more
# details.
#
# You should have received a copy of the GNU Affero General Public License along
# with this program. If not, see <http://www.gnu.org/licenses/>.
#

require File.expand_path(File.dirname(__FILE__) + '/../api_spec_helper')

describe DeveloperKeysController, type: :request do
  let(:sa_id) { Account.site_admin.id }

  describe "GET 'index'" do
    it 'should require authorization' 


    it 'should have the default developer key' 


    it 'should return the list of developer keys' 


    it 'should only include a subset of attributes if inherited is set' 


    it 'does not include `test_cluster_only` by default' 


    it 'does include `test_cluster_only` when enabled' 


    describe 'developer key account bindings' do
      specs_require_sharding

      context 'when context is site admin' do
        it 'includes the site admin binding for the key' 

      end

      context 'when context is not site admin' do
        let(:root_account) { account_model }

        it 'includes the site admin binding if it is set' 

      end
    end
  end

  describe "POST 'create'" do
    it 'should require authorization' 


    it 'should create a new developer key' 

  end

  describe "PUT 'update'" do
    it 'should require authorization' 



    it 'should update an existing developer key' 

  end

  describe "DELETE 'destroy'" do
    it 'should require authorization' 


    it 'should delete an existing developer key' 

  end


  def admin_session
    account_admin_user(account: Account.site_admin)
  end

  def create_call
    admin_session
    post_hash = { developer_key: { name: 'cool tool', icon_url: '' } }
    # make sure this key is created
    DeveloperKey.default
    json = api_call(:post, "/api/v1/accounts/#{sa_id}/developer_keys.json", {
      controller: 'developer_keys',
      action: 'create',
      format: 'json',
      account_id: sa_id.to_s
    }, post_hash)

    expect(DeveloperKey.count).to eq 2
    confirm_valid_key_in_json([json], DeveloperKey.last)
  end

  def update_call
    admin_session
    key = DeveloperKey.create!
    post_hash = { developer_key: { name: 'cool tool' } }
    json = api_call(:put, "/api/v1/developer_keys/#{key.id}.json", {
      controller: 'developer_keys',
      action: 'update',
      format: 'json',
      id: key.id.to_s
    }, post_hash)

    key.reload
    confirm_valid_key_in_json([json], key)
  end

  def destroy_call
    admin_session
    key = DeveloperKey.create!()
    api_call(:delete, "/api/v1/developer_keys/#{key.id}.json", {
      controller: 'developer_keys',
      action: 'destroy',
      format: 'json',
      id: key.id.to_s
    })

    expect(DeveloperKey.where(id: key).first).to be_deleted
  end

  def unauthorized_api_call(*args)
    raw_api_call(*args)
    expect(response.code).to eq "401"
  end

  def confirm_valid_key_in_json(json, key)
    json.map! do |hash|
      hash.keep_if {|k, _| ['id', 'icon_url', 'name'].include?(k)}
    end

    expect(json.include?(key_to_hash(key))).to be true
  end

  def key_to_hash(key)
    {
      'id' => key.global_id,
      'icon_url' => key.icon_url,
      'name' => key.name
    }
  end
end


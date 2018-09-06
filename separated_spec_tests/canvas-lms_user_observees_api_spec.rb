#
# Copyright (C) 2011 - 2015 Instructure, Inc.
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
require File.expand_path(File.dirname(__FILE__) + '/../../sharding_spec_helper.rb')

describe UserObserveesController, type: :request do
  let_once(:parent)             { user_with_pseudonym(name: 'Parent Smith', active_all: true) }
  let_once(:student)            { student_pseudonym.user }
  let_once(:student_pseudonym)  { user_with_pseudonym(name: 'Child Smith', active_all: true); @pseudonym }
  let_once(:student2)           { student2_pseudonym.user }
  let_once(:student2_pseudonym) { user_with_pseudonym(name: 'Another Smith', active_all: true); @pseudonym }
  let_once(:allowed_admin) do
    a = account_admin_user_with_role_changes(active_all: true, role_changes: {manage_user_observers: true})
    pseudonym(a)
    a
  end
  let_once(:multi_admin) do
    a = account_admin_user_with_role_changes(active_all: true, role_changes: {manage_user_observers: true})
    pseudonym(a)
    account_admin_user_with_role_changes(active_all: true, user: a, account: external_account, role_changes: {manage_user_observers: true})
    pseudonym(a, account: external_account)
    a
  end
  let(:disallowed_admin) do
    a = account_admin_user_with_role_changes(active_all: true, role_changes: {manage_user_observers: false})
    pseudonym(a)
    a
  end

  let_once(:external_account)           { account_model(name: 'External Account') }
  let_once(:external_parent)            { user_with_pseudonym(name: 'Parent External', active_all: true, account: external_account) }
  let_once(:external_student)           { external_student_pseudonym.user }
  let_once(:external_student_pseudonym) { user_with_pseudonym(name: 'Child External', active_all: true, account: external_account); @pseudonym }
  let_once(:external_allowed_admin) do
    a = account_admin_user_with_role_changes(active_all: true, role_changes: {manage_user_observers: true})
    pseudonym(a, account: external_account)
    a
  end
  let(:external_disallowed_admin) do
    a = account_admin_user_with_role_changes(active_all: true, role_changes: {manage_user_observers: false})
    pseudonym(a, account: external_account)
    a
  end

  let_once(:multi_student) do
    u = user_with_pseudonym(name: 'Child Multi', active_all: true)
    pseudonym(u, account: external_account)
    u
  end
  let_once(:multi_parent) do
    u = user_with_pseudonym(name: 'Parent Multi', active_all: true)
    pseudonym(u, account: external_account)
    u
  end

  let(:params) { { controller: 'user_observees', format: 'json' } }

  def index_call(opts={})
    json = raw_index_call(opts)
    return nil if opts[:expected_status]
    json.map{|o| o['id'] }.sort
  end
  def raw_index_call(opts={})
    params[:user_id] = opts[:user_id] || parent.id
    if opts[:page]
      params.merge!(per_page: 1, page: opts[:page])
      page = "?per_page=1&page=#{opts[:page]}"
    end

    if(opts[:avatars])
      params.merge!(include: ["avatar_url"])
    end
    json = api_call_as_user(
        opts[:api_user] || allowed_admin,
        :get,
        "/api/v1/users/#{params[:user_id]}/observees#{page}",
        params.merge(action: 'index'),
        {},
        {},
        { expected_status: opts[:expected_status] || 200, domain_root_account: opts[:domain_root_account] || Account.default },
    )
    json
  end

  def create_call(data, opts={})
    params[:user_id] = opts[:user_id] || parent.id

    json = api_call_as_user(
      opts[:api_user] || allowed_admin,
      :post,
      "/api/v1/users/#{params[:user_id]}/observees",
      params.merge(action: 'create'),
      data,
      {},
      { expected_status: opts[:expected_status] || 200, domain_root_account: opts[:domain_root_account] || Account.default },
    )
    return nil if opts[:expected_status]
    json['id']
  end

  def show_call(opts={})
    params[:user_id] = opts[:user_id] || parent.id
    params[:observee_id] = opts[:observee_id] || student.id

    json = api_call_as_user(
      opts[:api_user] || allowed_admin,
      :get,
      "/api/v1/users/#{params[:user_id]}/observees/#{params[:observee_id]}",
      params.merge(action: 'show'),
      {},
      {},
      { expected_status: opts[:expected_status] || 200, domain_root_account: opts[:domain_root_account] || Account.default },
    )
    return nil if opts[:expected_status]
    json['id']
  end

  def update_call(opts={})
    params[:user_id] = opts[:user_id] || parent.id
    params[:observee_id] = opts[:observee_id] || student.id

    json = api_call_as_user(
      opts[:api_user] || allowed_admin,
      :put,
      "/api/v1/users/#{params[:user_id]}/observees/#{params[:observee_id]}",
      params.merge(action: 'update'),
      opts.slice(:root_account_id),
      {},
      { expected_status: opts[:expected_status] || 200, domain_root_account: opts[:domain_root_account] || Account.default },
    )
    return nil if opts[:expected_status]
    json['id']
  end

  def delete_call(opts={})
    params[:user_id] = opts[:user_id] || parent.id
    params[:observee_id] = opts[:observee_id] || student.id
    json = api_call_as_user(
      opts[:api_user] || allowed_admin,
      :delete,
      "/api/v1/users/#{params[:user_id]}/observees/#{params[:observee_id]}",
      params.merge(action: 'destroy'),
      {},
      {},
      { expected_status: opts[:expected_status] || 200, domain_root_account: opts[:domain_root_account] || Account.default },
    )
    return nil if opts[:expected_status]
    json['id']
  end

  context 'GET #index' do
    specs_require_sharding
    it 'should list observees' 


    it 'should list observees (for self managed users)' 


    it 'should list observees (for external accounts)' 


    it 'should paginate' 


    it 'should not include deleted observers' 


    it 'should not accept an invalid user' 


    it 'should not allow admins from an external account' 


    it 'should not allow unauthorized admins' 


    it 'should return avatar if avatar service enabled on account' 


    it 'should return avatar if avatar service enabled on account when called from shard with avatars disabled' 


    it "should only return linked root accounts the admin has rights for" 

  end

  context 'POST #create' do
    it 'should add an observee, given credentials' 


    it 'should add an observee, given valid credentials (for self managed users)' 


    it 'should add an observee, given valid credentails (for external accounts)' 


    it 'should not add an observee, given bad credentials' 


    it 'should not add an observee from an external account' 


    it 'should not accept an invalid user' 


    it 'should not allow admins from and external account' 


    it 'should not allow unauthorized admins' 


    it 'should not allow a user to observe oneself' 

  end

  context 'GET #show' do
    it 'should show an observee' 


    it 'should show an observee (for self managed users)' 


    it 'should show an observee (for external accounts)' 


    it 'should not accept an invalid user' 


    it 'should not accept a non-observed user' 


    it 'should not allow admins from an external account' 


    it 'should not allow unauthorized admins' 

  end

  context 'PUT #update' do
    it 'should add an observee by id' 


    it 'should not error if the observee already exists' 


    it 'should add an observee by id (for external accounts)' 


    it 'should not accept an invalid user' 


    it 'should not accept an invalid observee' 


    it 'should not accept an observee from an external account' 


    it 'should not allow admins from an external account' 


    it 'should not allow self managed users' 


    it 'should not allow unauthorized admins' 


    context "multiple root accounts" do
      it "should add a link for for the domain root account if not specified" 


      it "should only add a link to one root account if specified" 


      it "should add a link for each associated root account if specified" 


      it "should only add a link for the commonly associated root accounts" 


      it "should only add a link for the commonly associated root accounts the admin has rights for" 

    end
  end

  context 'DELETE #destroy' do
    it 'should remove an observee by id' 


    it 'should remove an observee by id (for external accounts)' 


    it 'should not succeed if the observee is not found' 


    it 'should not accept an invalid user' 


    it 'should not accept an invalid observee' 


    it 'should not allow admins from an external account' 


    it 'should not allow unauthorized admins' 


    it 'should allow observer to remove observee' 

  end

    context "Add observer by token" do
      shared_examples "handle_observees_by_auth_token" do
        it 'should add an observee, given a valid access token' 


        it 'should not add an observee, given an invalid access token' 

      end

      context "with sharding" do
        specs_require_sharding
        before :each do
          @shard2.activate do
            @token_student = user_with_pseudonym(name: "Sharded Student", active_all: true)
          end
        end
        include_examples "handle_observees_by_auth_token"
      end

      context "without sharding" do
        before :once do
          @token_student = user_with_pseudonym(name: "Sameshard Student", active_all: true)
        end
        include_examples "handle_observees_by_auth_token"
      end
    end

end


require 'spec_helper_min'
require 'support/helpers'
require 'factories/carto_visualizations'
require 'base64'

describe Carto::Api::ApiKeysController do
  include CartoDB::Factories
  include HelperMethods

  def response_grants_should_include_request_permissions(reponse_grants, table_permissions)
    table_permissions.each do |stp|
      response_tables = reponse_grants.find { |grant| grant[:type] == 'database' }[:tables]
      response_permissions_for_table =
        response_tables.find { |rtp| rtp[:schema] == stp[:schema] && rtp[:name] == stp[:name] }[:permissions]
      response_permissions_for_table.sort.should eq stp[:permissions].sort
    end
  end

  def json_headers_for_key(key)
    json_headers_with_auth(key.user.username, key.token)
  end

  def json_headers_with_auth(username, token)
    http_json_headers.merge(
      'Authorization' => 'Basic ' + Base64.strict_encode64("#{username}:#{token}")
    )
  end

  def empty_grants
    [{ type: "apis", apis: [] }]
  end

  def public_api_key
    @carto_user.api_keys.find(&:default_public?)
  end

  def regular_api_key
    @carto_user.reload.api_keys.find(&:regular?)
  end

  def empty_payload
    {
      name: 'wadus',
      grants: empty_grants
    }
  end

  let(:create_payload) do
    {
      name: 'wadus',
      grants: [
        {
          type: "apis",
          apis: []
        },
        {
          type: "database",
          tables: [
            {
              schema: @carto_user.database_schema,
              name: @table1.name,
              permissions: []
            }
          ]
        }
      ]
    }
  end

  before(:all) do
    @user = FactoryGirl.create(:valid_user)
    @carto_user = Carto::User.find(@user.id)
    @other_user = FactoryGirl.create(:valid_user)
    @table1 = create_table(user_id: @carto_user.id)
    @table2 = create_table(user_id: @carto_user.id)
  end

  after(:all) do
    @table2.destroy
    @table1.destroy
    @user.destroy
  end

  after(:each) do
    @carto_user.api_keys.where(type: Carto::ApiKey::TYPE_REGULAR).each(&:destroy)
  end

  def generate_api_key_url(req_params, name: nil)
    name ? api_key_url(req_params.merge(id: name)) : api_keys_url(req_params)
  end

  def user_req_params(user, token = nil)
    { user_domain: user.username, api_key: token || user.api_key }
  end

  describe '#authorization' do
    shared_examples 'unauthorized' do
      before(:all) do
        @api_key = FactoryGirl.create(:api_key_apis, user: @unauthorized_user)
      end

      after(:all) do
        @api_key.destroy
      end

      it 'to create api keys' 


      it 'to destroy api keys' 


      it 'to regenerate api keys' 


      it 'to show api keys' 


      it 'to list api keys' 

    end

    describe 'without engine_enabled' do
      before(:all) do
        @unauthorized_user = Carto::User.find(FactoryGirl.create(:valid_user, engine_enabled: false).id)
      end

      after(:all) do
        ::User[@unauthorized_user.id].destroy
      end

      it_behaves_like 'unauthorized'
    end
  end

  shared_examples 'authorized' do
    describe '#create' do
      it 'creates a new API key' 


      it 'creates allows empty apis grants' 


      it 'fails if grants is not a json array' 


      it 'fails if permissions contains not valid entries' 


      it 'fails if database does not exist' 


      it 'fails if schema does not exist' 


      it 'fails if there\'s already an apikey with given name' 

    end

    describe '#destroy' do
      it 'destroys the API key' 


      it 'returns 403 if API key is master or default public' 


      it 'returns 404 if API key is not a uuid or it doesn\'t exist' 


      it 'returns 404 if the API key doesn\'t belong to that user' 

    end

    describe '#regenerate' do
      before(:each) do
        @api_key = FactoryGirl.create(:api_key_apis, user_id: @user.id)
      end

      it 'regenerates the token' 


      it 'regenerates master tokens' 

    end

    describe '#show' do
      it 'returns requested API key' 


      it 'returns 404 if the API key does not exist' 


      it 'returns 404 for internal api keys' 


      it 'returns 404 if the API key does not belong to the user' 

    end

    describe '#index' do
      before(:all) do
        @user_index = FactoryGirl.create(:valid_user)
        @carto_user_index = Carto::User.find(@user_index.id)

        @apikeys = @carto_user_index.api_keys.order(:updated_at).all.to_a
        3.times { @apikeys << FactoryGirl.create(:api_key_apis, user_id: @user_index.id) }
        @apikeys << FactoryGirl.create(:oauth_api_key, user_id: @user_index.id)
      end

      it 'does not include internal keys' 


      it 'should come master first, default type second and then regular' 


      it 'paginates correctly' 


      it 'returns the list of master and default API key for a given user' 


      it 'validates order param' 

    end
  end

  describe 'with header auth' do
    def auth_user(u)
      @auth_user = u
    end

    def auth_headers
      json_headers_with_auth(@auth_user.username, @auth_user.api_key)
    end

    def auth_params
      { user_domain: @auth_user.username }
    end

    it_behaves_like 'authorized'
  end

  describe 'with api_key auth' do
    def auth_user(u)
      @auth_user = u
    end

    def auth_headers
      http_json_headers
    end

    def auth_params
      { user_domain: @auth_user.username, api_key: @auth_user.api_key }
    end

    it_behaves_like 'authorized'
  end

  describe 'with cookie auth' do
    def auth_user(u)
      @auth_user = u
      host! "#{u.username}.localhost.lan"
      login_as(u, scope: u.username)
    end

    def auth_headers
      http_json_headers
    end

    def auth_params
      {}
    end

    it_behaves_like 'authorized'
  end

  describe 'non-master keys' do
    before(:each) do
      @master_api_key = @carto_user.api_keys.master.first
      @carto_user.api_keys.create_regular_key!(name: 'key1', grants: empty_grants)
    end

    let(:header_params) { { user_domain: @carto_user.username } }

    describe '#create' do
      it 'does not allow default_public api keys' 


      it 'does not allow regular api_keys' 

    end

    describe '#destroy' do
      it 'does not allow default_public api keys' 


      it 'does not allow regular api_keys' 

    end

    describe '#regenerate_token' do
      it 'does not allow default_public api keys' 


      it 'does not allow regular api_keys' 

    end

    describe '#index' do
      it 'shows only given api with default_public api keys' 


      it 'shows only given api with regular api keys' 


      it 'with cookie and invalid api key shows everything' 

    end

    describe '#show' do
      it 'shows given public api_key if authenticated with it' 


      it 'shows given regular api_key if authenticated with it' 


      it 'returns 404 if showing an api key different than the authenticated (public) one' 


      it 'returns 404 if showing an api key different than the authenticated (regular) one' 

    end

    describe 'with header auth' do
      it 'creates api_key' 


      it 'destroys the API key' 


      it 'regenerates the token' 


      it 'returns requested API key' 


      it 'returns API key list' 

    end

    describe 'without header auth fails and does not' do
      it 'create api_key' 


      it 'destroy the API key' 


      it 'regenerate the token' 


      it 'return requested API key' 


      it 'return API key list' 

    end
  end

  describe 'query param and special permissions' do
    before :each do
      @carto_user.api_keys.create_regular_key!(name: 'key1', grants: empty_grants)
    end

    describe '#index' do
      it 'shows only given api with default_public api keys' 


      it 'shows only given api with regular api keys' 

    end

    describe '#show' do
      it 'shows given public api_key if authenticated with it' 


      it 'shows given regular api_key if authenticated with it' 


      it 'returns 404 if showing an api key different than the authenticated (public) one' 


      it 'returns 404 if showing an api key different than the authenticated (regular) one' 

    end
  end
end


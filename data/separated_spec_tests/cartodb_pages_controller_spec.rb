# encoding: utf-8
require_relative '../../spec_helper'
require_relative '../../../app/controllers/admin/pages_controller'
require_relative '../../factories/organizations_contexts'
require_relative '../../factories/carto_visualizations'

def app
  CartoDB::Application.new
end #app

describe Admin::PagesController do
  include Rack::Test::Methods
  include Warden::Test::Helpers

  JSON_HEADER = {'CONTENT_TYPE' => 'application/json'}

  before(:all) do

    @non_org_user_name = 'development'

    @org_name = 'foobar'
    @org_user_name = 'foo'

    @other_org_user_name = 'other'

    @belongs_to_org = true
    @user_org = true
  end

  describe '#index' do
    before(:each) do
      host! "#{@org_name}.localhost.lan"
    end

    it 'returns 404 if user does not belongs to host organization' 


    it 'returns 200 if it is an org user and belongs to host organization' 


    it 'redirects_to dashboard if organization user is logged in' 


    it 'redirects if it is an org user but gets called without organization' 


    it 'returns 404 if it is an org user but does NOT belong to host organization' 


    it 'returns 404 if user does NOT exist' 


    it 'redirects to user feed home if current user and current viewer are different' 


    it 'redirects to user feed if not logged in' 


    it 'redirects to local login page if no user is specified and Central is not enabled' 


    it 'redirects to Central login page if no user is specified and Central is enabled' 


    it 'redirects and loads the dashboard if the user is logged in' 


    it 'extracts username from redirection for dashboard with subdomainless' 


    it 'redirects to login without login' 

  end

  describe '#explore' do
    before(:each) do
      host! "#{@org_name}.localhost.lan"
    end

    it 'should go to explore page' 


    it 'should go to explore search page' 


    it 'should go to explore search page with a query variable' 

  end

  describe '#sitemap' do
    include Carto::Factories::Visualizations
    it 'should return 404 if no user or organization is provided' 


    describe 'for organizations' do
      include_context 'organization with users helper'

      before(:each) do
        host! "#{@carto_organization.name}.localhost.lan:#{Cartodb.config[:http_port]}"
      end

      it 'returns an empty body if there are not visualizations' 


      it 'returns public visualizations' 

    end

    describe 'for users' do
      include_context 'users helper'

      before(:each) do
        host! "#{@carto_user1.username}.localhost.lan:#{Cartodb.config[:http_port]}"
      end

      it 'returns public visualizations' 

    end
  end

  def mock_explore_feature_flag
    anyuser = prepare_user('anyuser')
    ::User.any_instance.stubs(:has_feature_flag?)
                          .with('explore_site')
                          .returns(true)
    ::User.stubs(:where).returns(anyuser)
    anyuser.stubs(:first).returns(anyuser)
    anyuser
  end

  def prepare_user(user_name, org_user=false, belongs_to_org=false)
    user = create_user(
      username: user_name,
      email:    "#{user_name}@example.com",
      password: 'longer_than_MIN_PASSWORD_LENGTH',
      fake_user: true,
      quota_in_bytes: 10000000
    )

    user.stubs(:username => user_name, :organization_user? => org_user)

    if org_user
      org = mock
      org.stubs(name: @org_name)
      user.stubs(organization: org)
      Organization.stubs(:where).with(name: @org_name).returns([org])
      Organization.stubs(:where).with(name: @org_user_name).returns([org])
      ::User.any_instance.stubs(:belongs_to_organization?).with(org).returns(belongs_to_org)
    end

    user
  end

end


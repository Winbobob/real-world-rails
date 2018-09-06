# encoding: utf-8
require_relative '../../acceptance_helper'

feature "Superadmin's organization API" do
  before(:all) do
    # Capybara.current_driver = :rack_test
    @organization1 = create_organization_with_users
    @organization2 = create_organization_with_users
    @org_atts = @organization1.values
  end

  scenario "Http auth is needed" do
    post_json superadmin_users_path, { :format => "json" } do |response|
      response.status.should == 401
    end
  end

  scenario "organization create fail" do
    pending "Exception handling isn' implemented yet"
  end

  scenario "organization create success" do
    @org_atts = FactoryGirl.build(:organization).values
    post_json superadmin_organizations_path, { organization: @org_atts }, superadmin_headers do |response|
      response.status.should == 201
      response.body[:name].should == @org_atts[:name]

      # Double check that the organization has been created properly
      organization = Organization.filter(:name => @org_atts[:name]).first
      organization.should be_present
      organization.id.should == response.body[:id]
      organization.destroy
    end
  end

  scenario "organization with owner creation success" do
    org_atts = FactoryGirl.build(:organization).values
    user = FactoryGirl.create(:user_with_private_tables)
    org_atts[:owner_id] = user.id

    post_json superadmin_organizations_path, { organization: org_atts }, superadmin_headers do |response|
      response.status.should == 201
      response.body[:name].should == org_atts[:name]

      # Double check that the organization has been created properly
      organization = Organization.filter(name: org_atts[:name]).first
      organization.should be_present
      organization.id.should == response.body[:id]

      organization.owner_id.should == user.id
      user.reload
      user.organization_id.should == organization.id
      organization.destroy_cascade
    end
  end

  scenario "organization with owner creation failure" do
    org_atts = FactoryGirl.build(:organization).values
    user = FactoryGirl.create(:user_with_private_tables)
    org_atts[:owner_id] = user.id

    simulated_error = StandardError.new('promote_user_to_admin failure simulation')
    CartoDB::UserOrganization.any_instance.stubs(:promote_user_to_admin).raises(simulated_error)

    post_json superadmin_organizations_path, { organization: org_atts }, superadmin_headers do |response|
      response.status.should == 500

      Organization.filter(name: org_atts[:name]).first.should be_nil
      user.reload
      user.organization_id.should be_nil
    end
  end

  scenario "organization update fail" do
    pending "Exception handling isn' implemented yet"
  end

  scenario "organization update success" do
    put_json superadmin_organization_path(@organization1), { :organization => { :display_name => "Update Test", :map_view_quota => 800000 } }, superadmin_headers do |response|
      response.status.should == 204
    end
    organization = Organization[@organization1.id]
    organization.display_name.should == "Update Test"
    organization.map_view_quota.should == 800000
  end

  describe "organization delete success" do
    include_context 'organization with users helper'
    include TableSharing

    after(:all) do
      @organization_2.destroy
    end

    it 'destroys organizations (even with shared entities)' 

  end

  scenario "organization get info success" do
    get_json superadmin_organization_path(@organization1), {}, superadmin_headers do |response|
      response.status.should == 200
      response.body[:id].should == @organization1.id
    end
  end

  describe "GET /superadmin/organization" do

    it "gets all organizations" 

    it "gets overquota organizations" 

    it "returns geocoding and mapviews quotas and uses for all organizations" 

  end

  describe 'users destruction logic' do
    include_context 'organization with users helper'

    it 'blocks deletion of a user with shared entities' 

  end

  describe 'sharing users destruction logic' do
    include_context 'organization with users helper'

    it 'keeps a table shared with an user when that user is deleted' 

  end

  describe 'users with shares destruction logic' do
    include_context 'organization with users helper'

    it 'cleans sharing information when recipient user is deleted' 

  end

  private

  def superadmin_headers(user = Cartodb.config[:superadmin]["username"], password = Cartodb.config[:superadmin]["password"])
    {
      'HTTP_AUTHORIZATION' => ActionController::HttpAuthentication::Basic.encode_credentials(user, password),
      'HTTP_ACCEPT' => "application/json"
    }
  end
end


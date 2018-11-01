# encoding: utf-8

require_relative '../../../spec_helper'
require_relative '../../../../app/controllers/carto/api/organizations_controller'
require 'helpers/unique_names_helper'

describe Carto::Api::OrganizationsController do
  include_context 'organization with users helper'
  include UniqueNamesHelper
  include Rack::Test::Methods
  include Warden::Test::Helpers

  describe 'users unauthenticated behaviour' do

    it 'returns 401 for not logged users' 

  end

  describe 'users' do

    before(:all) do
      @org_user_3 = create_test_user(unique_name('user'), @organization)
      @group_1 = FactoryGirl.create(:random_group, display_name: 'g_1', organization: @carto_organization)
      @group_1.add_user(@org_user_1.username)
    end

    after(:all) do
      @group_1.destroy
      bypass_named_maps
      delete_user_data(@org_user_3)
      @org_user_3.destroy
    end

    before(:each) do
      login(@org_user_1)
    end

    # INFO: listing users though API is now needed for permission granting, for example
    it 'returns 200 for users requesting an organization that they are not owners of' 


    it 'returns organization users sorted by username' 


    it 'returns organization users paged with totals' 


    it 'returns users matching username query' 


    it 'returns users matching email query' 


    it 'return users with matching group_id' 


    it 'return users with matching email and group_id' 


    it 'does not return db size (slow)' 


    it 'validates order param' 

  end

end


# encoding: utf-8
require_relative '../spec_helper'
require_relative '../../app/controllers/visualizations_controller_helper'

describe VisualizationsControllerHelper do
  include VisualizationsControllerHelper
  include CartoDB::Factories
  include Carto::Factories::Visualizations

  before(:all) do
    @organization = create_organization_with_users
    @org_user = Carto::User.find(@organization.users.first.id)
    @org_user_shared = Carto::User.find(@organization.users.last.id)
    @free_user = FactoryGirl.create(:carto_user)

    @free_map, @free_table, @free_table_visualization, @free_visualization = create_full_visualization(@free_user)
    @org_map, @org_table, @org_table_visualization, @org_visualization = create_full_visualization(@org_user)

    @free_visualization.name = 'free viz'
    @free_visualization.save
  end

  after(:all) do
    destroy_full_visualization(@org_map, @org_table, @org_table_visualization, @org_visualization)
    destroy_full_visualization(@map, @table, @table_visualization, @visualization)
  end

  def setup_for_user(user)
    user_request = mock
    user_request.stubs(:params).returns(user_domain: user.username)
    stubs(:request).returns(user_request)
  end

  describe '#free_user' do
    before(:each) do
      setup_for_user(@free_user)
    end

    describe '#derived_visualization' do
      it 'locates derived visualization by id' 


      it 'locates derived visualization by name' 


      it 'locates derived visualization by schema and id' 


      it 'locates derived visualization by schema and name' 


      it 'does locate derived visualization by another user and id' 


      it 'does not locate derived visualization by another user and name' 


      it 'does not locate derived visualization by another user and schema.name' 


      it 'does not locate derived visualization with incorrect schema' 

    end

    describe '#table_visualization' do
      it 'locates table visualization by id' 


      it 'locates table visualization by name' 


      it 'locates table visualization by schema and id' 


      it 'locates table visualization by schema and name' 


      it 'does locate table visualization by another user and id' 


      it 'does not locate table visualization by another user and name' 


      it 'does not locate table visualization by another user and schema.name' 


      it 'does not locate table visualization with incorrect schema' 

    end
  end

  describe '#org_user' do
    before(:each) do
      setup_for_user(@org_user)
    end

    describe '#derived_visualization' do
      it 'locates derived visualization by id' 


      it 'locates derived visualization by name' 


      it 'locates derived visualization by schema and id' 


      it 'locates derived visualization by schema and name' 


      it 'does locate derived visualization by another user and id' 


      it 'does not locate derived visualization by another user and name' 


      it 'does not locate derived visualization by another user and schema.name' 


      it 'does not locate derived visualization with incorrect schema' 

    end

    describe '#table_visualization' do
      it 'locates table visualization by id' 


      it 'locates table visualization by name' 


      it 'locates table visualization by schema and id' 


      it 'locates table visualization by schema and name' 


      it 'does locate table visualization by another user and id' 


      it 'does not locate table visualization by another user and name' 


      it 'does not locate table visualization by another user and schema.name' 


      it 'does not locate table visualization with incorrect schema' 

    end
  end

  describe '#org_shared' do
    before(:each) do
      setup_for_user(@org_user_shared)
    end

    describe '#derived_visualization' do
      it 'locates shared derived visualization by id' 


      it 'locates shared derived visualization by schema and id' 


      it 'locates shared derived visualization by schema and name' 


      it 'does locate shared derived visualization by another user and id' 


      it 'does not locate shared derived visualization by another user and name' 


      it 'does not locate shared derived visualization by another user and schema.name' 


      it 'does not locate shared derived visualization with incorrect schema' 

    end

    describe '#table_visualization' do
      it 'locates shared table visualization by id' 


      it 'locates shared table visualization by schema and id' 


      it 'locates shared table visualization by schema and name' 


      it 'does locate shared table visualization by another user and id' 


      it 'does not locate shared table visualization by another user and name' 


      it 'does not locate shared table visualization by another user and schema.name' 


      it 'does not locate shared table visualization with incorrect schema' 

    end
  end
end


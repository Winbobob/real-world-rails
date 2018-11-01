require File.dirname(__FILE__) + '/../../spec_helper'

describe Admins::ContentPartnersController do
  describe 'GET index' do
    before(:all) do
      load_foundation_cache
      @admin = User.gen(:username => 'admins_controllers_specs', :password => "password", :admin => true)
      @non_admin = User.find_by_admin(false)
      @cp_all_unpublished = ContentPartner.gen(:user => @non_admin)
      resource = Resource.gen(:content_partner_id => @cp_all_unpublished.id)
      HarvestEvent.gen(:resource_id => resource.id, :published_at => nil)
      HarvestEvent.gen(:resource_id => resource.id, :published_at => nil)
      @cp_latest_unpublished = ContentPartner.gen(:user => @non_admin)
      resource = Resource.gen(:content_partner_id => @cp_latest_unpublished.id)
      HarvestEvent.gen(:resource_id => resource.id)
      HarvestEvent.gen(:resource_id => resource.id, :published_at => nil)
      @partners ||= ContentPartner.all(:order => 'content_partners.full_name')
      @cp_latest_published ||= @partners.select{|cp| cp.full_name == 'IUCN'}.first
      @cp_no_harvests ||= @partners.select{|cp| cp.full_name == 'Biology of Aging'}.first
      @cp_no_resources ||= @partners.select{|cp| cp.full_name == 'Catalogue of Life'}.first
    end
    
    it 'should only allow access to EOL administrators' 

    
    it 'should instantiate content partners with default sort by partner name' 

    it 'should filter by name' 

    it 'should filter by never harvested' 

    it 'should filter by never published' 

    it 'should filter by latest harvest events that are unpublished' 

    it 'should filter by latest harvest events that are pending publish' 

    it 'should filter by latest harvest events that are published' 

    it 'should filter by partners that have no resources' 

  end

  describe 'GET notifications' do
    before(:all) do
      load_foundation_cache
      @admin = User.gen(:username => 'admins_controllers_specs', :password => "password", :admin => true)
      @non_admin = User.find_by_admin(false)
    end
    
    it 'should only allow access to EOL administrators' 

    it 'should render notifications view' 

  end

  describe 'POST notifications' do
    before(:all) do
      load_foundation_cache
      @admin = User.gen(:username => 'admins_controllers_specs', :password => "password", :admin => true)
      @non_admin = User.find_by_admin(false)
    end
    
    it 'should only allow access to EOL administrators' 

    it "should send statistics reminder notification" 

  end

  describe 'GET statistics' do
    before(:all) do
      load_foundation_cache
      @admin = User.gen(:username => 'admins_controllers_specs', :password => "password", :admin => true)
      @non_admin = User.find_by_admin(false)
    end
    
    it 'should only allow access to EOL administrators' 

    it 'should render statistics view' 

    it 'should filter content partners on first published date' 

  end

end


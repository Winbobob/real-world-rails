require './spec/vcloud_director/spec_helper.rb'
require 'minitest/autorun'
require './lib/fog/vcloud_director/requests/compute/instantiate_vapp_template.rb'

describe Fog::Compute::VcloudDirector::Real do
  before do
    Fog.unmock!
  end
  

  let(:xml) do
    service = Fog::Compute::VcloudDirector.new(
    {
      :vcloud_director_host             => 'vcloud-director-host',
      :vcloud_director_password         => 'vcloud_director_password',
      :vcloud_director_username         => 'vcd_user@vcd_org_name',
    }
    
    
    )

    params = {
      :description => 'MY VAPP',
      :vdc_uri => 'http://vcloud/api/vdc/123456789',
      :network_uri => 'http://vcloud/api/network/123456789',
      :template_uri => 'http://vcloud/api/vapptemplate/123456789',
      :vapp_name => 'http://vcloud/api/vapp/123456789',
      :network_name => 'NETWORK',
      :vms_config => [
          {
            :name => 'VM1',
            :href => 'http://vcloud/api/vm/12345',
            :storage_profile_href => 'http://vcloud/storage/123456789'
          },
          {
            :name => 'VM2',
            :href => 'http://vcloud/api/vm/12345',
            :storage_profile_href => 'http://vcloud/storage/123456789'
          }
         ]
    }
  
    
    Nokogiri::XML(service.send(:generate_instantiate_vapp_template_request,params))
  end  

  
  
  it "Generates InstantiateVAppTemplateParams" 

  
  it "Has a valid Network" 

  
  it "Has valid source VAPP info" 

  
  it "Has valid source VM info" 

  
    
  after do
    Fog.mock!
  end

  
end


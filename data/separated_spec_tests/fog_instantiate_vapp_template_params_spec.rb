require './spec/vcloud_director/spec_helper.rb'
require 'minitest/autorun'
require 'nokogiri'
require './lib/fog/vcloud_director/generators/compute/instantiate_vapp_template_params.rb'

describe Fog::Generators::Compute::VcloudDirector::InstantiateVappTemplateParams do
  
  let(:xml) do 
    params = {
      :name => 'VAPP_NAME',
      :Description => 'MY VAPP',
      :InstantiationParams => {
        :NetworkConfig => [
          {
            :networkName => 'NETWORK',
            :networkHref => 'http://vcloud/api/network/123456789',
            :fenceMode => 'bridged'
          }
        ]
      },
      :Source => 'http://vcloud/vapp_template/1234',
      :source_vms => [
        {
          :name => 'VM1',
          :href => 'http://vcloud/api/vm/12345',
          :StorageProfileHref => 'http://vcloud/storage/123456789'
        },
        {
          :name => 'VM2',
          :href => 'http://vcloud/api/vm/12345',
          :StorageProfileHref => 'http://vcloud/storage/123456789'
        }
      ]
      
    }

    output = Fog::Generators::Compute::VcloudDirector::InstantiateVappTemplateParams.new(params).generate_xml
    Nokogiri::XML(output)
  end
  
  it "Generates InstantiateVAppTemplateParams" 

  
  it "Has a valid Network" 

  
  it "Has valid source VAPP info" 

  
  it "Has valid source VM info" 

  
  it "Allows New VM Parameters" 

  
end


require_relative '../../spec_helper'

module Aws
  module Plugins
    describe GlobalConfiguration do

      GlobalConfigClient = ApiHelper.sample_service::Client
      GlobalConfigClient.instance_variable_set("@identifier", :svc)
      GlobalConfigClient.add_plugin(Class.new(Seahorse::Client::Plugin) do
        option(:endpoint, 'https://endpoint.com')
        option(:property, 'plugin-default')
      end)

      before(:each) do
        Aws.config.clear
        Aws.config[:region] = 'us-east-1'
        Aws.config[:credentials] = Credentials.new('akid', 'secret')
      end

      before(:all) do
        GlobalConfiguration.add_identifier(:svc)
      end

      after(:all) do
        Aws.config.clear
        GlobalConfiguration.identifiers.delete(:svc)
      end

      it 'gives priority to Aws.config over plugin defaults' 


      it 'gives priority to Aws.config[:svc] over Aws.config' 


      it 'gives priority to constructor options over Aws.config' 


    end
  end
end


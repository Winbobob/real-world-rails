# encoding: utf-8

require_relative '../../../spec_helper'

module CartoDB
  def self.clear_internal_cache
    remove_class_variable(:@@request_host) if defined?(@@request_host)
    remove_class_variable(:@@hostname) if defined?(@@hostname)
    remove_class_variable(:@@http_port) if defined?(@@http_port)
    remove_class_variable(:@@https_port) if defined?(@@http_ports)
    remove_class_variable(:@@session_domain) if defined?(@@session_domain)
    remove_class_variable(:@@domain) if defined?(@@domain)
    remove_class_variable(:@@subdomainless_urls) if defined?(@@subdomainless_urls)
    remove_class_variable(:@@account_host) if defined?(@@account_host)
    remove_class_variable(:@@account_path) if defined?(@@account_path)
  end
end

describe Carto::Api::OembedController do

  after(:each) do
    CartoDB.clear_internal_cache
  end

  describe '#json_response_behaviour' do
    before(:each) do
      domain = '.test.local'
      @username = 'testuser'
      @orgname = 'testorg'
      @uuid = "00000000-0000-0000-0000-000000000000"
      @callback = 'callback'
      @uri = "/user/#{@username}/api/v1/oembed?url=http://#{@orgname}#{domain}/u/#{@username}/#{@uuid}"
    end

    it 'Returns JSONP if a callback is specified' 


    it 'Returns regular JSON  if a callback is not' 


    it 'Returns regular JSON  if a callback is not' 


    it 'Returns valid oembed url' 

  end
  describe '#private_url_methods_tests' do

    it 'Tests from_domainless_url()' 



    it 'Tests from_url()' 


    it 'Tests url_fields_from_fragments()' 


  end

end


# encoding: utf-8

require_relative '../../spec_helper'
require_relative '../../../spec/doubles/request'

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
    remove_class_variable(:@@data_library_path) if defined?(@@data_library_path)
  end
end

describe CartoDB do
  after(:each) do
    CartoDB.clear_internal_cache
  end

  describe '#url_methods' do

    it 'Tests extract_real_subdomain()' 


    it 'Tests extract_host_subdomain()' 


    it 'Tests extract_subdomain() and username_from_request()' 


    it 'Tests base_url()' 


    it 'tests base_url() without logged user' 


  end

  describe '#base_domain_from_request' do
    it 'extracts subdomain without domain based urls' 


    it 'extracts subdomain with subdomainless urls' 

  end
end


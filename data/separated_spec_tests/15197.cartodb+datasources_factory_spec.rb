# encoding: utf-8

require 'yaml'
require_relative '../../../../spec/rspec_configuration'

require_relative '../../lib/datasources'
require_relative '../doubles/user'
require 'spec_helper_min'

include CartoDB::Datasources

describe DatasourcesFactory do

  def get_config
    @config ||= YAML.load_file("#{File.dirname(__FILE__)}/../../../../config/app_config.yml")['defaults']
  end

  describe '#provider_instantiations' do
    it 'tests all available provider instantiations' 

  end

  describe '#customized_config?' do
    let(:twitter_datasource) { CartoDB::Datasources::Search::Twitter::DATASOURCE_NAME }

    before(:each) do
      @config = get_config
    end

    it 'returns false for a random user' 


    it 'returns true for a user with custom config' 


    it 'returns true for a user in an organization with custom config' 

  end
end


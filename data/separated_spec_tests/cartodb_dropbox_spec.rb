# encoding: utf-8

require 'yaml'
require_relative '../../lib/datasources'
require_relative '../doubles/user'

include CartoDB::Datasources

describe Url::Dropbox do

  def get_config
    @config ||= YAML.load_file("#{File.dirname(__FILE__)}/../../../../config/app_config.yml")['defaults']['oauth']['dropbox']
  end #get_config

  describe '#manual_test' do
    it 'with user interaction, tests the full oauth flow and lists files of an account' 

  end

end



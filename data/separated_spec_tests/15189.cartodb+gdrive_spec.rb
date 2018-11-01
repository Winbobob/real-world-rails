# encoding: utf-8

require_relative '../../../../spec/rspec_configuration'
require_relative '../../lib/datasources'
require_relative '../doubles/user'

include CartoDB::Datasources

describe Url::GDrive do

  def get_config
    {
      'application_name' => '',
      'client_id' => '',
      'client_secret' => '',
      'callback_url' => 'http://localhost/callback'
    }
  end #get_config

  describe '#filters' do
    it 'test that filter options work correctly' 

  end #run

end


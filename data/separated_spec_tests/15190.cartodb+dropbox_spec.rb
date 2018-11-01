# encoding: utf-8

require_relative '../../lib/datasources'
require_relative '../doubles/user'

include CartoDB::Datasources

describe Url::Dropbox do

  def get_config
    {
      'app_key' => '',
      'app_secret' => '',
      'callback_url' => ''
    }
  end #get_config

  describe '#filters' do
    it 'test that filter options work correctly' 

  end #run

end



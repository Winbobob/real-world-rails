# encoding: utf-8

require_relative '../../lib/datasources'
require_relative '../doubles/user'

include CartoDB::Datasources

describe Url::Box do
  def get_config
    {
      'box_host' => '',
      'application_name' => '',
      'client_id' => '',
      'client_secret' => '',
      'callback_url' => ''
    }
  end

  describe '#filters' do
    it 'test that filter sets correctly' 

  end
end


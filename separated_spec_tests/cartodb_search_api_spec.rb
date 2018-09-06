# encoding: utf-8
require_relative '../../twitter-search'
require_relative '../../../../spec/rspec_configuration'

include CartoDB::TwitterSearch

describe SearchAPI do
  describe '#config_and_params' do
    it 'checks correct params sent to config and as query payload' 


  end

  def data_from_file(filename)
    File.read(File.join(File.dirname(__FILE__), "../fixtures/#{filename}"))
  end
end



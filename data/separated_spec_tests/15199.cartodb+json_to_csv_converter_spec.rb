# encoding: utf-8
require_relative '../../twitter-search'
require_relative '../../../../spec/rspec_configuration'

include CartoDB::TwitterSearch

describe JSONToCSVConverter do
  describe '#conversion' do
    it 'checks conversion of fields' 


    it 'checks additional fields are added' 


    it 'check headers can be skiped' 

  end

  protected

  def json_data_from_file(filename, only_results=true)
    data = File.read(File.join(File.dirname(__FILE__), "../fixtures/#{filename}"))
    data = ::JSON.parse(data, symbolize_names: true)
    only_results ? data[:results] : data
  end

  def data_from_file(filename)
    File.read(File.join(File.dirname(__FILE__), "../fixtures/#{filename}"))
  end

  def terms_fixture
    { category_name: 'sample category', category_terms: 'term1 term2' }
  end
end


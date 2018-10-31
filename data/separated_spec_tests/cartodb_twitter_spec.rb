# encoding: utf-8

require_relative '../../lib/datasources'
require_relative '../doubles/organization'
require_relative '../doubles/user'
require_relative '../doubles/search_tweet'
require_relative '../doubles/data_import'
require_relative '../../../../lib/cartodb/logger'

include CartoDB::Datasources

describe Search::Twitter do

  def get_config
    {
      'auth_required' => false,
      'username'      => '',
      'password'      => '',
      'search_url'    => 'http://fakeurl.carto',
    }
  end

  before(:each) do
    Typhoeus::Expectation.clear
  end

  describe '#search' do
    it 'tests basic full search flow with streaming' 

  end

  protected

  def terms_fixture
    {
      categories: [
        {
          category: '1',
          terms:    ['carto']
        }
      ]
    }
  end

  def dates_fixture
    {
      dates: {
        fromDate: '2017-02-21',
        fromHour: '11',
        fromMin:  '45',
        toDate:   '2017-02-21',
        toHour:   '12',
        toMin:    '00'
      }
    }
  end

  def data_from_file(filename, fullpath=false)
    if fullpath
      File.read(filename)
    else
      File.read(File.join(File.dirname(__FILE__), "../fixtures/#{filename}"))
    end
  end

end


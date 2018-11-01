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
  end #get_config

  before(:each) do
    Typhoeus::Expectation.clear
  end

  describe '#filters' do
    it 'tests max and total results filters' 


    it 'tests category filters' 


    it 'tests search term cut if too many' 


    it 'tests search term cut if too big (even if amount is ok)' 



    it 'tests date filters' 


    it 'tests twitter search integration (without conversion to CSV)' 


    it 'tests stopping search if runs out of quota' 


    it 'tests user limits on datasource usage' 


    it 'checks terms sanitize method' 


  end

  protected

  def terms_fixture
    {
      categories: [
        {
          category: 'Category 1',
          terms:    ['uno', '@dos', '#tres']
        },
        {
          category: 'Category 2',
          terms:    ['aaa', 'bbb']
        }
      ]
    }
  end

  def dates_fixture
    {
      dates: {
        fromDate: '2014-03-03',
        fromHour: '13',
        fromMin:  '49',
        toDate:   '2014-03-04',
        toHour:   '11',
        toMin:    '59'
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


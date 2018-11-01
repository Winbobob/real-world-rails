# encoding: utf-8
require_relative '../sql_api.rb'
require_relative '../../../spec/rspec_configuration.rb'

module Cartodb; end

describe CartoDB::SQLApi do

  before(:each) do
    Cartodb.stubs(:config).returns(TEST_SQL_API_CONFIG)
  end

  describe '#fetch' do

    let(:api) { CartoDB::SQLApi.new(username: 'maloshumos') }

    it "returns an array of rows" 


    it "raises PermissionError when the table is private" 


    it "raises SQLError when the query is flawed" 


    it "handles gzipped output" 


  end #fetch


  def stub_api_request(code, response_file)
    response = File.open(path_to(response_file)).read
    Typhoeus.stub(/.*carto.com\/api\/v[12]/).and_return(
      Typhoeus::Response.new(code: code, body: response)
    )
  end # stub_api_request

  def path_to(filepath = '')
    File.expand_path(
      File.join(File.dirname(__FILE__), "../spec/fixtures/#{filepath}")
    )
  end #path_to

  TEST_SQL_API_CONFIG =  {:sql_api => {
      "private" => {
        "protocol" =>   'http',
        "domain" => 'carto.com',
        "endpoint" =>  '/api/v1/sql',
        "port" =>       8080
      },
      "public" => {
        "protocol" =>   'http',
        "domain" =>    'carto.com',
        "endpoint" =>   '/api/v2/sql',
        "port" =>       8080
      }
    }
  }

end # CartoDB::SQLApi


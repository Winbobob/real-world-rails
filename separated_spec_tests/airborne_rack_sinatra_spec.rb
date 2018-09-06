require 'json'
require 'sinatra'

class SampleApp < Sinatra::Application
  before do
    content_type 'application/json'
  end

  get '/' do
    { foo: 'bar' }.to_json
  end
end

Airborne.configure do |config|
  config.rack_app = SampleApp
end

describe 'rack app' do
  it 'should allow requests against a sinatra app' 


  it 'should ensure correct values from sinatra app' 


  it 'Should set json_body even when not using the airborne http requests' 


  it 'Should work with consecutive requests' 

end


require 'spec_helper'

describe 'client requester' do
  before do
    allow(RestClient).to receive(:send)
    RSpec::Mocks.space.proxy_for(self).remove_stub_if_present(:get)
  end

  after do
    allow(RestClient).to receive(:send).and_call_original
    Airborne.configure { |config| config.headers =  {} }
  end

  it 'should set :content_type to :json by default' 


  it 'should override headers with option[:headers]' 


  it 'should override headers with airborne config headers' 

end


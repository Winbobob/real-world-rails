require File.dirname(__FILE__) + '/../scenario_helper.rb'

feature ConfigController do

  before(:each) do
    Rails.cache.clear
    allow_any_instance_of(ConfigController).to receive(:country).and_return(nil)
    stub_request(:get, 'http://platform.controlshiftlabs.com/cached_url/currencies').to_return(body: "{\"rates\":{\"GBP\":1.1234}}")
  end

  let(:organization) {create(:organization, global_defaults: { currency: 'AUD' }) }

  it 'should respond with default settings for JSON request' 


  it 'should be able to handle a blank external request' 


  context 'no geoip' do
    context 'a specified country' do
      let(:organization) {create(:organization, global_defaults: { country: 'AU', currency: 'USD'}) }

      it 'should use the supplied country' 

    end

    it 'should default the country to US if none is supplied' 

  end
end


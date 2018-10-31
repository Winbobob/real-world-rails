require 'chefspec'

describe 'http_request::get' do
  let(:chef_run) { ChefSpec::ServerRunner.new(platform: 'ubuntu', version: '16.04').converge(described_recipe) }

  it 'gets a http_request with the default action' 


  it 'gets a http_request with an explicit action' 


  it 'gets a http_request with attributes' 


  it 'gets a http_request when specifying the identity attribute' 

end


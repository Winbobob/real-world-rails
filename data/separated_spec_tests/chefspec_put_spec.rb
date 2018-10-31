require 'chefspec'

describe 'http_request::put' do
  let(:chef_run) { ChefSpec::ServerRunner.new(platform: 'ubuntu', version: '16.04').converge(described_recipe) }

  it 'puts a http_request with an explicit action' 


  it 'puts a http_request with attributes' 


  it 'puts a http_request when specifying the identity attribute' 

end


require 'chefspec'

describe 'http_request::post' do
  let(:chef_run) { ChefSpec::ServerRunner.new(platform: 'ubuntu', version: '16.04').converge(described_recipe) }

  it 'posts a http_request with an explicit action' 


  it 'posts a http_request with attributes' 


  it 'posts a http_request when specifying the identity attribute' 

end


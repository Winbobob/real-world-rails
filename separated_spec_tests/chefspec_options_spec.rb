require 'chefspec'

describe 'http_request::options' do
  let(:chef_run) { ChefSpec::ServerRunner.new(platform: 'ubuntu', version: '16.04').converge(described_recipe) }

  it 'optionss a http_request with an explicit action' 


  it 'optionss a http_request with attributes' 


  it 'optionss a http_request when specifying the identity attribute' 

end


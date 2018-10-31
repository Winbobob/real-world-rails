require 'chefspec'

describe 'http_request::head' do
  let(:chef_run) { ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '18.04').converge(described_recipe) }

  it 'heads a http_request with an explicit action' 


  it 'heads a http_request with attributes' 


  it 'heads a http_request when specifying the identity attribute' 

end


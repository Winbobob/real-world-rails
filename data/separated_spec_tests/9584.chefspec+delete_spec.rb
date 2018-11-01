require 'chefspec'

describe 'http_request::delete' do
  let(:chef_run) { ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '18.04').converge(described_recipe) }

  it 'deletes a http_request with an explicit action' 


  it 'deletes a http_request with attributes' 


  it 'deletes a http_request when specifying the identity attribute' 

end


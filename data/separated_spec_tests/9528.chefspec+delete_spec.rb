require 'chefspec'

describe 'link::delete' do
  let(:chef_run) { ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '18.04').converge(described_recipe) }

  it 'deletes a link with an explicit action' 


  it 'deletes a link with attributes' 


  it 'deletes a link when specifying the identity attribute' 

end


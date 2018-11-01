require 'chefspec'

describe 'registry_key::create_if_missing' do
  let(:chef_run) do
    ChefSpec::SoloRunner.new(platform: 'windows', version: '2016')
                          .converge(described_recipe)
  end

  it 'creates a registry_key with an explicit action' 


  it 'creates a registry_key with attributes' 


  it 'creates a registry_key when specifying the identity attribute' 

end


require 'chefspec'

describe 'registry_key::delete' do
  let(:chef_run) do
    ChefSpec::SoloRunner.new(platform: 'windows', version: '2016')
                          .converge(described_recipe)
  end

  it 'deletes a registry_key with an explicit action' 


  it 'deletes a registry_key with attributes' 


  it 'deletes a registry_key when specifying the identity attribute' 

end


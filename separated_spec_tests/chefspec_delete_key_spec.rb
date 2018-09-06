require 'chefspec'

describe 'registry_key::delete_key' do
  let(:chef_run) do
    ChefSpec::ServerRunner.new(platform: 'windows', version: '2012R2')
                          .converge(described_recipe)
  end

  it 'delete_keyes a registry_key with an explicit action' 


  it 'delete_keyes a registry_key with attributes' 


  it 'delete_keyes a registry_key when specifying the identity attribute' 

end


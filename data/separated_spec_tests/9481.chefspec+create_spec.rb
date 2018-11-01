require 'chefspec'

describe 'user::create' do
  let(:chef_run) do
    ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '18.04')
                          .converge(described_recipe)
  end

  it 'creates a user with the default action' 


  it 'creates a user with an explicit action' 


  it 'creates a user with attributes' 


  it 'creates a user when specifying the identity attribute' 

end


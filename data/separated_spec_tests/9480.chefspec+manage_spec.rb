require 'chefspec'

describe 'user::manage' do
  let(:chef_run) do
    ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '18.04')
                          .converge(described_recipe)
  end

  it 'manages a user with an explicit action' 


  it 'manages a user with attributes' 


  it 'manages a user when specifying the identity attribute' 

end


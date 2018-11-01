require 'chefspec'

describe 'user::lock' do
  let(:chef_run) do
    ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '18.04')
                          .converge(described_recipe)
  end

  it 'locks a user with an explicit action' 


  it 'locks a user with attributes' 


  it 'locks a user when specifying the identity attribute' 

end


require 'chefspec'

describe 'user::remove' do
  let(:chef_run) do
    ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '18.04')
                          .converge(described_recipe)
  end

  it 'removes a user with an explicit action' 


  it 'removes a user with attributes' 


  it 'removes a user when specifying the identity attribute' 

end


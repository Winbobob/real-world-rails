require 'chefspec'

describe 'user::unlock' do
  let(:chef_run) do
    ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '18.04')
                          .converge(described_recipe)
  end

  it 'unlocks a user with an explicit action' 


  it 'unlocks a user with attributes' 


  it 'unlocks a user when specifying the identity attribute' 

end


require 'chefspec'

describe 'user::modify' do
  let(:chef_run) do
    ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '18.04')
                          .converge(described_recipe)
  end

  it 'modifys a user with an explicit action' 


  it 'modifys a user with attributes' 


  it 'modifys a user when specifying the identity attribute' 

end


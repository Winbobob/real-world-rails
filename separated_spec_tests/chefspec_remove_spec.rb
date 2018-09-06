require 'chefspec'

describe 'solaris_package::remove' do
  let(:chef_run) do
    ChefSpec::ServerRunner.new(platform: 'solaris2', version: '5.11')
                          .converge(described_recipe)
  end

  it 'removes a solaris_package with an explicit action' 


  it 'removes a solaris_package with attributes' 


  it 'removes a solaris_package when specifying the identity attribute' 

end


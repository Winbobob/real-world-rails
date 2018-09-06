require 'chefspec'

describe 'solaris_package::install' do
  let(:chef_run) do
    ChefSpec::ServerRunner.new(platform: 'solaris2', version: '5.11')
                          .converge(described_recipe)
  end

  it 'installs a solaris_package with the default action' 


  it 'installs a solaris_package with an explicit action' 


  it 'installs a solaris_package with attributes' 


  it 'installs a solaris_package when specifying the identity attribute' 

end


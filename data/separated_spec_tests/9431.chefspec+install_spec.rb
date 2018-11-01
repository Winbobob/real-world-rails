require 'chefspec'

describe 'openbsd_package::install' do
  let(:chef_run) { ChefSpec::SoloRunner.new(platform: 'openbsd', version: '6.2').converge(described_recipe) }

  it 'installs a openbsd_package with the default action' 


  it 'installs a openbsd_package with an explicit action' 


  it 'installs a openbsd_package with attributes' 


  it 'installs a openbsd_package when specifying the identity attribute' 

end


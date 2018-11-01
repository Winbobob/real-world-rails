require 'chefspec'

describe 'freebsd_package::install' do
  let(:chef_run) do
    ChefSpec::SoloRunner.new(platform: 'freebsd', version: '11.2')
                          .converge(described_recipe)
  end

  it 'installs a freebsd_package with the default action' 


  it 'installs a freebsd_package with an explicit action' 


  it 'installs a freebsd_package with attributes' 


  it 'installs a freebsd_package when specifying the identity attribute' 

end


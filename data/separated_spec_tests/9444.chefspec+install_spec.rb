require 'chefspec'

if defined?(Chef::Resource::CabPackage)
  describe 'cab_package::install' do
    let(:chef_run) do
      ChefSpec::SoloRunner.new(platform: 'windows', version: '2016')
        .converge(described_recipe)
    end

    it 'installs a cab_package with the default action' 


    it 'installs a cab_package with an explicit action' 


    it 'installs a cab_package with attributes' 


    it 'installs a cab_package when specifying the identity attribute' 

  end
end


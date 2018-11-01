require 'chefspec'

if defined?(Chef::Resource::CabPackage)
  describe 'cab_package::remove' do
    let(:chef_run) do
      ChefSpec::SoloRunner.new(platform: 'windows', version: '2016')
        .converge(described_recipe)
    end

    it 'removes a cab_package with an explicit action' 


    it 'removes a cab_package with attributes' 


    it 'removes a cab_package when specifying the identity attribute' 

  end
end


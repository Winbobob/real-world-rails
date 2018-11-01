require 'chefspec'

if defined?(Chef::Resource::MsuPackage)
  describe 'msu_package::install' do
    let(:chef_run) do
      ChefSpec::SoloRunner.new(platform: 'windows', version: '2016')
        .converge(described_recipe)
    end

    it 'installs a msu_package with the default action' 


    it 'installs a msu_package with an explicit action' 


    it 'installs a msu_package with attributes' 


    it 'installs a msu_package when specifying the identity attribute' 

  end
end


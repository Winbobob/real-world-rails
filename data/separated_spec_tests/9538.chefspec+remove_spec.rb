require 'chefspec'

if defined?(Chef::Resource::MsuPackage)
  describe 'msu_package::remove' do
    let(:chef_run) do
      ChefSpec::SoloRunner.new(platform: 'windows', version: '2016')
        .converge(described_recipe)
    end

    it 'removes a msu_package with an explicit action' 


    it 'removes a msu_package with attributes' 


    it 'removes a msu_package when specifying the identity attribute' 

  end
end


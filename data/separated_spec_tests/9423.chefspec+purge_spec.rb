require 'chefspec'

if defined?(Chef::Resource::DnfPackage)
  describe 'dnf_package::purge' do
    let(:chef_run) do
      ChefSpec::SoloRunner.new(platform: 'fedora')
        .converge(described_recipe)
    end

    it 'purges a dnf_package with an explicit action' 


    it 'purges a dnf_package with attributes' 


    it 'purges a dnf_package when specifying the identity attribute' 

  end
end


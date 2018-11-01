require 'chefspec'

if defined?(Chef::Resource::DnfPackage)
  describe 'dnf_package::install' do
    let(:chef_run) do
      ChefSpec::SoloRunner.new(platform: 'fedora')
        .converge(described_recipe)
    end

    it 'installs a dnf_package with the default action' 


    it 'installs a dnf_package with an explicit action' 


    it 'installs a dnf_package with attributes' 


    it 'installs a dnf_package when specifying the identity attribute' 

  end
end


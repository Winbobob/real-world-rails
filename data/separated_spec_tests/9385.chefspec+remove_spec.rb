require 'chefspec'

describe 'ips_package::remove' do
  let(:chef_run) do
    ChefSpec::SoloRunner.new(platform: 'solaris2', version: '5.11')
                          .converge(described_recipe)
  end

  it 'removes a ips_package with an explicit action' 


  it 'removes a ips_package with attributes' 


  it 'removes a ips_package when specifying the identity attribute' 

end


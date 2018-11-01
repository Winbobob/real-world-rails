require 'chefspec'

describe 'freebsd_package::remove' do
  let(:chef_run) do
    ChefSpec::SoloRunner.new(platform: 'freebsd', version: '11.2')
                          .converge(described_recipe)
  end

  it 'removes a freebsd_package with an explicit action' 


  it 'removes a freebsd_package with attributes' 


  it 'removes a freebsd_package when specifying the identity attribute' 

end


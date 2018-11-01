require 'chefspec'

describe 'roles' do
  let(:chef_run) { ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '18.04').converge('role[role]') }

  it 'expands the run_list' 


  it 'installs the package' 


  it 'installs the service' 

end


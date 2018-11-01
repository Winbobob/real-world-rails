require 'chefspec'

describe 'cron::create' do
  let(:chef_run) { ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '18.04').converge(described_recipe) }

  it 'creates a cron with the default action' 


  it 'creates a cron with an explicit action' 


  it 'creates a cron with attributes' 

end


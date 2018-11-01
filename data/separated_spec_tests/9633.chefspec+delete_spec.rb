require 'chefspec'

describe 'cron::delete' do
  let(:chef_run) { ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '18.04').converge(described_recipe) }

  it 'deletes a cron with an explicit action' 


  it 'deletes a cron with attributes' 

end


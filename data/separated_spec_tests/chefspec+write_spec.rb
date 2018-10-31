require 'chefspec'

describe 'log::write' do
  let(:chef_run) { ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '18.04').converge(described_recipe) }

  it 'writes a log with the default action' 


  it 'writes a log with an explicit action' 


  it 'writes a log with attributes' 


  it 'writes a log when specifying the identity attribute' 

end


require 'chefspec'

describe 'script::run_bash' do
  let(:chef_run) { ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '18.04').converge(described_recipe) }

  it 'runs a bash script with the default action' 


  it 'runs a bash script with an explicit action' 


  it 'runs a bash script with attributes' 

end


require 'chefspec'

describe 'multiple_run_action::default' do
  let(:chef_run) { ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '18.04').converge(described_recipe) }

  it 'includes the action explicitly given to the resource' 


  it 'includes an action specific called in #run_action' 


  it 'does not include something random' 

end


require 'chefspec'

describe 'multiple_actions::default' do
  let(:chef_run) { ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '18.04').converge(described_recipe) }

  it 'executes both actions' 


  it 'does not match other actions' 

end


# A simple test to make sure the ChefSpec::Runner name works.

require 'chefspec'

describe 'runner' do
  let(:chef_run) { ChefSpec::Runner.new(platform: 'ubuntu', version: '18.04').converge(described_recipe) }

  it 'runs the recipe' 

end


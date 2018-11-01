require 'chefspec'

describe 'include_recipe::default' do
  let(:chef_run) { ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '18.04').converge(described_recipe) }

  it 'includes the `other` recipe' 


  it 'does not include the `not` recipe' 

end


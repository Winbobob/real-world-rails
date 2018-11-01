require 'chefspec'

describe 'use_inline_resources::default' do
  let(:chef_run) do
    ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '18.04', step_into: ['use_inline_resources_lwrp'])
                          .converge(described_recipe)
  end

  it 'uses the LWRP' 


  it 'steps into the LWRP' 

end


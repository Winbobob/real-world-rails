require 'chefspec'

describe 'custom_resource::default' do
  let(:chef_run) do
    ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '18.04', step_into: ['custom_resource'])
                          .converge(described_recipe)
  end

  it 'uses the LWRP' 


  it 'steps into the LWRP' 

end


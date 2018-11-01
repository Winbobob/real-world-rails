require 'chefspec'

describe 'attributes::default' do
  let(:chef_run) do
    ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '18.04') do |node|
      node.automatic['ipaddress'] = '500.500.500.500' # Intentionally not a real IP
      node.normal['attributes']['message'] = 'The new message is here'
    end.converge(described_recipe)
  end

  it 'uses the overridden node attribute' 


  it 'uses the overridden ohai attribute' 

end


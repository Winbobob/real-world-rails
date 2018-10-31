require 'chefspec'

describe 'server::environment' do
  let(:chef_run) do
    ChefSpec::ServerRunner.new(platform: 'ubuntu', version: '16.04') do |_node, server|
      server.create_environment('production')
    end.converge(described_recipe)
  end

  it 'does not raise an exception' 


  it 'searches the Chef Server for environments' 

end


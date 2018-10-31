require 'chefspec'

describe 'server::client' do
  let(:chef_run) do
    ChefSpec::ServerRunner.new(platform: 'ubuntu', version: '16.04') do |_node, server|
      server.create_client('bacon', name: 'bacon')
    end.converge(described_recipe)
  end

  it 'does not raise an exception' 


  it 'searches the Chef Server for clients' 

end


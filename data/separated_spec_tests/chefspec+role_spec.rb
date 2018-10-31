require 'chefspec'

describe 'server::role' do
  let(:chef_run) do
    ChefSpec::ServerRunner.new(platform: 'ubuntu', version: '18.04') do |_node, server|
      server.create_role('webserver')
    end.converge(described_recipe)
  end

  it 'does not raise an exception' 


  it 'searches the Chef Server for roles' 

end


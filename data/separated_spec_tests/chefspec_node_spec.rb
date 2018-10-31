require 'chefspec'

describe 'server::node' do
  let(:chef_run) do
    ChefSpec::ServerRunner.new(platform: 'ubuntu', version: '16.04') do |_node, server|
      server.create_node('bacon', name: 'bacon')
    end.converge(described_recipe)
  end

  it 'does not raise an exception' 


  it 'searches the Chef Server for nodes' 


  context 'with custom Ohai data' do
    let(:chef_run) do
      ChefSpec::ServerRunner.new(platform: 'ubuntu', version: '16.04')
                            .converge(described_recipe)
    end

    it 'has the node data' 

  end

  context 'with overridden node data' do
    let(:chef_run) do
      ChefSpec::ServerRunner.new(platform: 'ubuntu', version: '16.04') do |node, _server|
        node.normal['breakfast']['bacon'] = true
      end.converge(described_recipe)
    end

    it 'has the node data' 

  end
end


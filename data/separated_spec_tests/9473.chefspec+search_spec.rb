require 'chefspec'

describe 'server::search' do
  let(:node_1) do
    stub_node('node_1') do |node|
      node.automatic['hostname'] = 'node_1'
      node.automatic['fqdn'] = 'node_1.example.com'
      node.normal['bar'] = true
    end
  end

  let(:node_2) do
    stub_node('node_2') do |node|
      node.automatic['hostname'] = 'node_2'
      node.automatic['fqdn'] = 'node_2.example.com'
      node.normal['bar'] = true
    end
  end

  let(:node_3) do
    stub_node('node_3') do |node|
      node.automatic['hostname'] = 'node_3'
      node.automatic['fqdn'] = 'node_3.example.com'
      node.normal['bar'] = true
    end
  end

  let(:node_4) do
    stub_node('node_4') do |node|
      node.automatic['hostname'] = 'node_4'
      node.automatic['fqdn'] = 'node_4.example.com'
    end
  end

  let(:chef_run) do
    ChefSpec::ServerRunner.new(platform: 'ubuntu', version: '18.04') do |node, server|
      node.normal['bar'] = true
      server.update_node(node)

      server.create_node(node_1)
      server.create_node(node_2)
      server.create_node(node_3)
      server.create_node(node_4)
    end.converge(described_recipe)
  end

  it 'finds all nodes with the bar attribute' 


  it 'does not find the node without the bar attribute' 

end


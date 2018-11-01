require 'chefspec'

describe 'stub_node::default' do
  let(:my_node) do
    stub_node('example.com', platform: 'ubuntu', version: '18.04') do |node|
      node.normal['foo']['bar'] = 'zip'
    end
  end

  it 'sets the fauxhai attributes' 


  it 'uses the overridden attributes' 

end


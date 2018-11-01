require 'chefspec'

describe 'env::create' do
  let(:chef_run) do
    ChefSpec::SoloRunner.new(platform: 'windows', version: '2016')
                          .converge(described_recipe)
  end

  it 'creates a env with the default action' 


  it 'creates a env with an explicit action' 


  it 'creates a env with attributes' 


  it 'creates a env when specifying the identity attribute' 

end


require 'chefspec'

describe 'env::modify' do
  let(:chef_run) do
    ChefSpec::SoloRunner.new(platform: 'windows', version: '2016')
                          .converge(described_recipe)
  end

  it 'modifies a env with an explicit action' 


  it 'modifies a env with attributes' 


  it 'modifies a env when specifying the identity attribute' 

end


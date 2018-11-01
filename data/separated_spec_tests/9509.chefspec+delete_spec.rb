require 'chefspec'

describe 'env::delete' do
  let(:chef_run) do
    ChefSpec::SoloRunner.new(platform: 'windows', version: '2016')
                          .converge(described_recipe)
  end

  it 'deletes a env with an explicit action' 


  it 'deletes a env with attributes' 


  it 'deletes a env when specifying the identity attribute' 

end


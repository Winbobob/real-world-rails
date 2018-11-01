require 'chefspec'

describe 'batch::run' do
  let(:chef_run) do
    ChefSpec::SoloRunner.new(platform: 'windows', version: '2016')
                          .converge(described_recipe)
  end

  it 'runs a batch with the default action' 


  it 'runs a batch with an explicit action' 


  it 'runs a batch with attributes' 

end


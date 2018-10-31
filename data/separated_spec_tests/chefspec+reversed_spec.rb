require 'chefspec'

describe 'multiple_actions::reversed' do
  let(:chef_run) do
    ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '18.04', log_level: :fatal)
                          .converge(described_recipe)
  end

  it 'executes both actions' 


  it 'does not match other actions' 

end


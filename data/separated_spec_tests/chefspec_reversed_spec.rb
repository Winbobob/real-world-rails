require 'chefspec'

describe 'multiple_actions::reversed' do
  let(:chef_run) do
    ChefSpec::ServerRunner.new(platform: 'ubuntu', version: '16.04', log_level: :fatal)
                          .converge(described_recipe)
  end

  it 'executes both actions' 


  it 'does not match other actions' 

end


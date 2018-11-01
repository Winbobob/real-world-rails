require 'chefspec'

describe 'step_into::default' do
  context 'without :step_into' do
    let(:chef_run) { ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '18.04').converge(described_recipe) }

    it 'does not execute the LWRPs action' 


    it 'does not execute the custom LWRPs action' 

  end

  context 'with :step_into' do
    let(:chef_run) do
      ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '18.04', step_into: %w(step_into_lwrp provides_this))
                            .converge(described_recipe)
    end

    it 'executes the LWRPs action' 


    it 'executes the custom LWRPs action' 

  end
end


require 'chefspec'

describe 'powershell_script::run' do
  let(:chef_run) do
    ChefSpec::SoloRunner.new(platform: 'windows', version: '2016')
                          .converge(described_recipe)
  end

  it 'runs a powershell_script with the default action' 


  it 'runs a powershell_script with an explicit action' 


  it 'runs a powershell_script with attributes' 

end


require 'chefspec'

describe 'chocolatey_package::upgrade' do
  let(:chef_run) do
    ChefSpec::SoloRunner.new(platform: 'windows', version: '2016')
                          .converge(described_recipe)
  end

  it 'upgrades a package' 


  it 'upgrades a specific version of a package with options' 

end


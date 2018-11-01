require 'chefspec'

describe 'chocolatey_package::install' do
  let(:chef_run) do
    ChefSpec::SoloRunner.new(platform: 'windows', version: '2016')
                          .converge(described_recipe)
  end

  it 'installs a package' 


  it 'installs a specific version of a package with options' 

end


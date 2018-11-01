require 'chefspec'

describe 'chocolatey_package::remove' do
  let(:chef_run) do
    ChefSpec::SoloRunner.new(platform: 'windows', version: '2016')
                          .converge(described_recipe)
  end

  it 'removes a package' 


  it 'removes a specific version of a package with options' 

end


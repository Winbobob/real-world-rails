require 'chefspec'

describe 'portage_package::purge' do
  let(:chef_run) do
    ChefSpec::SoloRunner.new(platform: 'gentoo', version: '4.9.95-gentoo')
                          .converge(described_recipe)
  end

  it 'purges a portage_package with an explicit action' 


  it 'purges a portage_package with attributes' 


  it 'purges a portage_package when specifying the identity attribute' 

end


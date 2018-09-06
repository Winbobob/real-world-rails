require 'chefspec'

describe 'dsc_resource::run' do
  let(:chef_run) do
    ChefSpec::ServerRunner.new(platform: 'windows', version: '2012R2')
                          .converge(described_recipe)
  end

  it 'runs dsc_resource with the archive resource' 


  it 'runs dsc_resource with the group resource' 


  it 'runs dsc_resource with the user resource' 

end


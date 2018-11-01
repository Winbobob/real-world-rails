require 'chefspec'

describe 'directory::delete' do
  let(:chef_run) { ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '18.04').converge(described_recipe) }

  it 'deletes a directory with an explicit action' 


  it 'deletes a directory with attributes' 


  it 'deletes a directory when specifying the identity attribute' 

end


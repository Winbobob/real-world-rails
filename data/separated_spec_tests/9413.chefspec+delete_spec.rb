require 'chefspec'

describe 'file::delete' do
  let(:chef_run) { ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '18.04').converge(described_recipe) }

  it 'deletes a file with an explicit action' 


  it 'deletes a file with attributes' 


  it 'deletes a file when specifying the identity attribute' 

end


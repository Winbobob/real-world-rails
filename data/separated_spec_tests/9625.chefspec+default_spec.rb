require 'chefspec'

describe 'guards::default' do
  let(:chef_run) { ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '18.04').converge(described_recipe) }

  it 'includes resource that have guards that evalute to true' 


  it 'excludes resources that have guards evaluated to false' 


  it 'excludes resource that have action :nothing' 

end


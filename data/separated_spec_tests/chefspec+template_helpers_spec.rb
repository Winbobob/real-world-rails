require 'chefspec'

describe 'render_file::template_helpers' do
  let(:chef_run) { ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '18.04').converge(described_recipe) }

  it 'renders the file using a helper' 

end


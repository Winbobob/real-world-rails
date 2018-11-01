require 'rake_helper'
Rake.application.rake_require 'tasks/config_lint'

describe ConfigLint do
  let(:files) { ['lib/support/fake.sh'] }

  it 'errors out if any bash scripts have errors' 


  it 'passes if all scripts are fine' 

end

describe 'config_lint rake task' do
  before do
    # Prevent `system` from actually being called
    allow(Kernel).to receive(:system).and_return(true)
  end

  it 'runs lint on shell scripts' 

end


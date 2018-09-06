require 'rspec/support/spec'

describe 'isolating a spec from the stderr splitter' do
  include RSpec::Support::WithIsolatedStdErr

  it 'allows a spec to output a warning' 


  it 'resets $stderr to its original value even if an error is raised' 

end


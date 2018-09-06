require 'rspec/support/spec/stderr_splitter'
require 'tempfile'
require 'rspec/support/spec/in_sub_process'

describe 'RSpec::Support::StdErrSplitter' do
  include RSpec::Support::InSubProcess

  let(:splitter) { RSpec::Support::StdErrSplitter.new stderr }
  let(:stderr)   { STDERR }

  before do
    allow(stderr).to receive(:write)
  end

  around do |example|
    original = $stderr
    $stderr = splitter

    example.run

    $stderr = original
  end

  it 'conforms to the stderr interface' 


  it 'acknowledges its own interface' 


  it 'supports methods that stderr supports but StringIO does not' 


  it 'supports #to_io' 


  it 'behaves like stderr' 


  it 'pretends to be stderr' 


  it 'resets when reopened' 


  it 'tracks when output to' 


  it 'will ignore examples without a warning' 


  it 'will ignore examples after a reset a warning' 


  unless defined?(RUBY_ENGINE) && RUBY_ENGINE == 'rbx'
    it 'will fail an example which generates a warning' 

  end

end


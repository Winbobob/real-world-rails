require 'rspec/support/spec/shell_out'

RSpec.describe RSpec::Support::ShellOut, :slow do
  include described_class

  it 'shells out and returns stdout and stderr' 


  it 'returns the exit status as the third argument' 


  it 'can shell out to ruby with the current load path' 


  it 'passes along the provided ruby flags' 


  it 'filters out the annoying output issued by `ruby -w` when the GC ENV vars are set' 

end


require 'spec_helper'

describe ParallelTests::RSpec::FailuresLogger do
  let(:output){ OutputLogger.new([]) }
  let(:logger){ ParallelTests::RSpec::FailuresLogger.new(output) }

  it "prints failures" 

end


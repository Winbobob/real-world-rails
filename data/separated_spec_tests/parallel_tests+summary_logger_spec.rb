require 'spec_helper'

describe ParallelTests::RSpec::SummaryLogger do
  let(:output){ OutputLogger.new([]) }
  let(:logger){ ParallelTests::RSpec::SummaryLogger.new(output) }

  it "prints failing examples" 

end


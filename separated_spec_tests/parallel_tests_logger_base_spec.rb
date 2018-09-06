require 'spec_helper'

describe ParallelTests::RSpec::LoggerBase do
  before do
    @temp_file = Tempfile.open('xxx')
    @logger = ParallelTests::RSpec::LoggerBase.new(@temp_file)
  end

  after do
    @temp_file.close
  end

  describe 'on tests finished' do
    it 'should respond to close' 


    it 'should close output' 


    it 'should not close stdout' 


    it 'should not close IO instance' 

  end
end


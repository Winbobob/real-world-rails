require 'spec_helper'

describe "A Very blunt test to make sure that we aren't doing stupid leaks", :memory => true do
  before do
    if Object.const_defined?(:RUBY_ENGINE) && RUBY_ENGINE == 'rbx'
      pending 'need to figure out how to do memory sanity checks on rbx'
    end
    #allocate a single context to make sure that v8 loads its snapshot and
    #we pay the overhead.
    V8::Context.new
    @start_memory = process_memory
    GC.stress = true
  end

  after do
    GC.stress = false
  end
  it "won't increase process memory by more than 50% no matter how many contexts we create" 


  it "can eval simple value passing statements repeatedly without significantly increasing memory" 


  def process_memory
    /\w*[ ]*#{Process.pid}[ ]*([.,\d]*)[ ]*([.,\d]*)[ ]*([\d]*)[ ]*([\d]*)/.match(`ps aux`)[4].to_i
  end

end



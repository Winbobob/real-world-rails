require File.expand_path('../spec_helper', __FILE__)
require "pid_behavior"

if ChildProcess.unix? && !ChildProcess.jruby? && !ChildProcess.posix_spawn?

  describe ChildProcess::Unix::Process do
    it_behaves_like "a platform that provides the child's pid"

    it "handles ECHILD race condition where process dies between timeout and KILL" 


    it "handles ESRCH race condition where process dies between timeout and KILL" 

  end

  describe ChildProcess::Unix::IO do
    let(:io) { ChildProcess::Unix::IO.new }

    it "raises an ArgumentError if given IO does not respond to :to_io" 


    it "raises a TypeError if #to_io does not return an IO" 

  end

end


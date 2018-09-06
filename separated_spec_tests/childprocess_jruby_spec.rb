require File.expand_path('../spec_helper', __FILE__)
require "pid_behavior"

if ChildProcess.jruby? && !ChildProcess.windows?
  describe ChildProcess::JRuby::IO do
    let(:io) { ChildProcess::JRuby::IO.new }

    it "raises an ArgumentError if given IO does not respond to :to_outputstream" 

  end

  describe ChildProcess::JRuby::Process do
    if ChildProcess.unix?
      it_behaves_like "a platform that provides the child's pid"
    else
      it "raises an error when trying to access the child's pid" 

    end
  end
end


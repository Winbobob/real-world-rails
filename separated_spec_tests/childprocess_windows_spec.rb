require File.expand_path('../spec_helper', __FILE__)
require "pid_behavior"

if ChildProcess.windows?
  describe ChildProcess::Windows::Process do
    it_behaves_like "a platform that provides the child's pid"
  end

  describe ChildProcess::Windows::IO do
    let(:io) { ChildProcess::Windows::IO.new }

    it "raises an ArgumentError if given IO does not respond to :fileno" 


    it "raises an ArgumentError if the #to_io does not return an IO " 

  end
end


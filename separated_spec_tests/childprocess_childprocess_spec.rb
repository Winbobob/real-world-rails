# encoding: utf-8

require File.expand_path('../spec_helper', __FILE__)
require 'rubygems/mock_gem_ui'


describe ChildProcess do

  here = File.dirname(__FILE__)

  let(:gemspec) { eval(File.read "#{here}/../childprocess.gemspec") }

  it 'validates cleanly' 



  it "returns self when started" 


  # We can't detect failure to execve() when using posix_spawn() on Linux
  # without waiting for the child to exit with code 127.
  #
  # See e.g. http://repo.or.cz/w/glibc.git/blob/669704fd:/sysdeps/posix/spawni.c#l34
  #
  # We could work around this by doing the PATH search ourselves, but not sure
  # it's worth it.
  it "raises ChildProcess::LaunchError if the process can't be started", :posix_spawn_on_linux => false do
    expect { invalid_process.start }.to raise_error(ChildProcess::LaunchError)
  end

  it 'raises ArgumentError if given a non-string argument' 


  it "knows if the process crashed" 


  it "knows if the process didn't crash" 


  it "can wait for a process to finish" 


  it 'ignores #wait if process already finished' 


  it "escalates if TERM is ignored" 


  it "accepts a timeout argument to #stop" 


  it "lets child process inherit the environment of the current process" 


  it "can override env vars only for the current process" 


  it "inherits the parent's env vars also when some are overridden" 


  it "can unset env vars" 


  it 'does not see env vars unset in parent' 



  it "passes arguments to the child" 


  it "lets a detached child live on" 


  it "preserves Dir.pwd in the child" 


  it "can handle whitespace, special characters and quotes in arguments" 


  it 'handles whitespace in the executable name' 


  it "times out when polling for exit" 


  it "can change working directory" 


  it 'kills the full process tree', :process_builder => false do
    Tempfile.open('kill-process-tree') do |file|
      process = write_pid_in_sleepy_grand_child(file.path)
      process.leader = true
      process.start

      pid = wait_until(30) do
        Integer(rewind_and_read(file)) rescue nil
      end

      process.stop
      wait_until(3) { expect(alive?(pid)).to eql(false) }
    end
  end

  it 'releases the GIL while waiting for the process' 


  it 'can check if a detached child is alive' 


  describe 'OS detection' do

    before(:all) do
      # Save off original OS so that it can be restored later
      @original_host_os = RbConfig::CONFIG['host_os']
    end

    after(:each) do
      # Restore things to the real OS instead of the fake test OS
      RbConfig::CONFIG['host_os'] = @original_host_os
      ChildProcess.instance_variable_set(:@os, nil)
    end


    # TODO: add tests for other OSs
    context 'on a BSD system' do

      let(:bsd_patterns) { ['bsd', 'dragonfly'] }

      it 'correctly identifies BSD systems' 


    end

  end

  it 'has a logger' 


  it 'can change its logger' 



  describe 'logger' do

    before(:each) do
      ChildProcess.logger = logger
    end

    after(:all) do
      ChildProcess.logger = nil
    end


    context 'with the default logger' do

      let(:logger) { nil }


      it 'logs at INFO level by default' 


      it 'logs at DEBUG level by default if $DEBUG is on' 


      it "logs to stderr by default" 


    end

    context 'with a custom logger' do

      let(:logger) { Logger.new($stdout) }

      it "logs to configured logger" 


    end

  end

  describe '#started?' do
    subject { process.started? }

    context 'when not started' do
      let(:process) { sleeping_ruby(1) }

      it { is_expected.to be false }
    end

    context 'when started' do
      let(:process) { sleeping_ruby(1).start }

      it { is_expected.to be true }
    end

    context 'when finished' do
      before(:each) { process.wait }

      let(:process) { sleeping_ruby(0).start }

      it { is_expected.to be true }
    end

  end

end


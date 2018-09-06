require "spec_helper"

describe Capistrano::Application do
  it "provides a --trace option which enables SSHKit/NetSSH trace output"

  it "provides a --format option which enables the choice of output formatting"

  let(:help_output) do
    out, _err = capture_io do
      flags "--help", "-h"
    end
    out
  end

  it "displays documentation URL as help banner" 


  %w(quiet silent verbose).each do |switch|
    it "doesn't include --#{switch} in help" 

  end

  it "overrides the rake method, but still prints the rake version" 


  it "overrides the rake method, and sets the sshkit_backend to SSHKit::Backend::Printer" 


  it "enables printing all config variables on command line parameter" 


  def flags(*sets)
    sets.each do |set|
      ARGV.clear
      @exit = catch(:system_exit) { command_line(*set) }
    end
    yield(subject.options) if block_given?
  end

  def command_line(*options)
    options.each { |opt| ARGV << opt }
    subject.define_singleton_method(:exit) do |*_args|
      throw(:system_exit, :exit)
    end
    subject.run
    subject.options
  end

  def capture_io
    require "stringio"

    orig_stdout = $stdout
    orig_stderr = $stderr
    captured_stdout = StringIO.new
    captured_stderr = StringIO.new
    $stdout = captured_stdout
    $stderr = captured_stderr

    yield

    return captured_stdout.string, captured_stderr.string
  ensure
    $stdout = orig_stdout
    $stderr = orig_stderr
  end
end


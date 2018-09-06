require "spec_helper"
require "dotenv/cli"

describe "dotenv binary" do
  before do
    Dir.chdir(File.expand_path("../../fixtures", __FILE__))
  end

  def run(*args)
    Dotenv::CLI.new(args).run
  end

  it "loads from .env by default" 


  it "loads from file specified by -f" 


  it "dies if file specified by -f doesn't exist" 


  it "loads from multiple files specified by -f" 


  # Capture output to $stdout and $stderr
  def capture_output(&_block)
    original_stderr = $stderr
    original_stdout = $stdout
    output = $stderr = $stdout = StringIO.new

    yield

    $stderr = original_stderr
    $stdout = original_stdout
    output.string
  end
end


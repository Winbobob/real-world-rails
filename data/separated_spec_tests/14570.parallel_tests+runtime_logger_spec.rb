require 'spec_helper'

describe ParallelTests::Test::RuntimeLogger do
  def sh(command)
    result = `#{command} 2>&1`
    raise "FAILED: #{result}" unless $?.success?
  end

  def run_tests
    sh "ruby #{Bundler.root}/bin/parallel_test test -n 2"
  end

  it "writes a correct log on minitest-5" 

end


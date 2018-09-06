require 'spec_helper'

describe ParallelTests::Test::RuntimeLogger do
  def sh(command)
    result = `#{command} 2>&1`
    raise "FAILED: #{result}" unless $?.success?
  end

  def run_tests
    sh "ruby #{Bundler.root}/bin/parallel_test test -n 2"
  end

  it "writes a correct log on test-unit" 


  # static directory with gems so it's fast on travis
  it "writes a correct log on minitest-4" 


  it "writes a correct log on minitest-5" 

end


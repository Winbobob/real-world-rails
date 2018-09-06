# frozen_string_literal: true

RSpec.describe "ruby requirement" do
  def locked_ruby_version
    Bundler::RubyVersion.from_string(Bundler::LockfileParser.new(lockfile).ruby_version)
  end

  # As discovered by https://github.com/bundler/bundler/issues/4147, there is
  # no test coverage to ensure that adding a gem is possible with a ruby
  # requirement. This test verifies the fix, committed in bfbad5c5.
  it "allows adding gems" 


  it "allows removing the ruby version requirement" 


  it "allows changing the ruby version requirement to something compatible" 


  it "allows changing the ruby version requirement to something incompatible" 


  it "allows requirements with trailing whitespace" 


  it "fails gracefully with malformed requirements" 

end


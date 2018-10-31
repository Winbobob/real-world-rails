# frozen_string_literal: true

require "rubygems/security"

# unfortunately, testing signed gems with a provided CA is extremely difficult
# as 'gem cert' is currently the only way to add CAs to the system.

RSpec.describe "policies with unsigned gems" do
  before do
    build_security_repo
    gemfile <<-G
      source "file://#{security_repo}"
      gem "rack"
      gem "signed_gem"
    G
  end

  it "will work after you try to deploy without a lock" 


  it "will fail when given invalid security policy" 


  it "will fail with High Security setting due to presence of unsigned gem" 


  # This spec will fail on RubyGems 2 rc1 due to a bug in policy.rb. the bug is fixed in rc3.
  it "will fail with Medium Security setting due to presence of unsigned gem", :unless => ENV["RGV"] == "v2.0.0.rc.1" 


  it "will succeed with no policy" 

end

RSpec.describe "policies with signed gems and no CA" do
  before do
    build_security_repo
    gemfile <<-G
      source "file://#{security_repo}"
      gem "signed_gem"
    G
  end

  it "will fail with High Security setting, gem is self-signed" 


  it "will fail with Medium Security setting, gem is self-signed" 


  it "will succeed with Low Security setting, low security accepts self signed gem" 


  it "will succeed with no policy" 

end


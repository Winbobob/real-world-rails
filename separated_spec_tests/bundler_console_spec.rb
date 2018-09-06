# frozen_string_literal: true

RSpec.describe "bundle console", :bundler => "< 2" do
  before :each do
    install_gemfile <<-G
      source "file://#{gem_repo1}"
      gem "rack"
      gem "activesupport", :group => :test
      gem "rack_middleware", :group => :development
    G
  end

  it "starts IRB with the default group loaded" 


  it "uses IRB as default console" 


  it "starts another REPL if configured as such" 


  it "falls back to IRB if the other REPL isn't available" 


  it "doesn't load any other groups" 


  describe "when given a group" do
    it "loads the given group" 


    it "loads the default group" 


    it "doesn't load other groups" 

  end

  it "performs an automatic bundle install" 

end


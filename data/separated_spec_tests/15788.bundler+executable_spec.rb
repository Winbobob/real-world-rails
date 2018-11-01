# frozen_string_literal: true

RSpec.describe "Running bin/* commands" do
  before :each do
    install_gemfile! <<-G
      source "file://#{gem_repo1}"
      gem "rack"
    G
  end

  it "runs the bundled command when in the bundle" 


  it "allows the location of the gem stubs to be specified" 


  it "allows absolute paths as a specification of where to install bin stubs" 


  it "uses the default ruby install name when shebang is not specified" 


  it "allows the name of the shebang executable to be specified" 


  it "runs the bundled command when out of the bundle" 


  it "works with gems in path" 


  it "creates a bundle binstub" 


  it "does not generate bin stubs if the option was not specified" 


  it "allows you to stop installing binstubs", :bundler => "< 2" 


  it "remembers that the option was specified", :bundler => "< 2" 


  it "rewrites bins on --binstubs (to maintain backwards compatibility)", :bundler => "< 2" 


  it "rewrites bins on binstubs (to maintain backwards compatibility)" 


  it "use BUNDLE_GEMFILE gemfile for binstub" 

end


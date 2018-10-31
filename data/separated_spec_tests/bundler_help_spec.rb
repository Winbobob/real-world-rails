# frozen_string_literal: true

RSpec.describe "bundle help" do
  # RubyGems 1.4+ no longer load gem plugins so this test is no longer needed
  it "complains if older versions of bundler are installed", :rubygems => "< 1.4" 


  it "uses mann when available" 


  it "prefixes bundle commands with bundle- when finding the groff files" 


  it "simply outputs the txt file when there is no man on the path" 


  it "still outputs the old help for commands that do not have man pages yet" 


  it "looks for a binary and executes it with --help option if it's named bundler-<task>" 


  it "is called when the --help flag is used after the command" 


  it "is called when the --help flag is used before the command" 


  it "is called when the -h flag is used before the command" 


  it "is called when the -h flag is used after the command" 


  it "has helpful output when using --help flag for a non-existent command" 


  it "is called when only using the --help flag" 

end


require 'spec_helper'
require 'pathname'

RSpec.describe "Verify required rspec dependencies" do

  tmp_root = Pathname.new(RSpec::Core::RubyProject.root).join("tmp")

  before{ FileUtils.mkdir_p tmp_root }

  it "fails when libraries are not required" 


  it "passes when libraries are required" 


end


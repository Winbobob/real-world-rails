# These specs ensure that Pry doesn't require readline until the first time a
# REPL is started.

require "helper"
require "shellwords"

RSpec.describe "Readline" do
  before :all do
    @ruby  = RbConfig.ruby.shellescape
    @pry_dir = File.expand_path(File.join(__FILE__, '../../../lib')).shellescape
  end

  it "is not loaded on requiring 'pry'" 


  it "is loaded on invoking 'pry'" 


  it "is not loaded on invoking 'pry' if Pry.input is set" 

end


require "helper"
require "shellwords"

RSpec.describe "Hanami integration" do
  before :all do
    @ruby = RbConfig.ruby.shellescape
    @pry_dir = File.expand_path(File.join(__FILE__, '../../../lib')).shellescape
  end

  it "does not enter an infinite loop (#1471, #1621)" 

end


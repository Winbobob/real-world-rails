require "spec_helper"

describe Dotenv::Environment do
  subject { env("OPTION_A=1\nOPTION_B=2") }

  describe "initialize" do
    it "reads the file" 


    it "fails if file does not exist" 

  end

  describe "apply" do
    it "sets variables in ENV" 


    it "does not override defined variables" 

  end

  describe "apply!" do
    it "sets variables in the ENV" 


    it "overrides defined variables" 

  end

  require "tempfile"
  def env(text)
    file = Tempfile.new("dotenv")
    file.write text
    file.close
    env = Dotenv::Environment.new(file.path, true)
    file.unlink
    env
  end
end


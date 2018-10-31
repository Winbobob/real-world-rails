require "helper"
require "thor/parser"

describe Thor::Arguments do
  def create(opts = {})
    arguments = opts.map do |type, default|
      options = {:required => default.nil?, :type => type, :default => default}
      Thor::Argument.new(type.to_s, options)
    end

    arguments.sort! { |a, b| b.name <=> a.name }
    @opt = Thor::Arguments.new(arguments)
  end

  def parse(*args)
    @opt.parse(args)
  end

  describe "#parse" do
    it "parses arguments in the given order" 


    it "accepts hashes" 


    it "accepts arrays" 


    describe "with no inputs" do
      it "and no arguments returns an empty hash" 


      it "and required arguments raises an error" 


      it "and default arguments returns default values" 

    end

    it "returns the input if it's already parsed" 


    it "returns the default value if none is provided" 

  end
end


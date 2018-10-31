require "helper"
require "thor/parser"

describe Thor::Options do
  def create(opts, defaults = {}, stop_on_unknown = false)
    opts.each do |key, value|
      opts[key] = Thor::Option.parse(key, value) unless value.is_a?(Thor::Option)
    end

    @opt = Thor::Options.new(opts, defaults, stop_on_unknown)
  end

  def parse(*args)
    @opt.parse(args.flatten)
  end

  def check_unknown!
    @opt.check_unknown!
  end

  def remaining
    @opt.remaining
  end

  describe "#to_switches" do
    it "turns true values into a flag" 


    it "ignores nil" 


    it "ignores false" 


    it "avoids extra spaces" 


    it "writes --name value for anything else" 


    it "joins several values" 


    it "accepts arrays" 


    it "accepts hashes" 


    it "accepts underscored options" 

  end

  describe "#parse" do
    it "allows multiple aliases for a given switch" 


    it "allows custom short names" 


    it "allows custom short-name aliases" 


    it "accepts conjoined short switches" 


    it "accepts conjoined short switches with input" 


    it "returns the default value if none is provided" 


    it "returns the default value from defaults hash to required arguments" 


    it "gives higher priority to defaults given in the hash" 


    it "raises an error for unknown switches" 


    it "skips leading non-switches" 


    it "correctly recognizes things that look kind of like options, but aren't, as not options" 


    it "accepts underscores in commandline args hash for boolean" 


    it "accepts underscores in commandline args hash for strings" 


    it "interprets everything after -- as args instead of options" 


    it "ignores -- when looking for single option values" 


    it "ignores -- when looking for array option values" 


    it "ignores -- when looking for hash option values" 


    it "ignores trailing --" 


    describe "with no input" do
      it "and no switches returns an empty hash" 


      it "and several switches returns an empty hash" 


      it "and a required switch raises an error" 

    end

    describe "with one required and one optional switch" do
      before do
        create "--foo" => :required, "--bar" => :boolean
      end

      it "raises an error if the required switch has no argument" 


      it "raises an error if the required switch isn't given" 


      it "raises an error if the required switch is set to nil" 


      it "does not raises an error if the required option has a default value" 

    end

    context "when stop_on_unknown is true" do
      before do
        create({:foo => :string, :verbose => :boolean}, {}, true)
      end

      it "stops parsing on first non-option" 


      it "stops parsing on unknown option" 


      it "retains -- after it has stopped parsing" 


      it "still accepts options that are given before non-options" 


      it "still accepts options that require a value" 


      it "still interprets everything after -- as args instead of options" 

    end

    describe "with :string type" do
      before do
        create %w(--foo -f) => :required
      end

      it "accepts a switch <value> assignment" 


      it "accepts a switch=<value> assignment" 


      it "must accept underscores switch=value assignment" 


      it "accepts a --no-switch format" 


      it "does not consume an argument for --no-switch format" 


      it "accepts a --switch format on non required types" 


      it "accepts a --switch format on non required types with default values" 


      it "overwrites earlier values with later values" 


      it "raises error when value isn't in enum" 

    end

    describe "with :boolean type" do
      before do
        create "--foo" => false
      end

      it "accepts --opt assignment" 


      it "uses the default value if no switch is given" 


      it "accepts --opt=value assignment" 


      it "accepts --[no-]opt variant, setting false for value" 


      it "accepts --[skip-]opt variant, setting false for value" 


      it "will prefer 'no-opt' variant over inverting 'opt' if explicitly set" 


      it "will prefer 'skip-opt' variant over inverting 'opt' if explicitly set" 


      it "accepts inputs in the human name format" 


      it "doesn't eat the next part of the param" 


      it "doesn't eat the next part of the param with 'no-opt' variant" 


      it "doesn't eat the next part of the param with 'skip-opt' variant" 

    end

    describe "with :hash type" do
      before do
        create "--attributes" => :hash
      end

      it "accepts a switch=<value> assignment" 


      it "accepts a switch <value> assignment" 


      it "must not mix values with other switches" 


      it "must not allow the same hash key to be specified multiple times" 

    end

    describe "with :array type" do
      before do
        create "--attributes" => :array
      end

      it "accepts a switch=<value> assignment" 


      it "accepts a switch <value> assignment" 


      it "must not mix values with other switches" 

    end

    describe "with :numeric type" do
      before do
        create "n" => :numeric, "m" => 5
      end

      it "accepts a -nXY assignment" 


      it "converts values to numeric types" 


      it "raises error when value isn't numeric" 


      it "raises error when value isn't in enum" 

    end
  end
end


require_relative 'helper'
describe Pry::Config do
  describe "bug #1552" do
    specify "a local key has precendence over its default when the stored value is false" do
      local = Pry::Config.from_hash({}, Pry::Config.from_hash('color' => true))
      local.color = false
      expect(local.color).to eq(false)
    end
  end

  describe "bug #1277" do
    specify "a local key has precendence over an inherited method of the same name" do
      local = Pry::Config.from_hash(output: 'foobar')
      local.extend Module.new { def output(); 'broken'; end }
      expect(local.output).to eq('foobar')
    end
  end

  describe "reserved keys" do
    it "raises Pry::Config::ReservedKeyError on assignment of a reserved key" 

  end

  describe "traversal to parent" do
    it "traverses back to the parent when a local key is not found" 


    it "stores a local key and prevents traversal to the parent" 


    it "traverses through a chain of parents" 


    it "stores a local copy of the parents hooks upon accessing them" 

  end

  describe ".from_hash" do
    it "returns an object without a default" 


    it "returns an object with a default" 


    it "recursively builds Pry::Config objects from a Hash" 

  end


  describe "#respond_to_missing?" do
    before do
      @config = Pry::Config.new(nil)
    end

    it "returns a Method object for a dynamic key" 


    it "returns a Method object for a setter on a parent" 

  end

  describe "#respond_to?" do
    before do
      @config = Pry::Config.new(nil)
    end

    it "returns true for a local key" 


    it "returns false for an unknown key" 

  end

  describe "#default" do
    it "returns nil" 


    it "returns the default" 

  end

  describe "#keys" do
    it "returns an array of local keys" 

  end

  describe "#==" do
    it "compares equality through the underlying lookup table" 


    it "compares equality against an object who does not implement #to_hash" 

  end

  describe "#forget" do
    it "forgets a local key" 

  end

  describe "#to_hash" do
    it "provides a copy of local key & value pairs as a Hash" 


    it "returns a duplicate of the lookup table" 

  end

  describe "#merge!" do
    before do
      @config = Pry::Config.new(nil)
    end

    it "merges an object who returns a Hash through #to_hash" 


    it "merges an object who returns a Hash through #to_h" 


    it "merges a Hash" 


    it "raises a TypeError for objects who can't become a Hash" 

  end

  describe "#clear" do
    before do
      @local = Pry::Config.new(nil)
    end

    it "returns true" 


    it "clears local assignments" 

  end

  describe "#[]=" do
    it "stores keys as strings" 

  end

  describe "#[]" do
    it "traverses back to a default" 


    it "traverses back to a default (2 deep)" 


    it "traverses back to a default that doesn't exist, and returns nil" 

  end
end


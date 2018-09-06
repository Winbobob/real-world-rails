require "helper"
require "thor/core_ext/ordered_hash"

describe Thor::CoreExt::OrderedHash do
  subject { Thor::CoreExt::OrderedHash.new }

  def populate_subject
    subject[:foo] = "Foo!"
    subject[:bar] = "Bar!"
    subject[:baz] = "Baz!"
    subject[:bop] = "Bop!"
    subject[:bat] = "Bat!"
  end

  describe "#initialize" do
    it "is empty" 

  end

  describe "#replace" do
    before { populate_subject }
    it "replaces the keys" 

  end

  describe "#[]" do
    it "returns nil for an undefined key" 


    before { populate_subject }
    it "returns the value for each key" 

  end

  describe "#[]=" do
    it "does not duplicate keys" 


   it "does not move an overwritten node to the end of the ordering" 

  end

  describe "#clear" do
    before { populate_subject }
    it "clears the keys" 

  end

  describe "#shift" do
    before { populate_subject }
    it "pops the first key/value" 


    it "removes the key" 

  end

  describe "#each" do
    before { populate_subject }
    it "iterates through the keys and values in order of assignment" 

  end

  describe "#merge!" do
    it "modifies the existing object" 

  end

  describe "#merge" do
    it "appends another ordered hash while preserving ordering" 


    it "overwrites hash keys with matching appended keys" 

  end

  describe "#to_a" do
    before { populate_subject }
    it "converts to an array" 

  end

  describe "#keys" do
    context "when list is unpopulated" do
      it "has an empty keys list" 

    end

    it "returns the keys in order of insertion" 

  end

  describe "#values" do
    it "returns the values in order of insertion" 


    context "when list is unpopulated" do
      it "has an empty list" 

    end
  end

  describe "#delete" do
    before { populate_subject }
    it "deletes the value given the key" 


    it "returns nil if the value to be deleted can't be found" 


    it "deletes the given key" 

  end
end


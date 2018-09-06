require 'rails_helper'
require 'email'

describe Enum do
  let(:array_enum) { Enum.new(:jake, :finn, :princess_bubblegum, :peppermint_butler) }
  let(:hash_enum) { Enum.new(jake: 1, finn: 2, princess_bubblegum: 3, peppermint_butler: 4) }

  describe ".[]" do
    it "looks up a number by symbol" 


    it "looks up a symbol by number" 

  end

  describe ".valid?" do
    it "returns true if a key exists" 


    it "returns false if a key does not exist" 

  end

  describe ".only" do
    it "returns only the values we ask for" 

  end

  describe ".except" do
    it "returns everything but the values we ask to delete" 

  end

  context "allows to specify number of first enum member" do
    it "number of first enum member should be 0 " 

  end
end


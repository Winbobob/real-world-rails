# frozen_string_literal: true

RSpec.describe Bundler::SpecSet do
  let(:specs) do
    [
      build_spec("a", "1.0"),
      build_spec("b", "1.0"),
      build_spec("c", "1.1") do |s|
        s.dep "a", "< 2.0"
        s.dep "e", "> 0"
      end,
      build_spec("d", "2.0") do |s|
        s.dep "a", "1.0"
        s.dep "c", "~> 1.0"
      end,
      build_spec("e", "1.0.0.pre.1"),
    ].flatten
  end

  subject { described_class.new(specs) }

  context "enumerable methods" do
    it "has a length" 


    it "has a size" 

  end

  describe "#find_by_name_and_platform" do
    let(:platform) { Gem::Platform.new("universal-darwin-64") }
    let(:platform_spec) { build_spec("b", "2.0", platform).first }
    let(:specs) do
      [
        build_spec("a", "1.0"),
        platform_spec,
      ].flatten
    end

    it "finds spec with given name and platform" 

  end

  describe "#merge" do
    let(:other_specs) do
      [
        build_spec("f", "1.0"),
        build_spec("g", "2.0"),
      ].flatten
    end

    let(:other_spec_set) { described_class.new(other_specs) }

    it "merges the items in each gemspec" 

  end

  describe "#to_a" do
    it "returns the specs in order" 

  end
end


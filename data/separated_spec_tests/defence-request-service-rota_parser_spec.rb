require "spec_helper"
require "active_support/core_ext/string/strip"
require_relative "../../../lib/rota_generation/parser"
require_relative "../../../lib/rota_generation/unsatisfiable"
require_relative "../../../lib/rota_generation/solution"

RSpec.describe RotaGeneration::Parser do
  describe "#parse!" do
    context "with an unsatisfiable response" do
      it "returns an Unsatisfiable object" 

    end

    context "with a satisfiable response" do
      it "returns a Solution with the last answer provided" 

    end

    context "with an empty satisfiable response" do
      it "returns an Unsatisfiable object" 

    end
  end
end


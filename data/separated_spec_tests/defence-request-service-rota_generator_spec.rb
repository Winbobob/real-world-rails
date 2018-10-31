require "spec_helper"
require_relative "../../../lib/rota_generation/generator"
require_relative "../../../lib/rota_generation/runner"
require_relative "../../../lib/rota_generation/parser"
require_relative "../../../lib/rota_generation/allocator"
require_relative "../../../lib/rota_generation/fact_file_writer"

RSpec.describe RotaGeneration::Generator do
  describe "#generate_rota" do
    subject { RotaGeneration::Generator.new([], []) }

    it "calls the necessary methods" 

  end

  describe "#write!" do
    before :each do
      @buffer = StringIO.new
      allow(Tempfile).to receive(:new).and_return(@buffer)
    end

    subject { RotaGeneration::Generator.new([], []) }

    it "flushes the buffer" 

  end

  describe "#run!" do
    it "runs the solver" 


    it "closes the buffer" 

  end

  describe "#parse!" do
    subject { RotaGeneration::Generator.new([], []) }

    context "with a satisfiable solution" do
      before :each do
        @parser = double(:parser,
                         parse!: double(:solution,
                                        satisfiable?: true,
                                        clauses: []),
                         mutate_slots!: true)
        allow(RotaGeneration::Parser).to receive(:new).and_return(@parser)

        @allocator = double(:allocator, mutate_slots!: [])
        allow(RotaGeneration::Allocator).to receive(:new).and_return(@allocator)
      end

      it "calls parse!" 


      it "mutates the provided slots" 

    end

    context "with an unsatisfiable solution" do
      before :each do
        @parser = double(:parser, parse!: double(:solution, satisfiable?: false))
        allow(RotaGeneration::Parser).to receive(:new).and_return(@parser)
      end

      it "calls parse!" 


      it "returns empty" 

    end
  end
end


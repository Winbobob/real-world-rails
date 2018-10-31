# frozen_string_literal: true

require "bundler/installer/parallel_installer"

RSpec.describe Bundler::ParallelInstaller do
  let(:installer) { instance_double("Installer") }
  let(:all_specs) { [] }
  let(:size) { 1 }
  let(:standalone) { false }
  let(:force) { false }

  subject { described_class.new(installer, all_specs, size, standalone, force) }

  context "when dependencies that are not on the overall installation list are the only ones not installed" do
    let(:all_specs) do
      [
        build_spec("alpha", "1.0") {|s| s.runtime "a", "1" },
      ].flatten
    end

    it "prints a warning" 


    context "when size > 1" do
      let(:size) { 500 }

      it "prints a warning and sets size to 1" 

    end
  end
end


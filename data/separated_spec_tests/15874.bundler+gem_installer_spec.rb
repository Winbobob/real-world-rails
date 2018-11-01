# frozen_string_literal: true

require "bundler/installer/gem_installer"

RSpec.describe Bundler::GemInstaller do
  let(:installer) { instance_double("Installer") }
  let(:spec_source) { instance_double("SpecSource") }
  let(:spec) { instance_double("Specification", :name => "dummy", :version => "0.0.1", :loaded_from => "dummy", :source => spec_source) }

  subject { described_class.new(spec, installer) }

  context "spec_settings is nil" do
    it "invokes install method with empty build_args", :rubygems => ">= 2" 

  end

  context "spec_settings is build option" do
    it "invokes install method with build_args", :rubygems => ">= 2" 

  end
end


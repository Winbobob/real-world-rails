# frozen_string_literal: true

RSpec.describe Bundler::Source do
  class ExampleSource < Bundler::Source
  end

  subject { ExampleSource.new }

  describe "#unmet_deps" do
    let(:specs) { double(:specs) }
    let(:unmet_dependency_names) { double(:unmet_dependency_names) }

    before do
      allow(subject).to receive(:specs).and_return(specs)
      allow(specs).to receive(:unmet_dependency_names).and_return(unmet_dependency_names)
    end

    it "should return the names of unmet dependencies" 

  end

  describe "#version_message" do
    let(:spec) { double(:spec, :name => "nokogiri", :version => ">= 1.6", :platform => rb) }

    shared_examples_for "the lockfile specs are not relevant" do
      it "should return a string with the spec name and version" 

    end

    context "when there are locked gems" do
      let(:locked_gems) { double(:locked_gems) }

      before { allow(Bundler).to receive(:locked_gems).and_return(locked_gems) }

      context "that contain the relevant gem spec" do
        before do
          specs = double(:specs)
          allow(locked_gems).to receive(:specs).and_return(specs)
          allow(specs).to receive(:find).and_return(locked_gem)
        end

        context "without a version" do
          let(:locked_gem) { double(:locked_gem, :name => "nokogiri", :version => nil) }

          it_behaves_like "the lockfile specs are not relevant"
        end

        context "with the same version" do
          let(:locked_gem) { double(:locked_gem, :name => "nokogiri", :version => ">= 1.6") }

          it_behaves_like "the lockfile specs are not relevant"
        end

        context "with a different version" do
          let(:locked_gem) { double(:locked_gem, :name => "nokogiri", :version => "< 1.5") }

          context "with color" do
            before { Bundler.ui = Bundler::UI::Shell.new }

            it "should return a string with the spec name and version and locked spec version" 

          end

          context "without color" do
            it "should return a string with the spec name and version and locked spec version" 

          end
        end

        context "with a more recent version" do
          let(:spec) { double(:spec, :name => "nokogiri", :version => "1.6.1", :platform => rb) }
          let(:locked_gem) { double(:locked_gem, :name => "nokogiri", :version => "1.7.0") }

          context "with color" do
            before { Bundler.ui = Bundler::UI::Shell.new }

            it "should return a string with the locked spec version in yellow" 

          end
        end

        context "with an older version" do
          let(:spec) { double(:spec, :name => "nokogiri", :version => "1.7.1", :platform => rb) }
          let(:locked_gem) { double(:locked_gem, :name => "nokogiri", :version => "1.7.0") }

          context "with color" do
            before { Bundler.ui = Bundler::UI::Shell.new }

            it "should return a string with the locked spec version in green" 

          end
        end
      end

      context "that do not contain the relevant gem spec" do
        before do
          specs = double(:specs)
          allow(locked_gems).to receive(:specs).and_return(specs)
          allow(specs).to receive(:find).and_return(nil)
        end

        it_behaves_like "the lockfile specs are not relevant"
      end
    end

    context "when there are no locked gems" do
      before { allow(Bundler).to receive(:locked_gems).and_return(nil) }

      it_behaves_like "the lockfile specs are not relevant"
    end
  end

  describe "#can_lock?" do
    context "when the passed spec's source is equivalent" do
      let(:spec) { double(:spec, :source => subject) }

      it "should return true" 

    end

    context "when the passed spec's source is not equivalent" do
      let(:spec) { double(:spec, :source => double(:other_source)) }

      it "should return false" 

    end
  end

  describe "#include?" do
    context "when the passed source is equivalent" do
      let(:source) { subject }

      it "should return true" 

    end

    context "when the passed source is not equivalent" do
      let(:source) { double(:source) }

      it "should return false" 

    end
  end
end


require "guard/compat/test/helper"
require "guard/rspec"

RSpec.describe Guard::RSpec do
  let(:default_options) { Guard::RSpec::Options::DEFAULTS }
  let(:options) { {} }
  let(:plugin) { Guard::RSpec.new(options) }
  let(:runner) { instance_double(Guard::RSpec::Runner) }

  before do
    allow(Guard::Compat::UI).to receive(:info)
    allow(Guard::RSpec::Deprecator).to receive(:warns_about_deprecated_options)
    allow(Guard::RSpec::Runner).to receive(:new) { runner }
  end

  describe ".initialize" do
    it "instanciates with default and custom options" 


    it "instanciates Runner with all default and custom options" 


    it "warns deprecated options" 

  end

  describe "#start" do
    it "doesn't call #run_all by default" 


    context "with all_on_start at true" do
      let(:options) { { all_on_start: true } }

      it "calls #run_all" 

    end
  end

  describe "#run_all" do
    it "runs all specs via runner" 


    it "throws task_has_failed if runner return false" 

  end

  describe "#reload" do
    it "reloads via runner" 

  end

  describe "#run_on_modifications" do
    let(:paths) { %w(path1 path2) }
    it "runs all specs via runner" 


    it "does nothing if paths empty" 


    it "throws task_has_failed if runner return false" 

  end
end


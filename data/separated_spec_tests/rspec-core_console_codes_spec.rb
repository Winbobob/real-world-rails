require 'rspec/core/formatters/console_codes'

RSpec.describe "RSpec::Core::Formatters::ConsoleCodes" do
  let(:console_codes) { RSpec::Core::Formatters::ConsoleCodes }

  describe "#console_code_for(code_or_symbol)" do
    context "when given a VT100 integer code" do
      it "returns the code" 

    end

    context "when given a symbolic name" do
      it "returns the code" 

    end

    context "when given an rspec code" do
      it "returns the console code" 

    end

    context "when given a nonexistant code" do
      it "returns the code for white" 

    end
  end

  describe "#wrap" do
    before do
      allow(RSpec.configuration).to receive(:color_enabled?) { true }
    end

    context "when given a VT100 integer code" do
      it "formats the text with it" 

    end

    context "when given a symbolic color name" do
      it "translates it to the correct integer code and formats the text with it" 

    end

    context "when given an rspec code" do
      it "returns the console code" 

    end


    context "when given :bold" do
      it "formats the text as bold" 

    end
  end
end


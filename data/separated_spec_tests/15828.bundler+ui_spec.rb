# frozen_string_literal: true

RSpec.describe Bundler::UI do
  describe Bundler::UI::Silent do
    it "has the same instance methods as Shell", :ruby => ">= 1.9" 


    it "has the same instance class as Shell", :ruby => ">= 1.9" 

  end

  describe Bundler::UI::Shell do
    let(:options) { {} }
    subject { described_class.new(options) }
    describe "debug?" do
      it "returns a boolean" 

    end
  end
end


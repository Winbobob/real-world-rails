# frozen_string_literal: true

RSpec.describe Bundler::Settings::Validator do
  describe ".validate!" do
    def validate!(key, value, settings)
      transformed_key = Bundler.settings.key_for(key)
      if value.nil?
        settings.delete(transformed_key)
      else
        settings[transformed_key] = value
      end
      described_class.validate!(key, value, settings)
      settings
    end

    it "path and path.system are mutually exclusive" 


    it "a group cannot be in both `with` & `without` simultaneously" 

  end

  describe described_class::Rule do
    let(:keys) { %w[key] }
    let(:description) { "rule description" }
    let(:validate) { proc { raise "validate called!" } }
    subject(:rule) { described_class.new(keys, description, &validate) }

    describe "#validate!" do
      it "calls the block" 

    end

    describe "#fail!" do
      it "raises with a helpful message" 

    end

    describe "#set" do
      it "works when the value has not changed" 


      it "prints out when the value is changing" 

    end
  end
end


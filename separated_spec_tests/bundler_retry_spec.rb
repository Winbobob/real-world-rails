# frozen_string_literal: true

RSpec.describe Bundler::Retry do
  it "return successful result if no errors" 


  it "returns the first valid result" 


  it "raises the last error" 


  it "raises exceptions" 


  context "logging" do
    let(:error)           { Bundler::GemfileNotFound }
    let(:failure_message) { "Retrying test due to error (2/2): #{error} #{error}" }

    context "with debugging on" do
      it "print error message with newline" 

    end

    context "with debugging off" do
      it "print error message with newlines" 

    end
  end
end


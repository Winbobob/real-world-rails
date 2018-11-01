require 'spec_helper'

describe Banzai::Filter::SyntaxHighlightFilter do
  include FilterSpecHelper

  shared_examples "XSS prevention" do |lang|
    it "escapes HTML tags" 

  end

  context "when no language is specified" do
    it "highlights as plaintext" 


    include_examples "XSS prevention", ""
  end

  context "when a valid language is specified" do
    it "highlights as that language" 


    include_examples "XSS prevention", "ruby"
  end

  context "when an invalid language is specified" do
    it "highlights as plaintext" 


    include_examples "XSS prevention", "gnuplot"
  end

  context "languages that should be passed through" do
    %w(math mermaid plantuml).each do |lang|
      context "when #{lang} is specified" do
        it "highlights as plaintext but with the correct language attribute and class" 


        include_examples "XSS prevention", lang
      end
    end
  end

  context "when Rouge lexing fails" do
    before do
      allow_any_instance_of(Rouge::Lexers::Ruby).to receive(:stream_tokens).and_raise(StandardError)
    end

    it "highlights as plaintext" 


    include_examples "XSS prevention", "ruby"
  end

  context "when Rouge lexing fails after a retry" do
    before do
      allow_any_instance_of(Rouge::Lexers::PlainText).to receive(:stream_tokens).and_raise(StandardError)
    end

    it "does not add highlighting classes" 


    include_examples "XSS prevention", "ruby"
  end
end


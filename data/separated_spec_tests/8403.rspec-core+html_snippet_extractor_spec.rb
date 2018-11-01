require 'rspec/core/formatters/html_snippet_extractor'

module RSpec
  module Core
    module Formatters
      RSpec.describe HtmlSnippetExtractor do
        it "falls back on a default message when it doesn't understand a line" 


        it "falls back on a default message when it doesn't find the file" 


        it "falls back on a default message when it gets a security error" 


        describe "snippet extraction" do
          let(:snippet) do
            HtmlSnippetExtractor.new.snippet(["#{__FILE__}:#{__LINE__}"])
          end

          before do
            # `send` is required for 1.8.7...
            @orig_converter = HtmlSnippetExtractor.send(:class_variable_get, :@@converter)
          end

          after do
            HtmlSnippetExtractor.send(:class_variable_set, :@@converter, @orig_converter)
          end

          it 'suggests you install coderay when it cannot be loaded' 


          it 'does not suggest installing coderay normally' 

        end
      end
    end
  end
end


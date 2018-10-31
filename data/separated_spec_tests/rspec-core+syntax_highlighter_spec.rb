require 'rspec/core/formatters/syntax_highlighter'

module RSpec::Core::Formatters
  RSpec.describe SyntaxHighlighter do
    let(:config)      { RSpec::Core::Configuration.new.tap { |config| config.color_mode = :on } }
    let(:highlighter) { SyntaxHighlighter.new(config)  }

    context "when CodeRay is available", :unless => RSpec::Support::OS.windows? do
      before { expect { require 'coderay' }.not_to raise_error }

      it 'highlights the syntax of the provided lines' 


      it 'prefixes the each line with a reset escape code so it can be interpolated in a colored string without affecting the syntax highlighting of the snippet' 


      it 'leaves leading spaces alone so it can be re-indented as needed without the leading reset code interfering' 


      it 'returns the provided lines unmodified if color is disabled' 


      it 'dynamically adjusts to changing color config' 


      it "rescues coderay failures since we do not want a coderay error to be displayed instead of the user's error" 


      it "highlights core RSpec keyword-like methods" 


      it "does not blow up if the coderay constant we update with our keywords is missing" 


      def find_highlighted_terms_in(code_snippet)
        lines = code_snippet.split("\n")
        highlighted = highlighter.highlight(lines)
        highlighted_terms = []

        highlighted.join("\n").scan(/\e\[[1-9]\dm(\w+)\e\[0m/) do |first_capture, _|
          highlighted_terms << first_capture
        end

        highlighted_terms.uniq
      end
    end

    context "when CodeRay is unavailable" do
      before do
        allow(highlighter).to receive(:require).with("coderay").and_raise(LoadError)
      end

      it 'does not highlight the syntax' 


      it 'does not mutate the input array' 


      it 'does not add the comment about coderay if the snippet is only one line as we do not want to convert it to multiline just for the comment' 


      it 'does not add the comment about coderay if given no lines' 


      it 'does not add the comment about coderay if color is disabled even when given a multiline snippet' 


    end

    def be_highlighted
      include("\e[31m")
    end

  end
end


require "active_support/core_ext/string/strip"

describe Qiita::Markdown::SummaryProcessor do
  describe "#call" do
    subject(:html) do
      result[:output].to_s
    end

    let(:context) do
      { hostname: "example.com" }
    end

    let(:markdown) do
      fail NotImplementedError
    end

    let(:result) do
      described_class.new(context).call(markdown)
    end

    context "with valid condition" do
      let(:markdown) do
        <<-EOS.strip_heredoc
          example
        EOS
      end

      it "returns a Hash with HTML output and other metadata but no codes" 

    end

    context "with HTML-characters" do
      let(:markdown) do
        "<>&"
      end

      it "sanitizes them" 

    end

    context "with code" do
      let(:markdown) do
        <<-EOS.strip_heredoc
          ```ruby
          puts 'hello world'
          ```
        EOS
      end

      it "returns simple code element" 

    end

    context "with emoji" do
      let(:markdown) do
        ":+1:"
      end

      it "replaces it with img element" 

    end

    context "with image" do
      let(:markdown) do
        <<-EOS.strip_heredoc
          ![Qiita](http://qiita.com/icons/favicons/public/apple-touch-icon.png)
        EOS
      end

      it "removes it" 

    end

    context "with line breaks" do
      let(:markdown) do
        <<-EOS.strip_heredoc
          foo
          bar
        EOS
      end

      it "removes them" 

    end

    context "with paragraphs" do
      let(:markdown) do
        <<-EOS.strip_heredoc
          Lorem ipsum dolor sit amet.

          Consectetur adipisicing elit.
        EOS
      end

      it "flattens them" 

    end

    context "with normal list items" do
      let(:markdown) do
        <<-EOS.strip_heredoc
          - foo
          - bar
        EOS
      end

      it "flattens them" 

    end

    context "with task list items" do
      let(:markdown) do
        <<-EOS.strip_heredoc
          - [ ] foo
          - [x] bar
        EOS
      end

      it "flattens them without converting to checkboxes" 

    end

    context "with table" do
      let(:markdown) do
        <<-EOS.strip_heredoc
          | a | b | c |
          |---|---|---|
          | a | b | c |
        EOS
      end

      it "removes it entirely" 

    end

    context "with a simple long document" do
      before do
        context[:truncate] = { length: 10 }
      end

      let(:markdown) do
        <<-EOS.strip_heredoc
          Lorem ipsum dolor sit amet.
        EOS
      end

      it "truncates it to the specified length" 

    end

    context "with a long document consisting of nested elements" do
      before do
        context[:truncate] = { length: 12 }
      end

      let(:markdown) do
        <<-EOS.strip_heredoc
          _[Example](http://example.com/) is **a technical knowledge sharing and collaboration platform for programmers**._
        EOS
      end

      it "truncates it while honoring the document structure" 

    end

    context "with a long document including consecutive whitespaces" do
      before do
        context[:truncate] = { length: 10 }
      end

      let(:markdown) do
        <<-EOS.strip_heredoc
          **12**   4 [ 6](http://example.com/)_7
          9_ 123
        EOS
      end

      it "truncates it while counting the consecutive whilespaces as one" 

    end

    context "with truncate: { omission: nil } context" do
      before do
        context[:truncate] = { length: 10, omission: nil }
      end

      let(:markdown) do
        <<-EOS.strip_heredoc
          Lorem ipsum dolor sit amet.
        EOS
      end

      it "does not add extra omission text" 

    end

    context "with mention" do
      let(:markdown) do
        <<-EOS.strip_heredoc
          @alice
        EOS
      end

      it "replaces mention with link" 

    end

    context "with footenote syntax" do
      let(:markdown) do
        <<-EOS.strip_heredoc
          [^1]
          [^1]: test
        EOS
      end

      it "does not generate footnote elements by default" 

    end
  end
end


require "active_support/core_ext/string/strip"

describe Qiita::Markdown::Greenmat::HTMLToCRenderer do
  let(:renderer) { described_class.new(extension) }
  let(:extension) { {} }
  let(:greenmat) { ::Greenmat::Markdown.new(renderer) }
  subject(:rendered_html) { greenmat.render(markdown) }

  context "with duplicated heading names" do
    let(:markdown) do
      <<-EOS.strip_heredoc
        # a
        ## a
        ### a
        ### a
      EOS
    end

    it "renders ToC anchors with unique ids" 

  end

  context "with a document starting with level 2 heading" do
    let(:markdown) do
      <<-EOS.strip_heredoc
        ## a
        ### a
        ## a
      EOS
    end

    it "offsets the heading levels" 

  end

  context "with a document starting with level 2 heading but includes level 1 heading at the end" do
    let(:markdown) do
      <<-EOS.strip_heredoc
        ## a
        ### a
        # a
      EOS
    end

    it "does not generate invalid list structure" 

  end

  context "with heading title including special HTML characters" do
    let(:markdown) do
      <<-EOS.strip_heredoc
        # <b>R&amp;B</b>
      EOS
    end

    it "generates fragment identifier by sanitizing the characters in the title" 

  end

  context "with :escape_html extension" do
    let(:extension) { { escape_html: true } }

    let(:markdown) do
      <<-EOS.strip_heredoc
        # <b>R&amp;B</b>
      EOS
    end

    it "escapes special HTML characters in heading title" 

  end
end


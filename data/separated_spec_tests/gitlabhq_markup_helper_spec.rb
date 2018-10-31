require 'spec_helper'

describe Gitlab::MarkupHelper do
  describe '#markup?' do
    %w(textile rdoc org creole wiki
       mediawiki rst adoc ad asciidoc mdown md markdown).each do |type|
      it "returns true for #{type} files" 

    end

    it 'returns false when given a non-markup filename' 

  end

  describe '#gitlab_markdown?' do
    %w(mdown mkd mkdn md markdown).each do |type|
      it "returns true for #{type} files" 

    end

    it 'returns false when given a non-markdown filename' 

  end

  describe '#asciidoc?' do
    %w(adoc ad asciidoc ADOC).each do |type|
      it "returns true for #{type} files" 

    end

    it 'returns false when given a non-asciidoc filename' 

  end
end


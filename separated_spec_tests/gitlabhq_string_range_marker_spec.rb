require 'spec_helper'

describe Gitlab::StringRangeMarker do
  describe '#mark' do
    def mark_diff(rich = nil)
      raw = 'abc <def>'
      inline_diffs = [2..5]

      described_class.new(raw, rich).mark(inline_diffs) do |text, left:, right:|
        "LEFT#{text}RIGHT"
      end
    end

    context "when the rich text is html safe" do
      let(:rich) { %{<span class="abc">abc</span><span class="space"> </span><span class="def">&lt;def&gt;</span>}.html_safe }

      it 'marks the inline diffs' 

    end

    context "when the rich text is not html safe" do
      context 'when rich text equals raw text' do
        it 'marks the inline diffs' 

      end

      context 'when rich text doeas not equal raw text' do
        let(:rich)  { "abc <def> differs" }

        it 'marks the inline diffs' 

      end
    end
  end
end


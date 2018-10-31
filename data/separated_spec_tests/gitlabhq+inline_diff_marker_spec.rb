require 'spec_helper'

describe Gitlab::Diff::InlineDiffMarker do
  describe '#mark' do
    let(:inline_diffs) { [2..5] }
    let(:raw) { "abc 'def'" }

    subject { described_class.new(raw, rich).mark(inline_diffs) }

    context "when the rich text is html safe" do
      let(:rich) { %{<span class="abc">abc</span><span class="space"> </span><span class="def">&#39;def&#39;</span>}.html_safe }

      it 'marks the range' 

    end

    context "when the text text is not html safe" do
      let(:rich) { "abc 'def' differs" }

      it 'marks the range' 

    end
  end
end


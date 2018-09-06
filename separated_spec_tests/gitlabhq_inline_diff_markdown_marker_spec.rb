require 'spec_helper'

describe Gitlab::Diff::InlineDiffMarkdownMarker do
  describe '#mark' do
    let(:raw) { "abc 'def'" }
    let(:inline_diffs) { [2..5] }
    let(:subject) { described_class.new(raw).mark(inline_diffs, mode: :deletion) }

    it 'does not escape html etities and marks the range' 

  end
end


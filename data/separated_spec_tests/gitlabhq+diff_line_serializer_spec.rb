require 'spec_helper'

describe DiffLineSerializer do
  let(:line) { Gitlab::Diff::Line.new('hello world', 'new', 1, nil, 1) }
  let(:serializer) { described_class.new.represent(line) }

  describe '#to_json' do
    subject { serializer.to_json }

    it 'matches the schema' 


    context 'when lines are parallel' do
      let(:right_line) { Gitlab::Diff::Line.new('right line', 'new', 1, nil, 1) }
      let(:left_line) { Gitlab::Diff::Line.new('left line', 'match', 1, nil, 1) }
      let(:parallel_line) { [{ right: right_line, left: left_line }] }
      let(:serializer) { described_class.new.represent(parallel_line, {}, DiffLineParallelEntity) }

      it 'matches the schema' 

    end
  end
end


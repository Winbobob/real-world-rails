# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Corrector do
  describe '#rewrite' do
    let(:source) do
      <<-RUBY.strip_indent.strip
        true and false
      RUBY
    end
    let(:processed_source) { parse_source(source) }
    let(:node) { processed_source.ast }
    let(:operator) { node.loc.operator }

    def do_rewrite(corrections = nil, &block)
      corrections ||= block
      corrections = [corrections] unless corrections.is_a? Array
      unless corrections.all? { |c| c.is_a?(Proc) }
        raise 'Corrections should be a proc, block or an array of procs'
      end

      described_class.new(processed_source.buffer, corrections).rewrite
    end

    matcher :rewrite_to do |expected|
      supports_block_expectations
      attr_accessor :result
      match { |corrections| (self.result = do_rewrite corrections) == expected }

      failure_message do
        "expected to rewrite to #{expected.inspect}, but got #{result.inspect}"
      end
      failure_message_when_negated do
        "expected not to rewrite to #{expected.inspect}, but did"
      end
    end

    it 'allows removal of a range' 


    it 'allows insertion before a source range' 


    it 'allows insertion after a source range' 


    it 'allows replacement of a range' 


    it 'allows removal of characters preceding range' 


    it 'allows removal of characters from range beginning' 


    it 'allows removal of characters fron range ending' 


    context 'when range is from incorrect source' do
      let(:other_source) { parse_source(source) }
      let(:op_other) do
        Parser::Source::Range.new(other_source.buffer, 0, 2)
      end
      let(:op_string) do
        Parser::Source::Range.new(processed_source.raw_source, 0, 2)
      end

      {
        remove: nil,
        insert_before: ['1'],
        insert_after: ['1'],
        replace: ['1'],
        remove_preceding: [2],
        remove_leading: [2],
        remove_trailing: [2]
      }.each_pair do |method, params|
        it "raises exception from #{method}" 

      end
    end
  end
end


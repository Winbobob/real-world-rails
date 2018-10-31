# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Layout::EmptyLinesAroundBlockBody, :config do
  subject(:cop) { described_class.new(config) }

  # Test blocks using both {} and do..end
  [%w[{ }], %w[do end]].each do |open, close|
    context "when EnforcedStyle is no_empty_lines for #{open} #{close} block" do
      let(:cop_config) { { 'EnforcedStyle' => 'no_empty_lines' } }

      it 'registers an offense for block body starting with a blank' 


      it 'autocorrects block body containing only a blank' 


      it 'registers an offense for block body ending with a blank' 


      it 'accepts block body starting with a line with spaces' 


      it 'is not fooled by single line blocks' 

    end

    context "when EnforcedStyle is empty_lines for #{open} #{close} block" do
      let(:cop_config) { { 'EnforcedStyle' => 'empty_lines' } }

      it 'registers an offense for block body not starting or ending with a ' \
         'blank' do
        inspect_source(["some_method #{open}",
                        '  do_something',
                        close])
        expect(cop.messages).to eq(['Empty line missing at block body '\
                                    'beginning.',
                                    'Empty line missing at block body end.'])
      end

      it 'ignores block with an empty body' 


      it 'autocorrects beginning and end' 


      it 'is not fooled by single line blocks' 

    end
  end
end


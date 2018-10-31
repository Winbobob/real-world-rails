# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Layout::SpaceAroundOperators do
  subject(:cop) { described_class.new(config) }

  let(:config) do
    RuboCop::Config
      .new(
        'Layout/AlignHash' => { 'EnforcedHashRocketStyle' => hash_style },
        'Layout/SpaceAroundOperators' => {
          'AllowForAlignment' => allow_for_alignment
        }
      )
  end
  let(:hash_style) { 'key' }
  let(:allow_for_alignment) { true }

  it 'accepts operator surrounded by tabs' 


  it 'accepts operator symbols' 


  it 'accepts ranges' 


  it 'accepts scope operator' 


  it 'accepts ::Kernel::raise' 


  it 'accepts exclamation point negation' 


  it 'accepts exclamation point definition' 


  it 'accepts a unary' 


  it 'accepts splat operator' 


  it 'accepts def of operator' 


  it 'accepts an operator at the end of a line' 


  it 'accepts an assignment with spaces' 


  it 'accepts an assignment by `for` statement' 


  it 'accepts an operator called with method syntax' 


  it 'accepts operators with spaces' 


  it "accepts some operators that are exceptions & don't need spaces" 


  it 'accepts an assignment followed by newline' 


  it 'accepts an operator at the beginning of a line' 


  it 'registers an offenses for exponent operator with spaces' 


  it 'auto-corrects unwanted space around **' 


  it 'accepts exponent operator without spaces' 


  it 'accepts unary operators without space' 


  it 'accepts [arg] without space' 


  it 'accepts [] without space' 


  it 'accepts []= without space' 


  it 'accepts argument default values without space' 


  it 'accepts the construct class <<self with no space after <<' 


  describe 'missing space around operators' do
    shared_examples 'modifier with missing space' do |keyword|
      it "registers an offense in presence of modifier #{keyword} statement" 

    end

    it 'registers an offense for assignment without space on both sides' 


    it 'auto-corrects assignment without space on both sides' 


    context 'ternary operators' do
      it 'registers an offense for operators with no spaces' 


      it 'registers an offense for operators with just a trailing space' 


      it 'registers an offense for operators with just a leading space' 


      it 'auto-corrects a ternary operator without space' 

    end

    it_behaves_like 'modifier with missing space', 'if'
    it_behaves_like 'modifier with missing space', 'unless'
    it_behaves_like 'modifier with missing space', 'while'
    it_behaves_like 'modifier with missing space', 'until'

    it 'registers an offense for binary operators that could be unary' 


    it 'auto-corrects missing space in binary operators that could be unary' 


    it 'registers an offense for arguments to a method' 


    it 'auto-corrects missing space in arguments to a method' 


    it 'registers an offense for operators without spaces' 


    it 'auto-corrects missing space' 


    it 'registers an offense for a setter call without spaces' 


    context 'when a hash literal is on a single line' do
      before { inspect_source('{ 1=>2, a: b }') }

      context 'and Layout/AlignHash:EnforcedHashRocketStyle is key' do
        let(:hash_style) { 'key' }

        it 'registers an offense for a hash rocket without spaces' 

      end

      context 'and Layout/AlignHash:EnforcedHashRocketStyle is table' do
        let(:hash_style) { 'table' }

        it 'registers an offense for a hash rocket without spaces' 

      end
    end

    context 'when a hash literal is on multiple lines' do
      before do
        inspect_source(<<-RUBY.strip_indent)
          {
            1=>2,
            a: b
          }
        RUBY
      end

      context 'and Layout/AlignHash:EnforcedHashRocketStyle is key' do
        let(:hash_style) { 'key' }

        it 'registers an offense for a hash rocket without spaces' 

      end

      context 'and Layout/AlignHash:EnforcedHashRocketStyle is table' do
        let(:hash_style) { 'table' }

        it "doesn't register an offense for a hash rocket without spaces" 

      end
    end

    it 'registers an offense for match operators without space' 


    it 'registers an offense for various assignments without space' 


    it 'registers an offense for equality operators without space' 


    it 'registers an offense for - without space with negative lhs operand' 


    it 'registers an offense for inheritance < without space' 


    it 'registers an offense for hash rocket without space at rescue' 


    it "doesn't eat a newline when auto-correcting" 


    it "doesn't register an offense for operators with newline on right" 

  end

  describe 'extra space around operators' do
    shared_examples 'modifier with extra space' do |keyword|
      it "registers an offense in presence of modifier #{keyword} statement" 

    end

    it 'registers an offense for assignment with many spaces on either side' 


    it 'auto-corrects assignment with too many spaces on either side' 


    it 'registers an offense for ternary operator with too many spaces' 


    it 'auto-corrects a ternary operator too many spaces' 


    it_behaves_like 'modifier with extra space', 'if'
    it_behaves_like 'modifier with extra space', 'unless'
    it_behaves_like 'modifier with extra space', 'while'
    it_behaves_like 'modifier with extra space', 'until'

    it 'registers an offense for binary operators that could be unary' 


    it 'auto-corrects missing space in binary operators that could be unary' 


    it 'registers an offense for arguments to a method' 


    it 'auto-corrects missing space in arguments to a method' 


    it 'registers an offense for operators with too many spaces' 


    it 'auto-corrects missing space' 


    it 'registers an offense for a setter call with too many spaces' 


    it 'registers an offense for a hash rocket with too many spaces' 


    it 'registers an offense for a hash rocket with an extra space' \
      'on multiple line' do
      inspect_source(<<-RUBY.strip_indent)
        {
          1 =>  2
        }
      RUBY
      expect(cop.messages).to eq(
        ['Operator `=>` should be surrounded by a single space.']
      )
    end

    it 'accepts for a hash rocket with an extra space for alignment' \
      'on multiple line' do
      inspect_source(<<-RUBY.strip_indent)
        {
          1 =>  2,
          11 => 3
        }
      RUBY
      expect(cop.offenses.empty?).to be(true)
    end

    context 'when does not allowed for alignment' do
      let(:allow_for_alignment) { false }

      it 'accepts an extra space' 

    end

    it 'registers an offense for match operators with too many spaces' 


    it 'registers an offense for various assignments with too many spaces' 


    it 'registers an offense for equality operators with too many spaces' 


    it 'registers an offense for - with too many spaces with ' \
       'negative lhs operand' do
      inspect_source('-1  - arg')
      expect(cop.messages)
        .to eq(['Operator `-` should be surrounded by a single space.'])
    end

    it 'registers an offense for inheritance < with too many spaces' 


    it 'registers an offense for hash rocket with too many spaces at rescue' 

  end
end


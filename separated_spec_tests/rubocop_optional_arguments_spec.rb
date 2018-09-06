# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Style::OptionalArguments do
  subject(:cop) { described_class.new }

  let(:message) do
    'Optional arguments should appear at the end of the argument list.'
  end

  it 'registers an offense when an optional argument is followed by a ' \
     'required argument' do
    inspect_source(<<-RUBY.strip_indent)
      def foo(a = 1, b)
      end
    RUBY

    expect(cop.messages).to eq([message])
    expect(cop.highlights).to eq(['a = 1'])
  end

  it 'registers an offense for each optional argument when multiple ' \
     'optional arguments are followed by a required argument' do
    inspect_source(<<-RUBY.strip_indent)
      def foo(a = 1, b = 2, c)
      end
    RUBY

    expect(cop.messages).to eq([message, message])
    expect(cop.highlights).to eq(['a = 1', 'b = 2'])
  end

  it 'allows methods without arguments' 


  it 'allows methods with only one required argument' 


  it 'allows methods with only required arguments' 


  it 'allows methods with only one optional argument' 


  it 'allows methods with only optional arguments' 


  it 'allows methods with multiple optional arguments at the end' 


  context 'named params' do
    context 'with default values' do
      it 'allows optional arguments before an optional named argument' 

    end

    context 'required params' do
      it 'registers an offense for optional arguments that come before ' \
         'required arguments where there are name arguments' do
        inspect_source(<<-RUBY.strip_indent)
          def foo(a = 1, b, c:, d: 4)
          end
        RUBY

        expect(cop.messages).to eq([message])
        expect(cop.highlights).to eq(['a = 1'])
      end

      it 'allows optional arguments before required named arguments' 


      it 'allows optional arguments to come before a mix of required and ' \
         'optional named argument' do
        inspect_source(<<-RUBY.strip_indent)
          def foo(a = 1, b:, c: 3)
          end
        RUBY

        expect(cop.messages.empty?).to be(true)
      end
    end
  end
end

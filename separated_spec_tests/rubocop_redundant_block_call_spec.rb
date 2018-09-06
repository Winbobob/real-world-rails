# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Performance::RedundantBlockCall do
  subject(:cop) { described_class.new }

  it 'autocorrects block.call without arguments' 


  it 'autocorrects block.call with empty parentheses' 


  it 'autocorrects block.call with arguments' 


  it 'autocorrects multiple occurrences of block.call with arguments' 


  it 'autocorrects even when block arg has a different name' 


  it 'accepts a block that is not `call`ed' 


  it 'accepts an empty method body' 


  it 'accepts another block being passed as the only arg' 


  it 'accepts another block being passed along with other args' 


  it 'accepts another block arg in at least one occurrence of block.call' 


  it 'accepts an optional block that is defaulted' 


  it 'accepts an optional block that is overridden' 


  it 'formats the error message for func.call(1) correctly' 


  it 'autocorrects using parentheses when block.call uses parentheses' 


  it 'autocorrects when the result of the call is used in a scope that ' \
     'requires parentheses' do
    source = <<-RUBY.strip_indent
      def method(&block)
        each_with_object({}) do |(key, value), acc|
          acc.merge!(block.call(key) => rhs[value])
        end
      end
    RUBY

    new_source = autocorrect_source(source)

    expect(new_source).to eq(<<-RUBY.strip_indent)
      def method(&block)
        each_with_object({}) do |(key, value), acc|
          acc.merge!(yield(key) => rhs[value])
        end
      end
    RUBY
  end
end


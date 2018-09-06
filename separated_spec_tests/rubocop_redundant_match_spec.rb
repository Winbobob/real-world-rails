# frozen_string_literal: true

#   do_something if str.match(/regex/)
#   while regex.match('str')
#     do_something
#   end
#
#   @good
#   method(str.match(/regex/))
#   return regex.match('str')

RSpec.describe RuboCop::Cop::Performance::RedundantMatch do
  subject(:cop) { described_class.new }

  it 'autocorrects .match in if condition' 


  it 'autocorrects .match in unless condition' 


  it 'autocorrects .match in while condition' 


  it 'autocorrects .match in until condition' 


  it 'autocorrects .match in method body (but not tail position)' 


  it 'does not autocorrect if .match has a string agrgument' 


  it 'does not register an error when return value of .match is passed ' \
     'to another method' do
    inspect_source(<<-RUBY.strip_indent)
      def method(str)
       something(str.match(/regex/))
      end
    RUBY
    expect(cop.messages.empty?).to be(true)
  end

  it 'does not register an error when return value of .match is stored in an ' \
     'instance variable' do
    inspect_source(<<-RUBY.strip_indent)
      def method(str)
       @var = str.match(/regex/)
       true
      end
    RUBY
    expect(cop.messages.empty?).to be(true)
  end

  it 'does not register an error when return value of .match is returned from' \
     ' surrounding method' do
    inspect_source(<<-RUBY.strip_indent)
      def method(str)
       str.match(/regex/)
      end
    RUBY
    expect(cop.messages.empty?).to be(true)
  end

  it 'does not register an offense when match has a block' 


  it 'does not register an error when there is no receiver to the match call' 


  it 'formats error message correctly for something if str.match(/regex/)' 

end


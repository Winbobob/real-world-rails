# frozen_string_literal: true

RSpec.describe RuboCop::Cop::RSpec::EmptyLineAfterExampleGroup do
  subject(:cop) { described_class.new }

  it 'checks for empty line after describe' 


  it 'highlights single line formulations correctly' 


  it 'checks for empty line after context' 


  it 'approves empty line after describe' 


  it 'approves empty line after context' 


  it 'handles describes in an if block' 


  bad_example = <<-RUBY
    RSpec.describe Foo do
      describe '#bar' do
      end
      describe '#baz' do
      end
    end
  RUBY

  good_example = <<-RUBY
    RSpec.describe Foo do
      describe '#bar' do
      end

      describe '#baz' do
      end
    end
  RUBY

  include_examples 'autocorrect',
                   bad_example,
                   good_example
end


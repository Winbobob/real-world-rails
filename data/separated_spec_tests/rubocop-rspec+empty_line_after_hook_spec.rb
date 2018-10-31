# frozen_string_literal: true

RSpec.describe RuboCop::Cop::RSpec::EmptyLineAfterHook do
  subject(:cop) { described_class.new }

  it 'checks for empty line after `before` hook' 


  it 'checks for empty line after `after` hook' 


  it 'checks for empty line after `around` hook' 


  it 'approves empty line after `before` hook' 


  it 'approves empty line after `after` hook' 


  it 'approves empty line after `around` hook' 


  it 'handles multiline `before` block' 


  it 'handles multiline `after` block' 


  it 'handles multiline `around` block' 


  it 'handles `before` being the latest node' 


  bad_example = <<-RUBY
    RSpec.describe User do
      before { do_something }
      it { does_something }
    end
  RUBY

  good_example = <<-RUBY
    RSpec.describe User do
      before { do_something }

      it { does_something }
    end
  RUBY

  include_examples 'autocorrect',
                   bad_example,
                   good_example
end


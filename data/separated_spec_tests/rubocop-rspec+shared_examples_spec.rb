# frozen_string_literal: true

RSpec.describe RuboCop::Cop::RSpec::SharedExamples do
  subject(:cop) { described_class.new }

  it 'registers an offense when using symbolic title' 


  it 'does not register an offense when using string title' 


  it 'does not register an offense when using Module/Class title' 


  include_examples 'autocorrect',
                   'it_behaves_like :foo_bar_baz',
                   "it_behaves_like 'foo bar baz'"
  include_examples 'autocorrect',
                   'it_should_behave_like :foo_bar_baz',
                   "it_should_behave_like 'foo bar baz'"
  include_examples 'autocorrect',
                   'shared_examples :foo_bar_baz',
                   "shared_examples 'foo bar baz'"
  include_examples 'autocorrect',
                   'shared_examples_for :foo_bar_baz',
                   "shared_examples_for 'foo bar baz'"
  include_examples 'autocorrect',
                   'include_examples :foo_bar_baz',
                   "include_examples 'foo bar baz'"
  include_examples 'autocorrect',
                   "include_examples :foo_bar_baz, 'foo', 'bar'",
                   "include_examples 'foo bar baz', 'foo', 'bar'"

  bad_code_with_block = <<-RUBY
    shared_examples :foo_bar_baz, 'foo', 'bar' do |param|
      # ...
    end
  RUBY

  good_code_with_block = <<-RUBY
    shared_examples 'foo bar baz', 'foo', 'bar' do |param|
      # ...
    end
  RUBY

  include_examples 'autocorrect', bad_code_with_block, good_code_with_block
end


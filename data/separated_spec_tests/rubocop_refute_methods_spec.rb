# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Rails::RefuteMethods do
  subject(:cop) { described_class.new }

  it 'registers an offense when using `refute` with a single argument' 


  it 'registers an offense when using `refute` with multiple arguments' 


  it 'registers an offense when using `refute_empty`' 


  it 'autocorrects `refute` with a single argument' 


  it 'autocorrects `refute` with multiple arguments' 


  it 'does not registers an offense when using `assert_not` ' \
     'with a single argument' do
    expect_no_offenses(<<-RUBY.strip_indent)
      assert_not foo
    RUBY
  end

  it 'does not registers an offense when using `assert_not` ' \
     'with a multiple arguments' do
    expect_no_offenses(<<-RUBY.strip_indent)
      assert_not foo, bar, baz
    RUBY
  end
end


# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Lint::SplatKeywordArguments, :config do
  subject(:cop) { described_class.new(config) }

  it 'registers an offense when using splat keyword arguments' 


  it 'registers an offense when using splat keyword arguments ' \
     'with other arguments' do
    expect_offense(<<-RUBY.strip_indent)
      do_something('foo', **arguments, key: :value)
                          ^^^^^^^^^^^ Do not use splat keyword arguments as a single Hash.
    RUBY
  end

  it 'registers an offense when using splat keyword arguments twice' 


  it 'does not register an offense when using non-splat keyword arguments' 

end


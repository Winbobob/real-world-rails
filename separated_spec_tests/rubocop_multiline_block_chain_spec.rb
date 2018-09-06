# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Style::MultilineBlockChain do
  subject(:cop) { described_class.new }

  context 'with multi-line block chaining' do
    it 'registers an offense for a simple case' 


    it 'registers an offense for a slightly more complicated case' 


    it 'registers two offenses for a chain of three blocks' 


    it 'registers an offense for a chain where the second block is ' \
       'single-line' do
      expect_offense(<<-RUBY.strip_indent)
        Thread.list.find_all { |t|
          t.alive?
        }.map { |thread| thread.object_id }
        ^^^^^ Avoid multi-line chains of blocks.
      RUBY
    end

    it 'accepts a chain where the first block is single-line' 

  end

  it 'accepts a chain of blocks spanning one line' 


  it 'accepts a multi-line block chained with calls on one line' 


  it 'accepts a chain of calls followed by a multi-line block' 

end


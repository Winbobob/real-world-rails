# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Lint::Void do
  subject(:cop) { described_class.new(config) }

  let(:config) { RuboCop::Config.new }

  described_class::BINARY_OPERATORS.each do |op|
    it "registers an offense for void op #{op} if not on last line" 

  end

  described_class::BINARY_OPERATORS.each do |op|
    it "accepts void op #{op} if on last line" 

  end

  described_class::BINARY_OPERATORS.each do |op|
    it "accepts void op #{op} by itself without a begin block" 

  end

  unary_operators = %i[+ - ~ !]
  unary_operators.each do |op|
    it "registers an offense for void op #{op} if not on last line" 

  end

  unary_operators.each do |op|
    it "accepts void op #{op} if on last line" 

  end

  unary_operators.each do |op|
    it "accepts void op #{op} by itself without a begin block" 

  end

  %w[var @var @@var VAR $var].each do |var|
    it "registers an offense for void var #{var} if not on last line" 

  end

  %w(1 2.0 :test /test/ [1] {}).each do |lit|
    it "registers an offense for void lit #{lit} if not on last line" 

  end

  it 'registers an offense for void `self` if not on last line' 


  it 'registers an offense for void `defined?` if not on last line' 


  context 'when checking for methods with no side effects' do
    let(:config) do
      RuboCop::Config.new(
        'Lint/Void' => {
          'CheckForMethodsWithNoSideEffects' => true
        }
      )
    end

    it 'registers an offense if not on last line' 


    it 'registers an offense for chained methods' 

  end

  context 'when not checking for methods with no side effects' do
    let(:config) do
      RuboCop::Config.new(
        'Lint/Void' => {
          'CheckForMethodsWithNoSideEffects' => false
        }
      )
    end

    it 'does not register an offense for void nonmutating methods' 

  end

  it 'registers an offense for void literal in a method definition' 


  it 'registers two offenses for void literals in an initialize method' 


  it 'registers two offenses for void literals in a setter method' 


  it 'registers two offenses for void literals in a `#each` method' 


  it 'handles `#each` block with single expression' 


  it 'handles empty block' 


  it 'registers two offenses for void literals in `#tap` method' 


  it 'registers two offenses for void literals in a `for`' 


  it 'handles explicit begin blocks' 


  it 'accepts short call syntax' 


  it 'accepts backtick commands' 


  it 'accepts percent-x commands' 

end


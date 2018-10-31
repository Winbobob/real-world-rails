# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Style::MultipleComparison do
  subject(:cop) { described_class.new(config) }

  let(:config) { RuboCop::Config.new }

  it 'does not register an offense for comparing an lvar' 


  it 'registers an offense when `a` is compared twice' 


  it 'registers an offense when `a` is compared three times' 


  it 'registers an offense when `a` is compared three times on the right ' \
    'hand side' do
    inspect_source(['a = "a"',
                    'if "a" == a || "b" == a || "c" == a',
                    '  print a',
                    'end'])
    expect(cop.offenses.size).to eq(1)
  end

  it 'registers an offense when `a` is compared three times, once on the ' \
    'righthand side' do
    inspect_source(['a = "a"',
                    'if a == "a" || "b" == a || a == "c"',
                    '  print a',
                    'end'])
    expect(cop.offenses.size).to eq(1)
  end

  it 'does not register an offense for comparing multiple literal strings' 


  it 'does not register an offense for comparing multiple int literals' 


  it 'does not register an offense for comparing lvars' 


  it 'does not register an offense for comparing lvars when a string is ' \
    'on the lefthand side' do
    inspect_source(['a = "a"',
                    'b = "b"',
                    'if a == "a" || "b" == b',
                    '  print a',
                    'end'])
    expect(cop.offenses.empty?).to be(true)
  end

  it 'does not register an offense for a == b || b == a' 


  it 'does not register an offense for a duplicated condition' 


  it 'does not register an offense for Array#include?' 

end


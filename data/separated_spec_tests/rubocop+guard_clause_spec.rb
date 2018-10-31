# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Style::GuardClause, :config do
  let(:cop) { described_class.new(config) }
  let(:cop_config) { {} }

  shared_examples 'reports offense' do |body|
    it 'reports an offense if method body is if / unless without else' 


    it 'reports an offense if method body ends with if / unless without else' 

  end

  it_behaves_like('reports offense', 'work')
  it_behaves_like('reports offense', '# TODO')

  it 'does not report an offense if body is if..elsif..end' 


  it "doesn't report an offense if condition has multiple lines" 


  it 'accepts a method which body is if / unless with else' 


  it 'accepts a method which body does not end with if / unless' 


  it 'accepts a method whose body is a modifier if / unless' 


  context 'MinBodyLength: 1' do
    let(:cop_config) do
      { 'MinBodyLength' => 1 }
    end

    it 'reports an offense for if whose body has 1 line' 

  end

  context 'MinBodyLength: 4' do
    let(:cop_config) do
      { 'MinBodyLength' => 4 }
    end

    it 'accepts a method whose body has 3 lines' 

  end

  context 'Invalid MinBodyLength' do
    let(:cop_config) do
      { 'MinBodyLength' => -2 }
    end

    it 'fails with an error' 

  end

  shared_examples 'on if nodes which exit current scope' do |kw|
    it "registers an error with #{kw} in the if branch" 


    it "registers an error with #{kw} in the else branch" 


    it "doesn't register an error if condition has multiple lines" 


    it "does not report an offense if #{kw} is inside elsif" 


    it "does not report an offense if #{kw} is inside if..elsif..else..end" 


    it "doesn't register an error if control flow expr has multiple lines" 


    it 'registers an error if non-control-flow branch has multiple lines' 

  end

  include_examples('on if nodes which exit current scope', 'return')
  include_examples('on if nodes which exit current scope', 'next')
  include_examples('on if nodes which exit current scope', 'break')
  include_examples('on if nodes which exit current scope', 'raise "error"')

  context 'method in module' do
    it 'registers an offense for instance method' 


    it 'registers an offense for singleton methods' 

  end
end


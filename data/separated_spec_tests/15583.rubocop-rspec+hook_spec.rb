# frozen_string_literal: true

RSpec.describe RuboCop::RSpec::Hook do
  include RuboCop::AST::Sexp

  def hook(source)
    described_class.new(parse_source(source).ast)
  end

  it 'extracts name' 


  it 'does not break if a hook is not given a symbol literal' 


  it 'knows the scope of a hook with a symbol literal' 


  it 'ignores other arguments to hooks' 


  it 'classifies nonstandard hook arguments as invalid' 


  it 'classifies :each as a valid hook argument' 


  it 'classifies :each as an example hook' 


  shared_examples 'standardizes scope' do |source, scope|
    it "interprets #{source} as having scope #{scope}" 

  end

  include_examples 'standardizes scope', 'before(:each) { }',    :each
  include_examples 'standardizes scope', 'around(:example) { }', :each
  include_examples 'standardizes scope', 'after { }',            :each

  include_examples 'standardizes scope', 'before(:all) { }',     :context
  include_examples 'standardizes scope', 'around(:context) { }', :context

  include_examples 'standardizes scope', 'after(:suite) { }', :suite
end


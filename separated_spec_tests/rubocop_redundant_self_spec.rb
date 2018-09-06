# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Style::RedundantSelf do
  subject(:cop) { described_class.new }

  it 'reports an offense a self receiver on an rvalue' 


  it 'does not report an offense when receiver and lvalue have the same name' 


  it 'accepts a self receiver on an lvalue of an assignment' 


  it 'accepts a self receiver on an lvalue of a parallel assignment' 


  it 'accepts a self receiver on an lvalue of an or-assignment' 


  it 'accepts a self receiver on an lvalue of an and-assignment' 


  it 'accepts a self receiver on an lvalue of a plus-assignment' 


  it 'accepts a self receiver with the square bracket operator' 


  it 'accepts a self receiver with the double less-than operator' 


  it 'accepts a self receiver for methods named like ruby keywords' 


  it 'accepts a self receiver used to distinguish from argument of block' 


  describe 'instance methods' do
    it 'accepts a self receiver used to distinguish from blockarg' 


    it 'accepts a self receiver used to distinguish from argument' 


    it 'accepts a self receiver used to distinguish from optional argument' 


    it 'accepts a self receiver used to distinguish from local variable' 


    it 'accepts a self receiver used to distinguish from an argument' 


    it 'accepts a self receiver used to distinguish from an argument' \
      ' when an inner method is defined' do
      src = <<-RUBY.strip_indent
        def foo(bar)
          def inner_method(); end
          puts bar, self.bar
        end
      RUBY
      inspect_source(src)
      expect(cop.offenses.empty?).to be(true)
    end
  end

  describe 'class methods' do
    it 'accepts a self receiver used to distinguish from blockarg' 


    it 'accepts a self receiver used to distinguish from argument' 


    it 'accepts a self receiver used to distinguish from optional argument' 


    it 'accepts a self receiver used to distinguish from local variable' 

  end

  it 'accepts a self receiver used to distinguish from constant' 


  it 'accepts a self receiver of .()' 


  it 'reports an offence a self receiver of .call' 


  it 'auto-corrects by removing redundant self' 

end


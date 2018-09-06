# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Lint::LiteralAsCondition do
  subject(:cop) { described_class.new }

  %w(1 2.0 [1] {} :sym :"#{a}").each do |lit|
    it "registers an offense for literal #{lit} in if" 


    it "registers an offense for literal #{lit} in while" 


    it "registers an offense for literal #{lit} in post-loop while" 


    it "registers an offense for literal #{lit} in until" 


    it "registers an offense for literal #{lit} in post-loop until" 


    it "registers an offense for literal #{lit} in case" 


    it "registers an offense for literal #{lit} in a when " \
       'of a case without anything after case keyword' do
      inspect_source(<<-RUBY.strip_indent)
        case
        when #{lit} then top
        end
      RUBY
      expect(cop.offenses.size).to eq(1)
    end

    it "accepts literal #{lit} in a when of a case with " \
       'something after case keyword' do
      inspect_source(<<-RUBY.strip_indent)
        case x
        when #{lit} then top
        end
      RUBY
      expect(cop.offenses.empty?).to be(true)
    end

    it "registers an offense for literal #{lit} in &&" 


    it "registers an offense for literal #{lit} in complex cond" 


    it "registers an offense for literal #{lit} in !" 


    it "registers an offense for literal #{lit} in complex !" 


    it "accepts literal #{lit} if it's not an and/or operand" 


    it "accepts literal #{lit} in non-toplevel and/or" 


    it "registers an offense for `!#{lit}`" 


    it "registers an offense for `not #{lit}`" 

  end

  it 'accepts array literal in case, if it has non-literal elements' 


  it 'accepts array literal in case, if it has nested non-literal element' 


  it 'registers an offense for case with a primitive array condition' 


  it 'accepts dstr literal in case' 

end


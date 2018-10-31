# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Style::ParenthesesAroundCondition, :config do
  subject(:cop) { described_class.new(config) }

  let(:cop_config) { { 'AllowSafeAssignment' => true } }

  it 'registers an offense for parentheses around condition' 


  it 'accepts parentheses if there is no space between the keyword and (.' 


  it 'auto-corrects parentheses around condition' 


  it 'accepts condition without parentheses' 


  it 'accepts parentheses around condition in a ternary' 


  it 'is not confused by leading parentheses in subexpression' 


  it 'is not confused by unbalanced parentheses' 


  %w[rescue if unless while until].each do |op|
    it "allows parens if the condition node is a modifier #{op} op" 

  end

  it 'does not blow up when the condition is a ternary op' 


  it 'does not blow up for empty if condition' 


  it 'does not blow up for empty unless condition' 


  context 'safe assignment is allowed' do
    it 'accepts variable assignment in condition surrounded with parentheses' 


    it 'accepts element assignment in condition surrounded with parentheses' 


    it 'accepts setter in condition surrounded with parentheses' 

  end

  context 'safe assignment is not allowed' do
    let(:cop_config) { { 'AllowSafeAssignment' => false } }

    it 'does not accept variable assignment in condition surrounded with ' \
       'parentheses' do
      expect_offense(<<-RUBY.strip_indent)
        if (test = 10)
           ^^^^^^^^^^^ Don't use parentheses around the condition of an `if`.
        end
      RUBY
    end

    it 'does not accept element assignment in condition surrounded with ' \
       'parentheses' do
      expect_offense(<<-RUBY.strip_indent)
        if (test[0] = 10)
           ^^^^^^^^^^^^^^ Don't use parentheses around the condition of an `if`.
        end
      RUBY
    end
  end

  context 'parentheses in multiline conditions are allowed' do
    let(:cop_config) { { 'AllowInMultilineConditions' => true } }

    it 'accepts parentheses around multiline condition' 


    it 'registers an offense for parentheses in single line condition' 

  end

  context 'parentheses in multiline conditions are not allowed' do
    let(:cop_config) { { 'AllowInMultilineConditions' => false } }

    it 'registers an offense for parentheses around multiline condition' 

  end
end


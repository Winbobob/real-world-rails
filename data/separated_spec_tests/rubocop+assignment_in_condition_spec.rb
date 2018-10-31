# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Lint::AssignmentInCondition, :config do
  subject(:cop) { described_class.new(config) }

  let(:cop_config) { { 'AllowSafeAssignment' => true } }

  it 'registers an offense for lvar assignment in condition' 


  it 'registers an offense for lvar assignment in while condition' 


  it 'registers an offense for lvar assignment in until condition' 


  it 'registers an offense for ivar assignment in condition' 


  it 'registers an offense for clvar assignment in condition' 


  it 'registers an offense for gvar assignment in condition' 


  it 'registers an offense for constant assignment in condition' 


  it 'registers an offense for collection element assignment in condition' 


  it 'accepts == in condition' 


  it 'registers an offense for assignment after == in condition' 


  it 'accepts = in a block that is called in a condition' 


  it 'accepts = in a block followed by method call' 


  it 'accepts ||= in condition' 


  it 'registers an offense for assignment after ||= in condition' 


  it 'registers an offense for assignment methods' 


  it 'does not blow up for empty if condition' 


  it 'does not blow up for empty unless condition' 


  context 'safe assignment is allowed' do
    it 'accepts = in condition surrounded with braces' 


    it 'accepts []= in condition surrounded with braces' 

  end

  context 'safe assignment is not allowed' do
    let(:cop_config) { { 'AllowSafeAssignment' => false } }

    it 'does not accept = in condition surrounded with braces' 


    it 'does not accept []= in condition surrounded with braces' 

  end
end


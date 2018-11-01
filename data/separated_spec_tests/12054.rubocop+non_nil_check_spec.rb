# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Style::NonNilCheck, :config do
  subject(:cop) { described_class.new(config) }

  context 'when not allowing semantic changes' do
    let(:cop_config) do
      {
        'IncludeSemanticChanges' => false
      }
    end

    it 'registers an offense for != nil' 


    it 'does not register an offense for != 0' 


    it 'does not register an offense for !x.nil?' 


    it 'does not register an offense for not x.nil?' 


    it 'does not register an offense if only expression in predicate' 


    it 'does not register an offense if only expression in class predicate' 


    it 'does not register an offense if last expression in predicate' 


    it 'does not register an offense if last expression in class predicate' 


    it 'autocorrects by changing `!= nil` to `!x.nil?`' 


    it 'does not autocorrect by removing non-nil (!x.nil?) check' 


    it 'does not blow up when autocorrecting implicit receiver' 


    it 'does not report corrected when the code was not modified' 

  end

  context 'when allowing semantic changes' do
    subject(:cop) { described_class.new(config) }

    let(:cop_config) do
      {
        'IncludeSemanticChanges' => true
      }
    end

    it 'registers an offense for `!x.nil?`' 


    it 'registers an offense for unless x.nil?' 


    it 'does not register an offense for `x.nil?`' 


    it 'does not register an offense for `!x`' 


    it 'registers an offense for `not x.nil?`' 


    it 'does not blow up with ternary operators' 


    it 'autocorrects by changing unless x.nil? to if x' 


    it 'autocorrects by changing `x != nil` to `x`' 


    it 'autocorrects by changing `!x.nil?` to `x`' 


    it 'does not blow up when autocorrecting implicit receiver' 


    it 'corrects code that would not be modified if ' \
       'IncludeSemanticChanges were false' do
      corrected = autocorrect_source('return nil unless (line =~ //) != nil')

      expect(corrected).to eq('return nil unless (line =~ //)')
    end
  end
end


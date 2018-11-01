# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Layout::RescueEnsureAlignment, :config do
  subject(:cop) { described_class.new(config) }

  it 'accepts the modifier form' 


  context 'rescue with begin' do
    it 'registers an offense' 


    it 'corrects the alignment' 

  end

  context 'rescue with def' do
    it 'registers an offense' 


    it 'corrects the alignment' 

  end

  context 'rescue with defs' do
    it 'registers an offense' 


    it 'corrects the alignment' 

  end

  context 'rescue with class' do
    it 'registers an offense when rescue used with class' 


    it 'corrects the alignment' 

  end

  context 'rescue with module' do
    it 'registers an offense when rescue used with module' 


    it 'corrects the alignment' 

  end

  context 'ensure with begin' do
    it 'registers an offense when ensure used with begin' 


    it 'corrects the alignment' 

  end

  context 'ensure with def' do
    it 'registers an offense' 


    it 'corrects the alignment' 

  end

  context 'ensure with defs' do
    it 'registers an offense' 


    it 'corrects the alignment' 

  end

  context 'ensure with class' do
    it 'registers an offense' 


    it 'corrects the alignment' 

  end

  context 'ensure with module' do
    it 'registers an offense when ensure used with module' 


    it 'corrects the alignment' 

  end

  it 'accepts end being misaligned' 


  it 'accepts rescue and ensure on the same line' 


  it 'accepts correctly aligned rescue' 


  it 'accepts correctly aligned ensure' 


  context '>= Ruby 2.5', :ruby25 do
    it 'accepts aligned rescue in do-end block' 


    it 'accepts aligned rescue in do-end block in a method' 


    context 'rescue with do-end block' do
      it 'registers an offense' 


      it 'corrects the alignment' 

    end
  end

  describe 'excluded file' do
    subject(:cop) { described_class.new(config) }

    let(:config) do
      RuboCop::Config.new('Layout/RescueEnsureAlignment' =>
                          { 'Enabled' => true,
                            'Exclude' => ['**/**'] })
    end

    it 'processes excluded files with issue' 

  end

  context 'allows inline access modifier' do
    let(:cop_config) do
      {
        'Style/AccessModifierDeclarations' =>
          { 'EnforcedStyle' => 'inline' }
      }
    end

    context 'rescue with def' do
      it 'registers an offense' 


      it 'correct alignment' 


      it 'corrects the alignment' 

    end

    context 'rescue with defs' do
      it 'registers an offense' 


      it 'correct alignment' 


      it 'corrects the alignment' 

    end

    context 'ensure with def' do
      it 'registers an offense' 


      it 'correct alignment' 


      it 'corrects the alignment' 

    end

    context 'ensure with defs' do
      it 'registers an offense' 


      it 'correct alignment' 


      it 'corrects the alignment' 

    end
  end

  context 'allows inline expression before' do
    context 'rescue' do
      it 'registers an offense' 


      it 'does not correct alignment' 

    end

    context 'ensure' do
      it 'registers an offense' 


      it 'does not correct alignment' 

    end
  end
end


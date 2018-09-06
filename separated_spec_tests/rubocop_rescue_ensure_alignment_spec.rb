# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Layout::RescueEnsureAlignment, :config do
  subject(:cop) { described_class.new(config) }

  shared_examples 'common behavior' do |keyword|
    context 'bad alignment' do
      it 'registers an offense when used with begin' 


      it 'registers an offense when used with def' 


      it 'registers an offense when used with defs' 


      it 'registers an offense when used with class' 


      it 'registers an offense when used with module' 


      it 'accepts rescue and ensure on the same line' 


      it 'auto-corrects' 

    end

    it 'accepts correct alignment' 


    context '>= Ruby 2.5', :ruby25 do
      it "accepts aligned #{keyword} in do-end block" 


      it "accepts aligned #{keyword} in do-end block in a method" 


      it "registers an offense for not aligned #{keyword} in do-end block" 

    end
  end

  context 'rescue' do
    it_behaves_like 'common behavior', 'rescue'

    it 'accepts the modifier form' 

  end

  context 'ensure' do
    it_behaves_like 'common behavior', 'ensure'
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
end


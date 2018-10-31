# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Style::RescueModifier do
  subject(:cop) { described_class.new(config) }

  let(:config) do
    RuboCop::Config.new('Layout/IndentationWidth' => {
                          'Width' => 2
                        })
  end

  it 'registers an offense for modifier rescue' 


  it 'registers an offense for modifier rescue around parallel assignment' 


  it 'handles more complex expression with modifier rescue' 


  it 'handles modifier rescue in normal rescue' 


  it 'handles modifier rescue in a method' 


  it 'does not register an offense for normal rescue' 


  it 'does not register an offense for normal rescue with ensure' 


  it 'does not register an offense for nested normal rescue' 


  context 'when an instance method has implicit begin' do
    it 'accepts normal rescue' 


    it 'handles modifier rescue in body of implicit begin' 

  end

  context 'when a singleton method has implicit begin' do
    it 'accepts normal rescue' 


    it 'handles modifier rescue in body of implicit begin' 

  end

  context 'autocorrect' do
    it 'corrects basic rescue modifier' 


    it 'corrects complex rescue modifier' 


    it 'corrects rescue modifier nested inside of def' 


    it 'corrects nested rescue modifier' 


    it 'corrects doubled rescue modifiers' 

  end

  describe 'excluded file' do
    subject(:cop) { described_class.new(config) }

    let(:config) do
      RuboCop::Config.new('Style/RescueModifier' =>
                          { 'Enabled' => true,
                            'Exclude' => ['**/**'] })
    end

    it 'processes excluded files with issue' 

  end
end


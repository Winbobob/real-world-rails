# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Naming::UncommunicativeBlockParamName, :config do
  subject(:cop) { described_class.new(config) }

  let(:cop_config) do
    {
      'MinNameLength' => 2,
      'AllowNamesEndingInNumbers' => false
    }
  end

  it 'does not register for block without parameters' 


  it 'does not register for brace block without parameters' 


  it 'does not register offense for valid parameter names' 


  it 'registers offense when param ends in number' 


  it 'registers offense when param is less than minimum length' 


  it 'registers offense when param contains uppercase characters' 


  it 'can register multiple offenses in one block' 


  context 'with AllowedNames' do
    let(:cop_config) do
      {
        'AllowedNames' => %w[foo1 foo2],
        'AllowNamesEndingInNumbers' => false
      }
    end

    it 'accepts specified block param names' 


    it 'registers unlisted offensive names' 

  end

  context 'with ForbiddenNames' do
    let(:cop_config) do
      {
        'ForbiddenNames' => %w[arg]
      }
    end

    it 'registers offense for param listed as forbidden' 


    it "accepts param that uses a forbidden name's letters" 

  end

  context 'with AllowNamesEndingInNumbers' do
    let(:cop_config) do
      {
        'AllowNamesEndingInNumbers' => true
      }
    end

    it 'accept params that end in numbers' 

  end
end


# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Naming::UncommunicativeMethodParamName, :config do
  subject(:cop) { described_class.new(config) }

  let(:cop_config) do
    {
      'MinNameLength' => 3,
      'AllowNamesEndingInNumbers' => false
    }
  end

  it 'does not register for method without parameters' 


  it 'does not register offense for valid parameter names' 


  it 'does not register offense for valid parameter names on self.method' 


  it 'does not register offense for valid default parameters' 


  it 'does not register offense for valid keyword parameters' 


  it 'does not register offense for empty restarg' 


  it 'does not register offense for empty kwrestarg' 


  it 'registers offense when parameter ends in number' 


  it 'registers offense when parameter ends in number on class method' 


  it 'registers offense when parameter is less than minimum length' 


  it 'registers offense when parameter contains uppercase characters' 


  it 'registers offense for offensive default parameter' 


  it 'registers offense for offensive keyword parameters' 


  it 'can register multiple offenses in one method definition' 


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

    it 'registers offense for parameter listed as forbidden' 


    it "accepts parameter that uses a forbidden name's letters" 

  end

  context 'with AllowNamesEndingInNumbers' do
    let(:cop_config) do
      {
        'AllowNamesEndingInNumbers' => true
      }
    end

    it 'accept parameters that end in numbers' 

  end
end


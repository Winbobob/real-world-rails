# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Style::DateTime, :config do
  subject(:cop) { described_class.new(config) }

  let(:cop_config) { { 'AllowCoercion' => false } }

  it 'registers an offense when using DateTime for current time' 


  it 'registers an offense when using ::DateTime for current time' 


  it 'registers an offense when using DateTime for modern date' 


  it 'does not register an offense when using Time for current time' 


  it 'does not register an offense when using Date for modern date' 


  it 'does not register an offense when using DateTime for historic date' 


  it 'does not register an offense when using DateTime in another namespace' 


  describe 'when configured to not allow #to_datetime' do
    before { cop_config['AllowCoercion'] = false }

    it 'registers an offense' 

  end

  describe 'when configured to allow #to_datetime' do
    before { cop_config['AllowCoercion'] = true }

    it 'does not register an offense' 

  end
end


# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Performance::ReverseEach do
  subject(:cop) { described_class.new }

  it 'registers an offense when each is called on reverse' 


  it 'registers an offense when each is called on reverse on a variable' 


  it 'registers an offense when each is called on reverse on a method call' 


  it 'does not register an offense when reverse is used without each' 


  it 'does not register an offense when each is used without reverse' 


  context 'autocorrect' do
    it 'corrects reverse.each to reverse_each' 


    it 'corrects reverse.each to reverse_each on a variable' 


    it 'corrects reverse.each to reverse_each on a method call' 

  end
end


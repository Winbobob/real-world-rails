# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Performance::Caller do
  subject(:cop) { described_class.new }

  it 'accepts `caller` without argument and method chain' 


  it 'accepts `caller` with arguments' 


  it 'accepts `caller_locations` without argument and method chain' 


  it 'registers an offense when :first is called on caller' 


  it 'registers an offense when :first is called on caller with 1' 


  it 'registers an offense when :first is called on caller with 2' 


  it 'registers an offense when :[] is called on caller' 


  it 'registers an offense when :[] is called on caller with 1' 


  it 'registers an offense when :[] is called on caller with 2' 


  it 'registers an offense when :first is called on caller_locations also' 


  it 'registers an offense when :[] is called on caller_locations also' 

end


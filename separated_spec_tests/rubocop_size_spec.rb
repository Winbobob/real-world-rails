# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Performance::Size do
  subject(:cop) { described_class.new }

  it 'does not register an offense when calling count ' \
     'as a stand alone method' do
    inspect_source('count(items)')

    expect(cop.messages.empty?).to be(true)
  end

  it 'does not register an offense when calling count on an object ' \
     'other than an array or a hash' do
    inspect_source('object.count(items)')

    expect(cop.messages.empty?).to be(true)
  end

  describe 'on array' do
    it 'registers an offense when calling count' 


    it 'registers an offense when calling count on to_a' 


    it 'registers an offense when calling count on Array[]' 


    it 'does not register an offense when calling size' 


    it 'does not register an offense when calling another method' 


    it 'does not register an offense when calling count with a block' 


    it 'does not register an offense when calling count with a to_proc block' 


    it 'does not register an offense when calling count with an argument' 


    it 'corrects count to size' 


    it 'corrects count to size on to_a' 


    it 'corrects count to size on Array[]' 

  end

  describe 'on hash' do
    it 'registers an offense when calling count' 


    it 'registers an offense when calling count on to_h' 


    it 'registers an offense when calling count on Hash[]' 


    it 'does not register an offense when calling size' 


    it 'does not register an offense when calling another method' 


    it 'does not register an offense when calling count with a block' 


    it 'does not register an offense when calling count with a to_proc block' 


    it 'does not register an offense when calling count with an argument' 


    it 'corrects count to size' 


    it 'corrects count to size on to_h' 


    it 'corrects count to size on Hash[]' 

  end
end


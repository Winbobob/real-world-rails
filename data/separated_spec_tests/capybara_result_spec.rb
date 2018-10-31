# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Capybara::Result do
  let :string do
    Capybara.string <<-STRING
      <ul>
        <li>Alpha</li>
        <li>Beta</li>
        <li>Gamma</li>
        <li>Delta</li>
      </ul>
    STRING
  end

  let :result do
    string.all '//li', minimum: 0 # pass minimum: 0 so lazy evaluation doesn't get triggered yet
  end

  it "has a length" 


  it "has a first element" 


  it "has a last element" 


  it 'can supports values_at method' 


  it "can return an element by its index" 


  it "can be mapped" 


  it "can be selected" 


  it "can be reduced" 


  it 'can be sampled' 


  it 'can be indexed' 


  it 'supports all modes of []' 


  it 'works with filter blocks' 


  it 'should catch invalid element errors during filtering' 


  it 'should return non-invalid element errors during filtering' 


  # Not a great test but it indirectly tests what is needed
  it "should evaluate filters lazily for idx" 


  it "should evaluate filters lazily for range" 


  it "should evaluate filters lazily for idx and length" 


  it "should evaluate all elements when #to_a called" 


  context '#each' do
    it 'lazily evaluates' 


    context 'without a block' do
      it 'returns an iterator' 


      it 'lazily evaluates' 

    end
  end

  context 'lazy select' do
    it 'is compatible' 

  end
end


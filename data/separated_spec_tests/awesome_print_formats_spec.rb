require 'spec_helper'
require 'bigdecimal'
require 'rational'
require 'set'

RSpec.describe 'AwesomePrint' do
  describe 'Array' do
    before do
      @arr = [1, :two, 'three', [nil, [true, false]]]
    end

    it 'empty array' 


    it 'plain multiline' 
    it 'plain multiline without index' 
    it 'plain multiline indented' 


    it 'plain multiline indented without index' 


    it 'plain single line' 


    it 'colored multiline (default)' 
    it 'colored multiline indented' 


    it 'colored single line' 

  end

  #------------------------------------------------------------------------------
  describe 'Nested Array' do
    before do
      @arr = [1, 2]
      @arr << @arr
    end

    it 'plain multiline' 


    it 'plain multiline without index' 


    it 'plain single line' 

  end

  #------------------------------------------------------------------------------
  describe 'Limited Output Array' do
    before(:each) do
      @arr = (1..1000).to_a
    end

    it 'plain limited output large' 


    it 'plain limited output small' 


    it 'plain limited output with 10 lines' 


    it 'plain limited output with 11 lines' 

  end

  #------------------------------------------------------------------------------
  describe 'Limited Output Hash' do
    before(:each) do
      @hash = ('a'..'z').inject({}) { |h, v| h.merge({ v => v.to_sym }) }
    end

    it 'plain limited output' 

  end

  #------------------------------------------------------------------------------
  describe 'Hash' do
    before do
      @hash = { 1 => { sym: { 'str' => { [1, 2, 3] => { { k: :v } => Hash } } } } }
    end

    it 'empty hash' 


    it 'plain multiline' 


    it 'new hash syntax' 


    it 'plain multiline indented' 


    it 'plain single line' 


    it 'colored multiline (default)' 


    it 'colored with new hash syntax' 


    it 'colored multiline indented' 


    it 'colored single line' 


  end

  #------------------------------------------------------------------------------
  describe 'Nested Hash' do
    before do
      @hash = {}
      @hash[:a] = @hash
    end

    it 'plain multiline' 


    it 'plain single line' 

  end

  #------------------------------------------------------------------------------
  describe 'Hash with several keys' do
    before do
      @hash = { 'b' => 'b', :a => 'a', :z => 'z', 'alpha' => 'alpha' }
    end

    it 'plain multiline' 


    it 'plain multiline with sorted keys' 


  end

  #------------------------------------------------------------------------------
  describe 'Negative options[:indent]' do
    #
    # With Ruby < 1.9 the order of hash keys is not defined so we can't
    # reliably compare the output string.
    #
    it 'hash keys must be left aligned' 


    it 'nested hash keys should be indented (array of hashes)' 


    it 'nested hash keys should be indented (hash of hashes)' 

  end

  #------------------------------------------------------------------------------
  describe 'Class' do
    it 'should show superclass (plain)' 


    it 'should show superclass (color)' 

  end

  #------------------------------------------------------------------------------
  describe 'File' do
    it 'should display a file (plain)' 

  end

  #------------------------------------------------------------------------------
  describe 'Dir' do
    it 'should display a direcory (plain)' 

  end

  #------------------------------------------------------------------------------
  describe 'BigDecimal and Rational' do
    it 'should present BigDecimal object with arbitrary precision' 


    it 'should present Rational object with arbitrary precision' 

  end

  #------------------------------------------------------------------------------
  describe 'Utility methods' do
    it 'should merge options' 

  end

  #------------------------------------------------------------------------------
  describe 'Set' do
    before do
      @arr = [1, :two, 'three']
      @set = Set.new(@arr)
    end

    it 'empty set' 


    if RUBY_VERSION > '1.9'
      it 'plain multiline' 


      it 'plain multiline indented' 


      it 'plain single line' 


      it 'colored multiline (default)' 

    else # Prior to Ruby 1.9 the order of set values is unpredicatble.
      it 'plain multiline' 


      it 'plain multiline indented' 


      it 'plain single line' 


      it 'colored multiline (default)' 

    end
  end

  #------------------------------------------------------------------------------
  describe 'Struct' do
    before do
      @struct = unless defined?(Struct::SimpleStruct)
        Struct.new('SimpleStruct', :name, :address).new
      else
        Struct::SimpleStruct.new
      end
      @struct.name = 'Herman Munster'
      @struct.address = '1313 Mockingbird Lane'
    end

    it 'empty struct' 


    it 'plain multiline' 


    it 'plain multiline indented' 


    it 'plain single line' 


    it 'colored multiline (default)' 

  end

  #------------------------------------------------------------------------------
  describe 'Inherited from standard Ruby classes' do
    after do
      Object.instance_eval { remove_const :My } if defined?(My)
    end

    it 'inherited from Array should be displayed as Array' 


    it 'inherited from Hash should be displayed as Hash' 


    it 'inherited from File should be displayed as File' 


    it 'inherited from Dir should be displayed as Dir' 


    it 'should handle a class that defines its own #send method' 


    it 'should handle a class defines its own #method method (ex. request.method)' 


    describe 'should handle a class that defines its own #to_hash method' do
      it 'that takes arguments' 


      it 'that returns nil' 


      it "that returns an object that doesn't support #keys" 


      it "that returns an object that doesn't support subscripting" 

    end
  end
end


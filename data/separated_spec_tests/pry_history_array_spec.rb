require_relative 'helper'

describe Pry::HistoryArray do
  before do
    @array = Pry::HistoryArray.new 10
    @populated = @array.dup << 1 << 2 << 3 << 4
  end

  it 'should have a maximum size specifed at creation time' 


  it 'should be able to be added objects to' 


  it 'should be able to access single elements' 


  it 'should be able to access negative indices' 


  it 'should be able to access ranges' 


  it 'should be able to access ranges starting from a negative index' 


  it 'should be able to access ranges ending at a negative index' 


  it 'should be able to access ranges using only negative indices' 


  it 'should be able to use range where end is excluded' 


  it 'should be able to access slices using a size' 


  it 'should remove older entries' 


  it 'should not be larger than specified maximum size' 


  it 'should pop!' 


  it 'should return an indexed hash' 

end


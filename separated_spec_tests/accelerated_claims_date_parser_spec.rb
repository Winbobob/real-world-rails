require 'spec_helper'

describe DateParser do

  
  context 'invalid values passed in' do
    it 'should raise arg error if values hash doesnt contain parts with expected names' 

  end

  context 'valid date strings' do

    it 'should reject 19th feb in a non leap year' 


    it 'should accept 1 digit day month 2 digit year' 


    it 'should translate 2-digit year of 49 into 2049' 


    it 'should accept 3-letter month names' 


    it 'should accept mixed case month names' 


    it 'should accept mixed case month names with 1 digit day' 


    it 'should accept 1 digit day and month and 4 digit year' 


    it 'should accept 29th Feb in a leap year' 


    it 'should accept month names and 2-digit year' 


    it 'should accept 2-digit day and 2-digit month' 

  end


  context 'invalid dates' do 
    it 'should reject 19th feb in a non leap year' 


    it 'should reject 33rd in any year' 


    it 'should reject 31st in a 30-day month' 


    it 'should reject unrecognised month names' 


    it 'should reject month numbers > 12' 


     it 'should reject dates with missing days' 
    it 'should reject dates with missing months' 


    it 'should reject dates with missing year' 

  end




  context 'all blank values' do
    it 'should return nil if all three values are nil' 


    it 'should return nil if all three values are empty strings' 

  end


  context 'translation of 2-digit years to 4-digit years' do

    it 'should translate 68 to 2068 when run in 2014' 


    it 'should translate 69 to 1969 when run in 2014' 



    it 'should translate 68 to 2068 when run in 2028' 



  end



end


def set_values(dmy_array)
  [ {:part => 'dob(1i)', :value => dmy_array[2]}, {:part => 'dob(2i)', :value => dmy_array[1]}, {:part => 'dob(3i)', :value => dmy_array[0]} ]
end



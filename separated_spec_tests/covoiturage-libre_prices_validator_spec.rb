require 'rails_helper'

describe PricesValidator, type: :model do
  describe '#validate' do

    it "should do nothing with empty object" 


    it "should add error with object with missing price" 


    it "should add error with object with unordered prices" 


    it "should add error with object with unranked prices" 


    it "should do nothing with object with well ranked unordered prices" 


    it "should do nothing with object with well ordered prices" 


  end
end


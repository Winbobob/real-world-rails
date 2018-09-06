require 'rails_helper'
require 'email'

describe Email do

  describe "is_valid?" do

    it 'treats a nil as invalid' 


    it 'treats a good email as valid' 


    it 'treats a bad email as invalid' 


    it 'allows museum tld' 


    it 'does not think a word is an email' 


  end

  describe "downcase" do

    it 'downcases local and host part' 


    it 'leaves invalid emails untouched' 


  end

end


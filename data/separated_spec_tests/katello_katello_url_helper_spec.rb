require 'katello_test_helper'

module Katello
  describe KatelloUrlHelper do
    describe "Valid https? Urls" do
      it "should validate clean http urls" 

      it "should validate clean https urls" 

      it "should validate clean ipv4 urls" 

      it "should validate clean localhost urls" 

      it "should validate clean ftp urls" 


      it "should validate file urls" 


      it "should validate file urls with multiple slashes" 


      it "should validate not fully qualified domain names" 


      it "should validate urls with usernames and passwords" 

    end

    describe "Invalid Urls" do
      it "should catch invalid missing protocols" 

      it "should catch invalid generic urls" 

      it "should catch domains with invalid dashes" 

    end
  end
end


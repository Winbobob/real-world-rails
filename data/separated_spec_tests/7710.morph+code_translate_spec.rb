require 'spec_helper'

describe Morph::CodeTranslate do
  describe ".translate" do
    let(:code) { double }

    it "should translate ruby" 


    it "should translate php" 


    it "should translate python" 

  end

  describe "PHP" do
    describe ".translate" do
      it "should do each step" 

    end

    describe ".add_require" do
      it "should insert require scraperwiki after the opening php tag" 


      it "shouldn't insert require if it's already there" 


      it "shouldn't insert require if it's already there" 

    end

    describe ".change_table_in_select" do
      it "should change the table name" 

    end
  end

  describe "Python" do
    it "should do nothing" 

  end

  describe "Ruby" do
    describe ".translate" do
      it "should do a series of translations and return the final result" 

    end

    describe ".add_require" do
      it "should do nothing if scraperwiki already required (with single quotes)" 


      it "should do nothing if scraperwiki already required (with double quotes)" 


      it "should add the require if it's not there" 


      describe ".change_table_in_sqliteexecute_and_select" do
        it "should replace the table name" 


        it "another example" 

      end

      describe ".add_instructions_for_libraries" do
        it "should do nothing if nothing needs to be done" 


        it "should add some help above where a library is required" 


        it "should also translate where double quotes are used" 

      end
    end
  end
end


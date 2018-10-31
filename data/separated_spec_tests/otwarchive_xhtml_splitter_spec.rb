require 'spec_helper'
require 'nokogiri'

describe XhtmlSplitter do
  include XhtmlSplitter

  describe "split_xhtml" do

    before(:each) do
      @html = """
        <div bgcolor=\"red\">
          <div>
            <p align=\"center\">
              one one one one one
            </p>
            <p>two two two two two</p>
            <p>three<br/>three</p>
            <p>four four four four</p>
            <p>five five five five</p>
            <hr/>
            <p><i>six</i> six six six six</p>
            <p>seven seven seven seven seven</p>
            <p><b>eight </b>eight eight eight</p>
            <p>nine</p>
            <p>ten</p>
         </div>
         <p>
           eleven
         </p>
       </div>
       """

    end

    it "should not split small html" 


    it "should split in two small parts" 


    it "should split in two small parts if html is a single line" 


    it "should handle html with more than one root element" 


    it "should produce valid splitted XHTML parts" 
    it "should reopen red div in second part" 

  end

  describe "stack_tags" do

    it "should ignore text-only" 


    it "should add opening tags" 


    it "should remove matching closing tags" 


    it "should error on mismatched tags" 


    it "should ignore self-closing tags" 


    it "should handle attributes when adding" 


    it "should handle attributes when removing" 


    it "should handle multiple tags" 


  end


  describe "close_tags" do

    it "should close tags" 

  end

  describe "open_tags" do

    it "should open tags" 

  end
end


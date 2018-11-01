require 'spec_helper'

describe HtmlHelper, type: :helper do
  describe "stripping html from a string" do
    it "strips tags" 


    it "removes nbsp and amp entities" 


    it "returns nil for nil input" 


    describe "line breaks" do
      it "adds two line breaks after heading tags" 


      it "adds two line breaks after p tags" 


      it "adds two line breaks after div tags" 


      it "adds a line break after br tags" 


      it "strips line breaks at the end of the string" 

    end
  end
end


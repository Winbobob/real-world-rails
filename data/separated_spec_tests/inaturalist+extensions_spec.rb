# encoding: UTF-8
require "spec_helper"

describe "Extensions" do
  describe "force_utf8" do
    before do
      @str = "\xC2\xA9"
      @str.force_encoding("ISO-8859-1")
    end

    describe Array do
      it "converts to utf8" 


      it "converts complicated arrays to utf8" 


      it "converts NaN to nil" 


      it "doesn't remove Hebrew characters" 

    end

    describe Hash do
      it "converts to utf8" 


      it "converts complicated hashes to utf8" 


      it "converts NaN to nil" 


      it "doesn't remove Hebrew characters" 

    end
  end

  describe OpenStruct do
    describe "new_recursive" do
      it "creates a resursive OpenStruct from a hash" 

    end
  end
end


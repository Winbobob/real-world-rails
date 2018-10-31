require_relative 'helper'

describe Pry::Helpers::DocumentationHelpers do
  before do
    @helper = Pry::Helpers::DocumentationHelpers
  end

  describe "get_comment_content" do
    it "should strip off the hash and unindent" 


    it "should strip out leading lines of hashes" 


    it "should remove shebangs" 


    it "should unindent past separators" 

  end

  describe "process_rdoc" do
    before do
      Pry.config.color = true
    end

    after do
      Pry.config.color = false
    end

    it "should syntax highlight indented code" 


    it "should highlight words surrounded by +s" 


    it "should syntax highlight things in backticks" 


    it "should emphasise em tags" 


    it "should emphasise italic tags" 


    it "should syntax highlight code in <code>" 


    it "should syntax highlight code in <tt>" 


    it "should not double-highlight backticks inside indented code" 


    it "should not remove ++" 

  end

end


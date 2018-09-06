require_relative '../../helper'

describe Pry::Command::Cat::FileFormatter do
  before do
    @p   = Pry.new
    @opt = Pry::Slop.new
  end

  describe "#file_and_line" do
    before do
      expect(Pry::Code).to receive(:from_file)
    end

    describe "windows filesystem" do
      it "parses '/'style absolute path without line_num" 


      it "parses '/'style absolute path with line_num" 


      it "parses '\\'style absolute path without line_num" 


      it "parses '\\'style absolute path with line_num" 

    end

    describe "UNIX-like filesystem" do
      it "parses absolute path without line_num" 


      it "parses absolute path with line_num" 

    end

    it "parses relative path without line_num" 


    it "parses relative path with line_num" 

  end

  describe "#format" do
    it "formats given files" 


    it "formats given files with line number" 

  end
end


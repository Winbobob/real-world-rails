require 'spec_helper'

BENCHMARK = false
METAGRAMMAR_PATH = File.expand_path('../../../lib/treetop/compiler/metagrammar.treetop', __FILE__)

module CircularCompilationSpec
  describe "a parser for the metagrammar" do
    attr_reader :parser
    
    before do
      @parser = Treetop::Compiler::MetagrammarParser.new
    end
    
    it "can parse the metagrammar.treetop whence it was generated" 

  end
end


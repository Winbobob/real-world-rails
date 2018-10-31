# encoding: utf-8
require 'spec_helper'

module Terminal
  describe Table do
    before :each do
      @table = Table.new
    end

    it "should select columns" 


    it "should select the column with headings at an index" 


    #it "should select the columns with colspans > 1 in the index" do
    #  @table << [1,{:value => 2, :colspan => 2}]
    #  @table << [{:value => 3, :colspan => 2}, 4]
    #end

    it "should account for the colspan when selecting columns" 


    it "should render tables with colspan properly" 


    it "should count columns" 


    it "should iterate columns" 


    it "should select columns" 


    it "should select columns when using hashes" 


    it "should find column length" 


    it "should find column length with headings" 


    it "should render separators" 


    it "should add separator" 


    it "should render an empty table properly" 


    it "should render properly" 


    it "should render styles properly" 



    it "should render default alignment properly" 


    it "should render width properly" 


    it "should raise an error if the table width exceeds style width" 


    it "should render title properly" 


    it "should render properly without headings" 


    it "should render separators" 


    it "should align columns with separators" 



    it "should render properly using block syntax" 


    it "should render properly using instance_eval block syntax" 


    it "should render multi-row headings properly" 


    it "should allows a hash of options for creation" 


    it "should flex for large cells" 


    it "should allow alignment of headings and cells" 


    it "should align columns, but allow specifics to remain" 


    describe "#==" do
      it "should be equal to itself" 


     # it "should be equal with two empty tables" do
     #   table_one = Table.new
     #   table_two = Table.new
     #
     #   table_one.should eq table_two
     #   table_two.should eq table_one
     # end

      it "should not be equal with different headings" 


      it "should not be equal with different rows" 


      it "should not be equal if the other object does not respond_to? :headings" 


      it "should not be equal if the other object does not respond_to? :rows" 

    end

    it "should handle colspan inside heading" 


    it "should handle colspan inside cells" 


    it "should handle colspan inside cells regardless of colspan position" 


    it "should handle overflowing colspans" 


    it "should only increase column size for multi-column if it is unavoidable" 


    it "should handle extreme case with complex table layout" 


    it "should try to evenly divide contents over colspans" 


    it "should handle colspan 1" 


    it "should handle big colspan" 


    it "should handle multiple colspan" 


    it "should render a table with only X cell borders" 


    it "should render a table without cell borders" 


    it "should render a table with all separators" 


    it "should render a table with fullwidth characters" 


    it "should allow to not generate top border" 


    it "should allow to not generate bottom border" 

  end
end


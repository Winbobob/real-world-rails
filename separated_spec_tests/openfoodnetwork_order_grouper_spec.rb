require 'spec_helper'

module OpenFoodNetwork
  describe OrderGrouper do

    before(:each) do
        @items = [1, 2, 3, 4]
    end

    context "constructing the table" do
      it "should build a tree then build a table" 

      
    end

    context "grouping items without rules" do
      it "returns the original array when no rules are provided" 

    end

    context "grouping items with rules" do
      
      before(:each) do
        @rule1 = double(:rule1)
        rule2 = double(:rule2)
        @rules = [@rule1, rule2]
        @remaining_rules = [rule2]
        column1 = double(:col1)
        column2 = double(:col2)
        @columns = [column1, column2]
      end
      
      it "builds branches by removing a rule from 'rules' and running group_and_sort" 


      it "separates the first rule from rules before sending to group_and_sort" 


      it "should group, then sort, send each group to build_tree, and return a branch" 

    end

    context "building the table Array" do
      before(:each) do
        rule1 = double(:rule1)
        rule2 = double(:rule2)
        @rules = [rule1, rule2]
        @column1 = double(:col1, :call => "Column1")
        @column2 = double(:col2, :call => "Column2")
        @columns = [@column1, @column2]

        sumcol1 = double(:sumcol1, :call => "SumColumn1")
        sumcol2 = double(:sumcol2, :call => "SumColumn2")
        @sumcols = [sumcol1, sumcol2]

        item1 = double(:item1)
        item2 = double(:item2)
        item3 = double(:item3)
        @items1 = [item1, item2]
        @items2 = [item2, item3]
        @items3 = [item3, item1]
      end
      it "should return columns when given an Array" 

      
      it "should return a row for each key-value pair when given a Hash" 


      it "should return an extra row when a :summary_row key appears in a given Hash" 

    end
  end
end


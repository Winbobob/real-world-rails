require 'spec_helper'

require 'nokogiri'

class Thingy
  include XPath

  def foo_div
    descendant(:div).where(attr(:id) == 'foo')
  end
end

describe XPath do
  let(:template) { File.read(File.expand_path('fixtures/simple.html', File.dirname(__FILE__))) }
  let(:doc) { Nokogiri::HTML(template) }

  def xpath(type=nil, &block)
    doc.xpath XPath.generate(&block).to_xpath(type)
  end

  it "should work as a mixin" 


  describe '#descendant' do
    it "should find nodes that are nested below the current node" 


    it "should not find nodes outside the context" 


    it "should find multiple kinds of nodes" 


    it "should find all nodes when no arguments given" 

  end

  describe '#child' do
    it "should find nodes that are nested directly below the current node" 


    it "should not find nodes that are nested further down below the current node" 


    it "should find multiple kinds of nodes" 


    it "should find all nodes when no arguments given" 

  end

  describe '#axis' do
    it "should find nodes given the xpath axis" 


    it "should find nodes given the xpath axis without a specific tag" 

  end

  describe '#next_sibling' do
    it "should find nodes which are immediate siblings of the current node" 

  end

  describe '#previous_sibling' do
    it "should find nodes which are exactly preceding the current node" 

  end

  describe '#anywhere' do
    it "should find nodes regardless of the context" 


    it "should find multiple kinds of nodes regardless of the context" 


    it "should find all nodes when no arguments given regardless of the context" 


  end

  describe '#contains' do
    it "should find nodes that contain the given string" 


    it "should find nodes that contain the given expression" 

  end

  describe "#contains_word" do
    it "should find nodes that contain the given word in its entirety" 

  end

  describe '#starts_with' do
    it "should find nodes that begin with the given string" 


    it "should find nodes that contain the given expression" 

  end

  describe '#text' do
    it "should select a node's text" 

  end

  describe '#substring' do
    context "when called with one argument" do
      it "should select the part of a string after the specified character" 

    end

    context "when called with two arguments" do
      it "should select the part of a string after the specified character, up to the given length" 

    end
  end

  describe '#function' do
    it "should call the given xpath function" 

  end

  describe '#method' do
    it "should call the given xpath function with the current node as the first argument" 

  end

  describe '#string_length' do
    it "should return the length of a string" 

  end

  describe '#where' do
    it "should limit the expression to find only certain nodes" 


    it "should be aliased as []" 

  end

  describe '#inverse' do
    it "should invert the expression" 


    it "should be aliased as the unary tilde" 


    it "should be aliased as the unary bang" 

  end

  describe '#equals' do
    it "should limit the expression to find only certain nodes" 


    it "should be aliased as ==" 

  end

  describe '#not_equals' do
    it "should match only when not equal" 


    it "should be aliased as !=" 

  end


  describe '#is' do
    it "uses equality when :exact given" 


    it "uses substring matching otherwise" 

  end

  describe '#one_of' do
    it "should return all nodes where the condition matches" 

  end

  describe '#and' do
    it "should find all nodes in both expression" 


    it "should be aliased as ampersand (&)" 

  end

  describe '#or' do
    it "should find all nodes in either expression" 


    it "should be aliased as pipe (|)" 

  end

  describe '#attr' do
    it "should be an attribute" 

  end

  describe '#css' do
    it "should find nodes by the given CSS selector" 


    it "should respect previous expression" 


    it "should be composable" 


    it "should allow comma separated selectors" 

  end

  describe '#qname' do
    it "should match the node's name" 

  end

  describe '#union' do
    it "should create a union expression" 


    it "should be aliased as +" 

  end

  describe "#last" do
    it "returns the number of elements in the context" 

  end

  describe "#position" do
    it "returns the position of elements in the context" 

  end

  describe "#count" do
    it "counts the number of occurrences" 

  end

  describe "#lte" do
    it "checks lesser than or equal" 

  end

  describe "#lt" do
    it "checks lesser than" 

  end

  describe "#gte" do
    it "checks greater than or equal" 

  end

  describe "#gt" do
    it "checks greater than" 

  end

  describe "#plus" do
    it "adds stuff" 

  end

  describe "#minus" do
    it "subtracts stuff" 

  end

  describe "#multiply" do
    it "multiplies stuff" 

  end

  describe "#divide" do
    it "divides stuff" 

  end

  describe "#mod" do
    it "take modulo" 

  end

  describe "#ancestor" do
    it "finds ancestor nodes" 

  end
end


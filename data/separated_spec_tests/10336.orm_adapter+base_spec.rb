require 'spec_helper'

describe OrmAdapter::Base do
  subject { OrmAdapter::Base.new(Object) }

  describe "#extract_conditions!" do
    let(:conditions) { {:foo => 'bar'} }
    let(:order) { [[:foo, :asc]] }
    let(:limit) { 1 }
    let(:offset) { 2 }

    it "(<conditions>)" 


    it "(:conditions => <conditions>)" 


    it "(:order => <order>)" 


    it "(:limit => <limit>)" 


    it "(:offset => <offset>)" 


    it "(:conditions => <conditions>, :order => <order>)" 


    it "(:conditions => <conditions>, :limit => <limit>)" 


    it "(:conditions => <conditions>, :offset => <offset>)" 


    describe "#valid_object?" do
      it "determines whether an object is valid for the current model class" 

    end

    describe "#normalize_order" do
      specify "(nil) returns []" do
        subject.send(:normalize_order, nil).should == []
      end

      specify ":foo returns [[:foo, :asc]]" do
        subject.send(:normalize_order, :foo).should == [[:foo, :asc]]
      end

      specify "[:foo] returns [[:foo, :asc]]" do
        subject.send(:normalize_order, [:foo]).should == [[:foo, :asc]]
      end

      specify "[:foo, :desc] returns [[:foo, :desc]]" do
        subject.send(:normalize_order, [:foo, :desc]).should == [[:foo, :desc]]
      end

      specify "[:foo, [:bar, :asc], [:baz, :desc], :bing] returns [[:foo, :asc], [:bar, :asc], [:baz, :desc], [:bing, :asc]]" do
        subject.send(:normalize_order, [:foo, [:bar, :asc], [:baz, :desc], :bing]).should == [[:foo, :asc], [:bar, :asc], [:baz, :desc], [:bing, :asc]]
      end

      specify "[[:foo, :wtf]] raises ArgumentError" do
        lambda { subject.send(:normalize_order, [[:foo, :wtf]]) }.should raise_error(ArgumentError)
      end

      specify "[[:foo, :asc, :desc]] raises ArgumentError" do
        lambda { subject.send(:normalize_order, [[:foo, :asc, :desc]]) }.should raise_error(ArgumentError)
      end
    end
  end
end


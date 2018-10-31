require 'spec_helper'

describe Radiant::Admin::ReferencesHelper do
  class BasicFilter < TextFilter; end
  class CustomFilter < TextFilter
    filter_name "Really Custom"
  end

  describe "determining the page class" do
    before :each do
      helper.send(:instance_variable_set, :@page_class, nil)
    end

    it "should return Page when the class_name was not sent" 


    it "should return the named class when sent class_name" 


    it "should return Page when the class_name is blank" 

  end

  describe "determining the filter" do
    before :each do
      helper.send(:instance_variable_set, :@filter, nil)
    end

    it "should return nil when no filter is set" 


    it "should return the filter object for the named filter" 


    it "should return the filter object for a custom named filter" 


    it "should return nil when the set filter is blank" 

  end

  describe "determining the display name" do
    describe "when getting a filter reference" do
      before :each do
        helper.send(:instance_variable_set, :@filter, nil)
        params[:type] = 'filters'
      end

      it "should return the name of the set filter" 


      it "should return <none> when no filter is set" 

    end

    describe "when getting a tag reference" do
      before :each do
        helper.send(:instance_variable_set, :@page_class, nil)
        params[:type] = 'tags'
      end

      it "should return the display name of the page class" 


      it "should return Page when <normal> is chosen" 

    end
  end

  describe "rendering the filter reference" do
    before :each do
      helper.send(:instance_variable_set, :@filter, nil)
      params[:type] = 'filters'
      params[:filter_name] = 'Basic'
    end

    it "should render a helpful message when the description is blank" 


    it "should render the filter's description when available" 


    it "should render a helpful message when no filter is selected" 

  end

  describe "rendering the tag reference" do
    before :each do
      helper.send(:instance_variable_set, :@page_class, nil)
      params[:type] = 'tags'
      params[:class_name] = ''
    end

    it "should render the tag reference partial for each tag description" 

  end
end


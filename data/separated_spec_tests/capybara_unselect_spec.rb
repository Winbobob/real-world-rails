# frozen_string_literal: true

Capybara::SpecHelper.spec "#unselect" do
  before do
    @session.visit('/form')
  end

  context "with multiple select" do
    it "should unselect an option from a select box by id" 


    it "should unselect an option without a select box" 


    it "should unselect an option from a select box by label" 


    it "should favour exact matches to option labels" 


    it "should escape quotes" 


    it "casts to string" 

  end

  context "with single select" do
    it "should raise an error" 

  end

  context "with a locator that doesn't exist" do
    it "should raise an error" 

  end

  context "with an option that doesn't exist" do
    it "should raise an error" 

  end

  context "with :exact option" do
    context "when `false`" do
      it "can match select box approximately" 


      it "can match option approximately" 


      it "can match option approximately when :from not given" 

    end

    context "when `true`" do
      it "can match select box approximately" 


      it "can match option approximately" 


      it "can match option approximately when :from not given" 

    end
  end
end


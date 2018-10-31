# frozen_string_literal: true

Capybara::SpecHelper.spec "#select" do
  before do
    @session.visit('/form')
  end

  it "should return value of the first option" 


  it "should return value of the selected option" 


  it "should allow selecting exact options where there are inexact matches", :exact_false do
    @session.select("Mr", from: 'Title')
    expect(@session.find_field('Title').value).to eq('Mr')
  end

  it "should allow selecting options where they are the only inexact match", :exact_false do
    @session.select("Mis", from: 'Title')
    expect(@session.find_field('Title').value).to eq('Miss')
  end

  it "should not allow selecting options where they are the only inexact match if `exact: true` is specified" 


  it "should not allow selecting an option if the match is ambiguous", :exact_false do
    expect do
      @session.select("M", from: 'Title')
    end.to raise_error(Capybara::Ambiguous)
  end

  it "should return the value attribute rather than content if present" 


  it "should select an option from a select box by id" 


  it "should select an option from a select box by label" 


  it "should select an option without giving a select box" 


  it "should escape quotes" 


  it "should obey from" 


  it "show match labels with preceding or trailing whitespace" 


  it "casts to string" 


  context "input with datalist" do
    it "should select an option" 


    it "should not find an input without a datalist" 


    it "should not select an option that doesn't exist" 


    it "should not select a disabled option" 

  end

  context "with a locator that doesn't exist" do
    it "should raise an error" 

  end

  context "with an option that doesn't exist" do
    it "should raise an error" 

  end

  context "on a disabled select" do
    it "should raise an error" 

  end

  context "on a disabled option" do
    it "should not select" 


    it "should warn" 

  end

  context "with multiple select" do
    it "should return an empty value" 


    it "should return value of the selected options" 


    it "should select one option" 


    it "should select multiple options" 


    it "should remain selected if already selected" 


    it "should return value attribute rather than content if present" 

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


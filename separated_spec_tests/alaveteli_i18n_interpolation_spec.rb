# -*- encoding : utf-8 -*-
require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe "when using i18n" do

  it "should not complain if we're missing variables from the string" 


  it "should assume that simple translations are always html safe" 

end

describe "n_" do
  it "should return the translated singular" 


  it "should return the translated plural" 


  it "should return the translated singular interpolated" 


  it "should return the translated plural interpolated" 


  it "should always be html safe when there is no interpolation" 

end

describe "gettext_interpolate" do
  context "html unsafe string" do
    let(:string) { "Hello {{a}}" }

    it "should give an unsafe result" 


    it "should give an unsafe result" 

  end

  context "html safe string" do
    let(:string) { "Hello {{a}}".html_safe }

    it "should quote the input if it's unsafe" 


    it "should not quote the input if it's safe" 

  end
end


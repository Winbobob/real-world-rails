require "spec_helper"

describe NestedForm::ViewHelper do
  include RSpec::Rails::HelperExampleGroup
  
  before(:each) do
    _routes.draw do
      resources :projects
    end
  end

  it "should pass nested form builder to form_for along with other options" 


  it "should pass instance of NestedForm::Builder to nested_form_for block" 


  it "should pass instance of NestedForm::SimpleBuilder to simple_nested_form_for block" 


  if defined?(NestedForm::FormtasticBuilder)
    it "should pass instance of NestedForm::FormtasticBuilder to semantic_nested_form_for block" 

  end

  if defined?(NestedForm::FormtasticBootstrapBuilder)
    it "should pass instance of NestedForm::FormtasticBootstrapBuilder to semantic_bootstrap_nested_form_for block" 

  end

  it "should append content to end of nested form" 


  if Rails.version >= "3.1.0"
    it "should set multipart when there's a file field" 

  end
end



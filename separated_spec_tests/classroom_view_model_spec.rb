# frozen_string_literal: true

require "rails_helper"

RSpec.describe ViewModel do
  it "takes an attributes hash" 


  it "gets an empty attributes hash by default" 


  class WithAttributes < ViewModel
    attr_reader :foo
  end

  class WithAttributesChild < WithAttributes
    attr_reader :baz
  end

  class WithMultipleAttributes < ViewModel
    attr_reader :foo, :baz
  end

  it "automatically sets ivars for ctor attributes if there's an attr_reader" 


  it "ivar setting works for hierarchies too" 


  it "attr_reader appropriately handles multiple names" 

end


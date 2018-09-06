#
# This file is part of ruby-ffi.
# For licensing, see LICENSE.SPECS
#

require File.expand_path(File.join(File.dirname(__FILE__), "spec_helper"))

module TestBitmask0
  extend FFI::Library
end

module TestBitmask1
  extend FFI::Library
  ffi_lib TestLibrary::PATH

  bitmask [:c1, :c2, :c3, :c4]
  bitmask [:c5, 2, :c6, :c7, :c8]
  bitmask [:c9, 2, :c10, :c11, 5, :c12]
  bitmask [:c13, 2, :c14, 4, :c15, 6, :c16, 8]

  attach_function :test_untagged_bitmask, [:int], :int
end

module TestBitmask3
  extend FFI::Library
  ffi_lib TestLibrary::PATH

  bitmask :bitmask_type1, [:c1, :c2, :c3, :c4]
  bitmask :bitmask_type2, [:c5, 2, :c6, :c7, :c8]
  bitmask :bitmask_type3, [:c9, 2, :c10, :c11, 5, :c12]
  bitmask :bitmask_type4, [:c13, 2, :c14, 4, :c15, 6, :c16, 8]

  attach_function :test_tagged_typedef_bitmask1, [:bitmask_type1], :bitmask_type1
  attach_function :test_tagged_typedef_bitmask2, [:bitmask_type2], :bitmask_type2
  attach_function :test_tagged_typedef_bitmask3, [:bitmask_type3], :bitmask_type3
  attach_function :test_tagged_typedef_bitmask4, [:bitmask_type4], :bitmask_type4
end

module TestBitmask4
  extend FFI::Library
  ffi_lib TestLibrary::PATH

  bitmask [:c1, :c2, :c3, :c4]
  bitmask :bitmask_type1, [:c5, 6, :c6, :c7, :c8]
  bitmask :bitmask_type2, [:c9, 6, :c10, :c11, 14, :c12]
  bitmask :bitmask_type3, [:c13, 6, :c14, 14, :c15, 30, :c16, 42]
  bitmask FFI::Type::UINT16, :bitmask_type4, [:c17, 6, :c18, :c19, :c20]
  bitmask FFI::Type::UINT32, :bitmask_type5, [:c21, 6, :c22, :c23, 14, :c24]
  bitmask FFI::Type::UINT64, :bitmask_type6, [:c25, 6, :c26, 14, :c27, 30, :c28, 42]
  bitmask FFI::Type::UINT64, [:c29, 42, :c30, :c31, :c32]

  attach_function :test_untagged_nonint_bitmask, [:uint8],  :uint8
  attach_function :test_tagged_nonint_bitmask1,  [:uint16], :uint16
  attach_function :test_tagged_nonint_bitmask2,  [:uint32], :uint32
  attach_function :test_tagged_nonint_bitmask3,  [:uint64], :uint64
  attach_function :test_tagged_nonint_bitmask4, :test_tagged_nonint_bitmask1,  [:bitmask_type4], :bitmask_type4
  attach_function :test_tagged_nonint_bitmask5, :test_tagged_nonint_bitmask2,  [:bitmask_type5], :bitmask_type5
  attach_function :test_tagged_nonint_bitmask6, :test_tagged_nonint_bitmask3,  [:bitmask_type6], :bitmask_type6
end

describe "A library with no bitmask or enum defined" do
  it "returns nil when asked for an enum" 

end

describe "An untagged bitmask" do
  it "constants can be used as function parameters and return value" 

end

describe "A tagged typedef bitmask" do
  it "is accessible through its tag" 


  it "contains bitmask constants" 


  it "constants can be used as function parameters and return value" 


  it "constants can be combined into list to be used as function parameters and return values" 


  it "integers can be used instead of constants" 


  it "combination or list of integers can be used instead of constants" 


  it "mixed list of integers and constants can be used instead of constants" 


  it "remainder is given if some undefined mask are returned" 


  it "wrong constants rejected" 


end

describe "All bitmasks" do
  it "have autonumbered constants when defined with names only" 


  it "can have an explicit first constant and autonumbered subsequent constants" 


  it "can have a mix of explicit and autonumbered constants" 


  it "can have all its constants explicitely valued" 


  it "return a list containing a constant corresponding to a specific value" 


  it "return a list containing constants corresponding to a specific value combination of values" 


  it "return [] for values that don't have a symbol" 


  it "duplicate bitmask keys rejected" 

end


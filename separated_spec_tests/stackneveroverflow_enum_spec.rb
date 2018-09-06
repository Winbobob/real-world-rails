#
# This file is part of ruby-ffi.
# For licensing, see LICENSE.SPECS
#

require File.expand_path(File.join(File.dirname(__FILE__), "spec_helper"))

module TestEnum0
  extend FFI::Library
end

module TestEnum1
  extend FFI::Library
  ffi_lib TestLibrary::PATH

  enum [:c1, :c2, :c3, :c4]
  enum [:c5, 42, :c6, :c7, :c8]
  enum [:c9, 42, :c10, :c11, 4242, :c12]
  enum [:c13, 42, :c14, 4242, :c15, 424242, :c16, 42424242]
  
  attach_function :test_untagged_enum, [:int], :int
end

module TestEnum3
  extend FFI::Library
  ffi_lib TestLibrary::PATH

  enum :enum_type1, [:c1, :c2, :c3, :c4]
  enum :enum_type2, [:c5, 42, :c6, :c7, :c8]
  enum :enum_type3, [:c9, 42, :c10, :c11, 4242, :c12]
  enum :enum_type4, [:c13, 42, :c14, 4242, :c15, 424242, :c16, 42424242]

  attach_function :test_tagged_typedef_enum1, [:enum_type1], :enum_type1
  attach_function :test_tagged_typedef_enum2, [:enum_type2], :enum_type2
  attach_function :test_tagged_typedef_enum3, [:enum_type3], :enum_type3
  attach_function :test_tagged_typedef_enum4, [:enum_type4], :enum_type4
end

module TestEnum4
  extend FFI::Library
  ffi_lib TestLibrary::PATH

  enum [:c1, :c2, :c3, :c4]
  enum :enum_type1, [:c5, 0x42, :c6, :c7, :c8]
  enum :enum_type2, [:c9, 0x42, :c10, :c11, 0x4242, :c12]
  enum :enum_type3, [:c13, 0x42, :c14, 0x4242, :c15, 0x42424242, :c16, 0x4242424242424242]
  enum FFI::Type::UINT16, :enum_type4, [:c17, 0x42, :c18, :c19, :c20]
  enum FFI::Type::UINT32, :enum_type5, [:c21, 0x42, :c22, :c23, 0x4242, :c24]
  enum FFI::Type::UINT64, :enum_type6, [:c25, 0x42, :c26, 0x4242, :c27, 0x42424242, :c28, 0x4242424242424242]
  enum FFI::Type::UINT64, [:c29, 0x4242424242424242, :c30, :c31, :c32]

  attach_function :test_untagged_nonint_enum, [:uint8],  :uint8
  attach_function :test_tagged_nonint_enum1,  [:uint16], :uint16
  attach_function :test_tagged_nonint_enum2,  [:uint32], :uint32
  attach_function :test_tagged_nonint_enum3,  [:uint64], :uint64
  attach_function :test_tagged_nonint_enum4, :test_tagged_nonint_enum1,  [:enum_type4], :enum_type4
  attach_function :test_tagged_nonint_enum5, :test_tagged_nonint_enum2,  [:enum_type5], :enum_type5
  attach_function :test_tagged_nonint_enum6, :test_tagged_nonint_enum3,  [:enum_type6], :enum_type6
end

describe "A library with no enum defined" do
  it "returns nil when asked for an enum" 

end

describe "An untagged enum" do
  it "constants can be used as function parameters and return value" 

end

describe "A tagged typedef enum" do
  it "is accessible through its tag" 


  it "contains enum constants" 


  it "constants can be used as function parameters and return value" 


  it "integers can be used instead of constants" 

end

describe "All enums" do
  it "have autonumbered constants when defined with names only" 


  it "can have an explicit first constant and autonumbered subsequent constants" 


  it "can have a mix of explicit and autonumbered constants" 


  it "can have all its constants explicitely valued" 


  it "return the constant corresponding to a specific value" 


  it "return nil for values that don't have a symbol" 


  it "duplicate enum keys rejected" 

end


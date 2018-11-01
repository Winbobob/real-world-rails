#
# This file is part of ruby-ffi.
# For licensing, see LICENSE.SPECS
#

require File.expand_path(File.join(File.dirname(__FILE__), "spec_helper"))
describe "String tests" do
  include FFI
  module StrLibTest
    extend FFI::Library
    ffi_lib TestLibrary::PATH
    attach_function :ptr_ret_pointer, [ :pointer, :int], :string
    attach_function :string_equals, [ :string, :string ], :int
    attach_function :string_dummy, [ :string ], :void
    attach_function :string_null, [ ], :string
  end

  it "MemoryPointer#get_string returns a tainted string" 


  it "String returned by a method is tainted" 


  it "Poison null byte raises error" 


  it "Tainted String parameter should throw a SecurityError" 

  it "casts nil as NULL pointer" 


  it "return nil for NULL char*" 


  it "reads an array of strings until encountering a NULL pointer" 


  it "reads an array of strings of the size specified, substituting nil when a pointer is NULL" 


  it "reads an array of strings, taking a memory offset parameter" 


  it "raises an IndexError when trying to read an array of strings out of bounds" 


  it "raises an IndexError when trying to read an array of strings using a negative offset" 

end


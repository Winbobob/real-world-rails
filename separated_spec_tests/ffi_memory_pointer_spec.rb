# coding: utf-8
#
# This file is part of ruby-ffi.
# For licensing, see LICENSE.SPECS
#

require File.expand_path(File.join(File.dirname(__FILE__), "spec_helper"))

module CTest
  extend FFI::Library
  ffi_lib FFI::Library::LIBC

  attach_function :strcat, [:pointer, :pointer], :pointer
end

describe "MemoryPointer" do
  it "makes a pointer from a string" 


  it "does not make a pointer from non-strings" 


  it "makes a pointer from a string with multibyte characters" 


  it "reads back a string" 


  it "reads back an empty string" 

  
  it "makes a pointer for a certain number of bytes" 


  it "allows access to an element of the pointer (as an array)" 

  
  it "allows writing as an int" 


  it "allows writing as a sized int" 


  it "allows writing as a long" 


  it "allows writing as a size_t" 


  it "allows writing as a bool" 


  it "allows writing a custom typedef" 


  it "raises an error if you try to read an undefined type" 

  
  it "raises an error if you try putting a long into a pointer of size 1" 

  
  it "raises an error if you try putting an int into a pointer of size 1" 

#  it "does not raise IndexError for opaque pointers" do
#    m = FFI::MemoryPointer.new(8)
#    p2 = FFI::MemoryPointer.new(1024)
#    m.write_long(p2.address)
#    p = m.read_pointer
#    lambda { p.write_int(10) }.should_not raise_error
#  end
  
  it "makes a pointer for a certain type" 

  
  it "makes a memory pointer for a number of a certain type" 

  
  it "makes a pointer for an object responding to #size" 


  it "makes a pointer for a number of an object responding to #size" 


  it "MemoryPointer#address returns correct value" 


  it "MemoryPointer#null? returns true for zero value" 


  it "MemoryPointer#null? returns false for non-zero value" 

  
  it "initialize with block should execute block" 

end


#
# This file is part of ruby-ffi.
# For licensing, see LICENSE.SPECS
#

require File.expand_path(File.join(File.dirname(__FILE__), "spec_helper"))

MemoryPointer = FFI::MemoryPointer

describe "MemoryPointer#total" do
  it "MemoryPointer.new(:char, 1).total == 1" 


  it "MemoryPointer.new(:short, 1).total == 2" 


  it "MemoryPointer.new(:int, 1).total == 4" 


  it "MemoryPointer.new(:long_long, 1).total == 8" 


  it "MemoryPointer.new(1024).total == 1024" 

end
describe "MemoryPointer#read_array_of_long" do
  it "foo" 

end
describe "MemoryPointer argument" do
  module Ptr
    extend FFI::Library
    ffi_lib FFI::Platform::LIBC
    attach_function :memset, [ :pointer, :int, :ulong ], :pointer
    attach_function :memcpy, [ :pointer, :pointer, :ulong ], :pointer
  end

  it "Pointer passed correctly" 


  it "Data passed to native function" 

end
describe "MemoryPointer return value" do
  module Stdio
    extend FFI::Library
    ffi_lib FFI::Platform::LIBC
    attach_function :fopen, [ :string, :string ], :pointer
    attach_function :fclose, [ :pointer ], :int
    attach_function :fwrite, [ :pointer, :ulong, :ulong, :string ], :ulong
  end

  it "fopen returns non-nil" 

end


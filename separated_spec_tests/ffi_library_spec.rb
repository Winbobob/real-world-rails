#
# This file is part of ruby-ffi.
# For licensing, see LICENSE.SPECS
#

require File.expand_path(File.join(File.dirname(__FILE__), "spec_helper"))

describe "Library" do
  describe ".enum_value" do
    m = Module.new do
      extend FFI::Library
      enum :something, [:one, :two]
    end

    it "should return a value for a valid key" 


    it "should return nil for an invalid key" 

  end

  describe "#ffi_convention" do
    it "defaults to :default" 


    it "should be settable" 

  end

  if FFI::Platform::OS =~ /windows|cygwin/ && FFI::Platform::ARCH == 'i386'
    module LibTestStdcall
      extend FFI::Library
      ffi_lib TestLibrary::PATH
      ffi_convention :stdcall

      class StructUCDP < FFI::Struct
        layout :a1, :uchar,
          :a2, :double,
          :a3, :pointer
      end

      attach_function :testStdcallManyParams, [ :pointer, :int8, :int16, :int32, :int64,
              StructUCDP.by_value, StructUCDP.by_ref, :float, :double ], :void
    end

    it "adds stdcall decoration: testStdcallManyParams@64" 

  end

  describe "ffi_lib" do
    it "empty name list should raise error" 

    
  end

  unless RbConfig::CONFIG['target_os'] =~ /mswin|mingw/
    it "attach_function with no library specified" 


    it "attach_function :getpid from this process" 


    it "loads library using symbol" 


    it "attach_function :getpid from [ 'c', 'libc.so.6'] " 


    it "attach_function :getpid from [ 'libc.so.6', 'c' ] " 


    it "attach_function :getpid from [ 'libfubar.so.0xdeadbeef', nil, 'c' ] " 


    it "attach_function :getpid from [ 'libfubar.so.0xdeadbeef' ] " 


    it "attach_function :bool_return_true from [ File.expand_path(#{TestLibrary::PATH.inspect}) ]" 

  end

  def gvar_lib(name, type)
    Module.new do |m|
      m.extend FFI::Library
      ffi_lib TestLibrary::PATH
      attach_variable :gvar, "gvar_#{name}", type
      attach_function :get, "gvar_#{name}_get", [], type
      attach_function :set, "gvar_#{name}_set", [ type ], :void
    end
  end

  def gvar_test(name, type, val)
    lib = gvar_lib(name, type)
    lib.set(val)
    expect(lib.gvar).to eq(val)
    lib.set(0)
    lib.gvar = val
    expect(lib.get).to eq(val)
  end

  [ 0, 127, -128, -1 ].each do |i|
    it ":char variable" 

  end

  [ 0, 0x7f, 0x80, 0xff ].each do |i|
    it ":uchar variable" 

  end

  [ 0, 0x7fff, -0x8000, -1 ].each do |i|
    it ":short variable" 

  end

  [ 0, 0x7fff, 0x8000, 0xffff ].each do |i|
    it ":ushort variable" 

  end

  [ 0, 0x7fffffff, -0x80000000, -1 ].each do |i|
    it ":int variable" 

  end

  [ 0, 0x7fffffff, 0x80000000, 0xffffffff ].each do |i|
    it ":uint variable" 

  end

  [ 0, 0x7fffffffffffffff, -0x8000000000000000, -1 ].each do |i|
    it ":long_long variable" 

  end

  [ 0, 0x7fffffffffffffff, 0x8000000000000000, 0xffffffffffffffff ].each do |i|
    it ":ulong_long variable" 

  end

  if FFI::Platform::LONG_SIZE == 32
    [ 0, 0x7fffffff, -0x80000000, -1 ].each do |i|
      it ":long variable" 

    end

    [ 0, 0x7fffffff, 0x80000000, 0xffffffff ].each do |i|
      it ":ulong variable" 

    end
  else
    [ 0, 0x7fffffffffffffff, -0x8000000000000000, -1 ].each do |i|
      it ":long variable" 

    end

    [ 0, 0x7fffffffffffffff, 0x8000000000000000, 0xffffffffffffffff ].each do |i|
      it ":ulong variable" 

    end
  end

  it "Pointer variable" 


  [ 0, 0x7fffffff, -0x80000000, -1 ].each do |i|
    it "structure" 

  end
end


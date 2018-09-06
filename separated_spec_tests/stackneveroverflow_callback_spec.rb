#
# This file is part of ruby-ffi.
# For licensing, see LICENSE.SPECS
#

require File.expand_path(File.join(File.dirname(__FILE__), "spec_helper"))

describe "Callback" do
#  module LibC
#    extend FFI::Library
#    callback :qsort_cmp, [ :pointer, :pointer ], :int
#    attach_function :qsort, [ :pointer, :int, :int, :qsort_cmp ], :int
#  end
#  it "arguments get passed correctly" do
#    p = MemoryPointer.new(:int, 2)
#    p.put_array_of_int32(0, [ 1 , 2 ])
#    args = []
#    cmp = proc do |p1, p2| args.push(p1.get_int(0)); args.push(p2.get_int(0)); 0; end
#    # this is a bit dodgey, as it relies on qsort passing the args in order
#    LibC.qsort(p, 2, 4, cmp)
#    args.should == [ 1, 2 ]
#  end
#
#  it "Block can be substituted for Callback as last argument" do
#    p = MemoryPointer.new(:int, 2)
#    p.put_array_of_int32(0, [ 1 , 2 ])
#    args = []
#    # this is a bit dodgey, as it relies on qsort passing the args in order
#    LibC.qsort(p, 2, 4) do |p1, p2|
#      args.push(p1.get_int(0))
#      args.push(p2.get_int(0))
#      0
#    end
#    args.should == [ 1, 2 ]
#  end
  module LibTest
    extend FFI::Library
    ffi_lib TestLibrary::PATH
    class S8F32S32 < FFI::Struct
      layout :s8, :char, :f32, :float, :s32, :int
    end

    callback :cbVrS8, [ ], :char
    callback :cbVrU8, [ ], :uchar
    callback :cbVrS16, [ ], :short
    callback :cbVrU16, [ ], :ushort
    callback :cbVrS32, [ ], :int
    callback :cbVrU32, [ ], :uint
    callback :cbVrL, [ ], :long
    callback :cbVrUL, [ ], :ulong
    callback :cbVrS64, [ ], :long_long
    callback :cbVrU64, [ ], :ulong_long
    callback :cbVrP, [], :pointer
    callback :cbVrZ, [], :bool
    callback :cbCrV, [ :char ], :void
    callback :cbSrV, [ :short ], :void
    callback :cbIrV, [ :int ], :void
    callback :cbLrV, [ :long ], :void
    callback :cbULrV, [ :ulong ], :void
    callback :cbLrV, [ :long_long ], :void
    callback :cbVrT, [ ], S8F32S32.by_value
    callback :cbTrV, [ S8F32S32.by_value ], :void
    callback :cbYrV, [ S8F32S32.ptr ], :void
    callback :cbVrY, [ ], S8F32S32.ptr

    attach_function :testCallbackVrS8, :testClosureVrB, [ :cbVrS8 ], :char
    attach_function :testCallbackVrU8, :testClosureVrB, [ :cbVrU8 ], :uchar
    attach_function :testCallbackVrS16, :testClosureVrS, [ :cbVrS16 ], :short
    attach_function :testCallbackVrU16, :testClosureVrS, [ :cbVrU16 ], :ushort
    attach_function :testCallbackVrS32, :testClosureVrI, [ :cbVrS32 ], :int
    attach_function :testCallbackVrU32, :testClosureVrI, [ :cbVrU32 ], :uint
    attach_function :testCallbackVrL, :testClosureVrL, [ :cbVrL ], :long
    attach_function :testCallbackVrZ, :testClosureVrZ, [ :cbVrZ ], :bool
    attach_function :testCallbackVrUL, :testClosureVrL, [ :cbVrUL ], :ulong
    attach_function :testCallbackVrS64, :testClosureVrLL, [ :cbVrS64 ], :long_long
    attach_function :testCallbackVrU64, :testClosureVrLL, [ :cbVrU64 ], :ulong_long
    attach_function :testCallbackVrP, :testClosureVrP, [ :cbVrP ], :pointer
    attach_function :testCallbackVrY, :testClosureVrP, [ :cbVrY ], S8F32S32.ptr
    attach_function :testCallbackVrT, :testClosureVrT, [ :cbVrT ], S8F32S32.by_value
    attach_function :testCallbackTrV, :testClosureTrV, [ :cbTrV, S8F32S32.ptr ], :void
    attach_variable :cbVrS8, :gvar_pointer, :cbVrS8
    attach_variable :pVrS8, :gvar_pointer, :pointer
    attach_function :testGVarCallbackVrS8, :testClosureVrB, [ :pointer ], :char
    attach_function :testOptionalCallbackCrV, :testOptionalClosureBrV, [ :cbCrV, :char ], :void

  end

  it "returning :char (0)" 


  it "returning :char (127)" 


  it "returning :char (-128)" 

  # test wrap around
  it "returning :char (128)" 


  it "returning :char (255)" 


  it "returning :uchar (0)" 


  it "returning :uchar (0xff)" 


  it "returning :uchar (-1)" 


  it "returning :uchar (128)" 


  it "returning :uchar (-128)" 


  it "returning :short (0)" 


  it "returning :short (0x7fff)" 

  # test wrap around
  it "returning :short (0x8000)" 


  it "returning :short (0xffff)" 


  it "returning :ushort (0)" 


  it "returning :ushort (0x7fff)" 


  it "returning :ushort (0x8000)" 


  it "returning :ushort (0xffff)" 


  it "returning :ushort (-1)" 


  it "returning :int (0)" 


  it "returning :int (0x7fffffff)" 

  # test wrap around
  it "returning :int (-0x80000000)" 


  it "returning :int (-1)" 


  it "returning :uint (0)" 


  it "returning :uint (0x7fffffff)" 

  # test wrap around
  it "returning :uint (0x80000000)" 


  it "returning :uint (0xffffffff)" 


  it "returning :uint (-1)" 


  it "returning :long (0)" 


  it "returning :long (0x7fffffff)" 

  # test wrap around
  it "returning :long (-0x80000000)" 


  it "returning :long (-1)" 


  it "returning :ulong (0)" 


  it "returning :ulong (0x7fffffff)" 

  # test wrap around
  it "returning :ulong (0x80000000)" 


  it "returning :ulong (0xffffffff)" 


  it "Callback returning :ulong (-1)" 


  it "returning :long_long (0)" 


  it "returning :long_long (0x7fffffffffffffff)" 

  # test wrap around
  it "returning :long_long (-0x8000000000000000)" 


  it "returning :long_long (-1)" 


  it "returning bool" 


  it "returning :pointer (nil)" 


  it "returning :pointer (MemoryPointer)" 


  it "returning struct by value" 


  it "struct by value parameter" 


  
  it "global variable" 


  describe "When the callback is considered optional by the underlying library" do
    it "should handle receiving 'nil' in place of the closure" 

  end

  describe 'when inlined' do
    it 'could be anonymous' 

  end

  describe "as return value" do

    it "should not blow up when a callback is defined that returns a callback" 


    it "should return a callback" 


    it "should return a method callback" 


    it 'should not blow up when a callback takes a callback as argument' 

    it 'should be able to use the callback argument' 

    it 'function returns callable object' 

  end

end


describe "Callback with " do
  #
  # Test callbacks that take an argument, returning void
  #
  module LibTest
    extend FFI::Library
    ffi_lib TestLibrary::PATH

    class S8F32S32 < FFI::Struct
      layout :s8, :char, :f32, :float, :s32, :int
    end

    callback :cbS8rV, [ :char ], :void
    callback :cbU8rV, [ :uchar ], :void
    callback :cbS16rV, [ :short ], :void
    callback :cbU16rV, [ :ushort ], :void

    callback :cbZrV, [ :bool ], :void
    callback :cbS32rV, [ :int ], :void
    callback :cbU32rV, [ :uint ], :void

    callback :cbLrV, [ :long ], :void
    callback :cbULrV, [ :ulong ], :void
    callback :cbArV, [ :string ], :void
    callback :cbPrV, [ :pointer], :void
    callback :cbYrV, [ S8F32S32.ptr ], :void

    callback :cbS64rV, [ :long_long ], :void
    attach_function :testCallbackCrV, :testClosureBrV, [ :cbS8rV, :char ], :void
    attach_function :testCallbackU8rV, :testClosureBrV, [ :cbU8rV, :uchar ], :void
    attach_function :testCallbackSrV, :testClosureSrV, [ :cbS16rV, :short ], :void
    attach_function :testCallbackU16rV, :testClosureSrV, [ :cbU16rV, :ushort ], :void
    attach_function :testCallbackZrV, :testClosureZrV, [ :cbZrV, :bool ], :void
    attach_function :testCallbackIrV, :testClosureIrV, [ :cbS32rV, :int ], :void
    attach_function :testCallbackU32rV, :testClosureIrV, [ :cbU32rV, :uint ], :void

    attach_function :testCallbackLrV, :testClosureLrV, [ :cbLrV, :long ], :void
    attach_function :testCallbackULrV, :testClosureULrV, [ :cbULrV, :ulong ], :void

    attach_function :testCallbackLLrV, :testClosureLLrV, [ :cbS64rV, :long_long ], :void
    attach_function :testCallbackArV, :testClosurePrV, [ :cbArV, :string ], :void
    attach_function :testCallbackPrV, :testClosurePrV, [ :cbPrV, :pointer], :void
    attach_function :testCallbackYrV, :testClosurePrV, [ :cbYrV, S8F32S32.in ], :void
  end

  it "function with Callback plus another arg should raise error if no arg given" 


  it ":char (0) argument" 


  it ":char (127) argument" 


  it ":char (-128) argument" 


  it ":char (-1) argument" 


  it ":uchar (0) argument" 


  it ":uchar (127) argument" 


  it ":uchar (128) argument" 


  it ":uchar (255) argument" 


  it ":short (0) argument" 


  it ":short (0x7fff) argument" 


  it ":short (-0x8000) argument" 


  it ":short (-1) argument" 


  it ":ushort (0) argument" 


  it ":ushort (0x7fff) argument" 


  it ":ushort (0x8000) argument" 


  it ":ushort (0xffff) argument" 


  it ":bool (true) argument" 


  it ":int (0) argument" 


  it ":int (0x7fffffff) argument" 


  it ":int (-0x80000000) argument" 


  it ":int (-1) argument" 


  it ":uint (0) argument" 


  it ":uint (0x7fffffff) argument" 


  it ":uint (0x80000000) argument" 


  it ":uint (0xffffffff) argument" 


  it ":long (0) argument" 


  it ":long (0x7fffffff) argument" 


  it ":long (-0x80000000) argument" 


  it ":long (-1) argument" 


  it ":ulong (0) argument" 


  it ":ulong (0x7fffffff) argument" 


  it ":ulong (0x80000000) argument" 


  it ":ulong (0xffffffff) argument" 


  it ":long_long (0) argument" 


  it ":long_long (0x7fffffffffffffff) argument" 


  it ":long_long (-0x8000000000000000) argument" 


  it ":long_long (-1) argument" 


  it ":string argument" 


  it ":string (nil) argument" 


  it ":pointer argument" 


  it ":pointer (nil) argument" 


  it "struct by reference argument" 


  it "struct by reference argument with nil value" 


  it "varargs parameters are rejected" 


  #
  # Test stdcall convention with function and callback.
  # This is Windows 32-bit only.
  #
  if FFI::Platform::OS =~ /windows|cygwin/ && FFI::Platform::ARCH == 'i386'
    module LibTestStdcall
      extend FFI::Library
      ffi_lib TestLibrary::PATH
      ffi_convention :stdcall

      callback :cbStdcall, [ :pointer, :long ], :void
      attach_function :testCallbackStdcall, 'testClosureStdcall', [ :pointer, :cbStdcall, :long ], :bool
    end

    it "stdcall convention" 

  end
end


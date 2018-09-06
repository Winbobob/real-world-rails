#
# This file is part of ruby-ffi.
# For licensing, see LICENSE.SPECS
#

require File.expand_path(File.join(File.dirname(__FILE__), "spec_helper"))
require 'delegate'

module PointerTestLib
  extend FFI::Library
  ffi_lib TestLibrary::PATH
  begin
    attach_function :ptr_ret_int32_t, [ :pointer, :int ], :int
  rescue FFI::NotFoundError
    # NetBSD uses #define instead of typedef for these
    attach_function :ptr_ret_int32_t, :ptr_ret___int32_t, [ :pointer, :int ], :int
  end
  attach_function :ptr_from_address, [ FFI::Platform::ADDRESS_SIZE == 32 ? :uint : :ulong_long ], :pointer
  attach_function :ptr_set_pointer, [ :pointer, :int, :pointer ], :void
  attach_function :ptr_ret_pointer, [ :pointer, :int ], :pointer
end
describe "Pointer" do
  include FFI
  class ToPtrTest
    def initialize(ptr)
      @ptr = ptr
    end
    def to_ptr
      @ptr
    end
  end

  it "Any object implementing #to_ptr can be passed as a :pointer parameter" 

  class PointerDelegate < DelegateClass(FFI::Pointer)
    def initialize(ptr)
      @ptr = ptr
    end
    def to_ptr
      @ptr
    end
  end

  it "A DelegateClass(Pointer) can be passed as a :pointer parameter" 


  it "Fixnum cannot be used as a Pointer argument" 


  it "Bignum cannot be used as a Pointer argument" 


  it "#to_ptr" 


  describe "pointer type methods" do

    it "#read_pointer" 


    it "#write_pointer" 


    it "#read_array_of_pointer" 

    
  end

  describe 'NULL' do
    it 'should be obtained using Pointer::NULL constant' 

    it 'should be obtained passing address 0 to constructor' 

    it 'should raise an error when attempting read/write operations on it' 

    it 'returns true when compared with nil' 

  end

  it "Pointer.size returns sizeof pointer on platform" 


  describe "#slice" do
    before(:each) do
      @mptr = FFI::MemoryPointer.new(:char, 12)
      @mptr.put_uint(0, 0x12345678)
      @mptr.put_uint(4, 0xdeadbeef)
    end

    it "contents of sliced pointer matches original pointer at offset" 


    it "modifying sliced pointer is reflected in original pointer" 


    it "access beyond bounds should raise IndexError" 

  end

  describe "#type_size" do
    it "should be same as FFI.type_size(type)" 

  end
end

describe "AutoPointer" do
  loop_count = 30
  wiggle_room = 5 # GC rarely cleans up all objects. we can get most of them, and that's enough to determine if the basic functionality is working.
  magic = 0x12345678

  class AutoPointerTestHelper
    @@count = 0
    def self.release
      @@count += 1 if @@count > 0
    end
    def self.reset
      @@count = 0
    end
    def self.gc_everything(count)
      loop = 5
      while @@count < count && loop > 0
        loop -= 1
        TestLibrary.force_gc
        sleep 0.05 unless @@count == count
      end
      @@count = 0
    end
    def self.finalizer
      self.method(:release).to_proc
    end
  end
  class AutoPointerSubclass < FFI::AutoPointer
    def self.release(ptr); end
  end

  # see #427
  it "cleanup via default release method", :broken => true do
    expect(AutoPointerSubclass).to receive(:release).at_least(loop_count-wiggle_room).times
    AutoPointerTestHelper.reset
    loop_count.times do
      # note that if we called
      # AutoPointerTestHelper.method(:release).to_proc inline, we'd
      # have a reference to the pointer and it would never get GC'd.
      AutoPointerSubclass.new(PointerTestLib.ptr_from_address(magic))
    end
    AutoPointerTestHelper.gc_everything loop_count
  end

  # see #427
  it "cleanup when passed a proc", :broken => true do
    #  NOTE: passing a proc is touchy, because it's so easy to create a memory leak.
    #
    #  specifically, if we made an inline call to
    #
    #      AutoPointerTestHelper.method(:release).to_proc
    #
    #  we'd have a reference to the pointer and it would
    #  never get GC'd.
    expect(AutoPointerTestHelper).to receive(:release).at_least(loop_count-wiggle_room).times
    AutoPointerTestHelper.reset
    loop_count.times do
      FFI::AutoPointer.new(PointerTestLib.ptr_from_address(magic),
                           AutoPointerTestHelper.finalizer)
    end
    AutoPointerTestHelper.gc_everything loop_count
  end

  # see #427
  it "cleanup when passed a method", :broken => true do
    expect(AutoPointerTestHelper).to receive(:release).at_least(loop_count-wiggle_room).times
    AutoPointerTestHelper.reset
    loop_count.times do
      FFI::AutoPointer.new(PointerTestLib.ptr_from_address(magic),
                           AutoPointerTestHelper.method(:release))
    end
    AutoPointerTestHelper.gc_everything loop_count
  end

  it "can be used as the return type of a function" 


  describe "#new" do
    it "MemoryPointer argument raises TypeError" 

    it "AutoPointer argument raises TypeError" 

    it "Buffer argument raises TypeError" 


  end

  describe "#autorelease?" do
    ptr_class = Class.new(FFI::AutoPointer) do
      def self.release(ptr); end
    end

    it "should be true by default" 


    it "should return false when autorelease=(false)" 

  end

  describe "#type_size" do
    ptr_class = Class.new(FFI::AutoPointer) do
      def self.release(ptr); end
    end

    it "type_size of AutoPointer should match wrapped Pointer" 

    
    it "[] offset should match wrapped Pointer" 

  end
end



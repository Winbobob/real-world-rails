#
# This file is part of ruby-ffi.
# For licensing, see LICENSE.SPECS
#

require File.expand_path(File.join(File.dirname(__FILE__), "spec_helper"))

describe FFI::Struct, ' by_ref' do
  before :all do
    @struct_class = struct_class = Class.new(FFI::Struct) do
      layout :a, :pointer
    end

    @api = Module.new do
      extend FFI::Library
      ffi_lib TestLibrary::PATH
      fn = FFI::Type::POINTER.size == FFI::Type::LONG.size ? :ret_ulong : :ret_u64
      attach_function :struct_test, fn, [ struct_class.by_ref ], :pointer
    end
  end

  it "should accept instances of exact struct class" 


  it "should accept nil" 


  it "should reject other types" 


  it "should reject instances of other struct classes" 

end



#
# This file is part of ruby-ffi.
# For licensing, see LICENSE.SPECS
#

require File.expand_path(File.join(File.dirname(__FILE__), "spec_helper"))

describe "functions returning :strptr" do

  it "can attach function with :strptr return type" 


  module StrPtr
    extend FFI::Library
    ffi_lib FFI::Library::LIBC
    attach_function :free, [ :pointer ], :void
    if !FFI::Platform.windows?
      attach_function :strdup, [ :string ], :strptr
    else
      attach_function :strdup, :_strdup, [ :string ], :strptr
    end
  end

  it "should return [ String, Pointer ]" 


  it "should return the correct value" 


  it "should return non-NULL pointer" 

end


#
# This file is part of ruby-ffi.
# For licensing, see LICENSE.SPECS
#

require File.expand_path(File.join(File.dirname(__FILE__), "spec_helper"))
describe "Custom type definitions" do
  it "attach_function with custom typedef" 


  it "variadic invoker with custom typedef" 


  it "Callback with custom typedef parameter" 

    module StructCustomTypedef
      extend FFI::Library
      ffi_lib TestLibrary::PATH
      typedef :uint, :fubar3_t
      class S < FFI::Struct
        layout :a, :fubar3_t
      end
    end

  it "Struct with custom typedef field" 


  it "attach_function after a typedef should not reject normal types" 


  it "detects the correct type for size_t" 

end


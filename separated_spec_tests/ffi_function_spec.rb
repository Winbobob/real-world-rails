#
# This file is part of ruby-ffi.
# For licensing, see LICENSE.SPECS
#

require File.expand_path(File.join(File.dirname(__FILE__), "spec_helper"))

describe FFI::Function do
  module LibTest
    extend FFI::Library
    ffi_lib TestLibrary::PATH
    attach_function :testFunctionAdd, [:int, :int, :pointer], :int
  end
  before do
    @libtest = FFI::DynamicLibrary.open(TestLibrary::PATH,
                                        FFI::DynamicLibrary::RTLD_LAZY | FFI::DynamicLibrary::RTLD_GLOBAL)
  end

  it 'is initialized with a signature and a block' 


  it 'raises an error when passing a wrong signature' 


  it 'returns a native pointer' 


  it 'can be used as callback from C passing to it a block' 


  it 'can be used as callback from C passing to it a Proc object' 


  it 'can be used to wrap an existing function pointer' 


  it 'can be attached to a module' 


  it 'can be used to extend an object' 


  it 'can wrap a blocking function' 


  it 'autorelease flag is set to true by default' 


  it 'can explicity free itself' 


  it 'can\'t explicity free itself if not previously allocated' 

end


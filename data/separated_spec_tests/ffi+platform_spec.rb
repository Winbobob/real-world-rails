#
# This file is part of ruby-ffi.
# For licensing, see LICENSE.SPECS
#

require File.expand_path(File.join(File.dirname(__FILE__), "spec_helper"))

describe "FFI::Platform::LIBSUFFIX" do
  case OS
  when "linux"
    it "returns 'so'" 

  when "windows"
    it "returns 'dll'" 

  when "darwin"
    it "returns 'dylib'" 

  end
end

describe "FFI::Platform::IS_WINDOWS" do
  case OS
  when "linux"
    it "returns false" 

  when "windows"
    it "returns true" 

  when "darwin"
    it "returns false" 

  end
end

describe "FFI::Platform::ARCH" do
  it "returns the architecture type" 

end

describe "FFI::Platform::OS" do
  case OS
  when "linux"
    it "returns 'linux' as a string" 

  when "windows"
    it "returns 'windows' as a string" 

  when "darwin"
    it "returns 'darwin' as a string" 

  end
end

describe "FFI::Platform.windows?" do
  case OS
  when "linux"
    it "returns false" 

  when "windows"
    it "returns true" 

  when "darwin"
    it "returns false" 

  end
end

describe "FFI::Platform.mac?" do
  case OS
  when "linux"
    it "returns false" 

  when "windows"
    it "returns false" 

  when "darwin"
    it "returns true" 

  end
end

describe "FFI::Platform.unix?" do
  case OS
  when "linux"
    it "returns true" 

  when "windows"
    it "returns false" 

  when "darwin"
    it "returns true" 

  end
end


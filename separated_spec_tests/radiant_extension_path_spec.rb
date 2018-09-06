require File.dirname(__FILE__) + "/../../spec_helper"

describe Radiant::ExtensionPath do
  
  let(:ep) { Radiant::ExtensionPath.from_path(File.expand_path("#{RADIANT_ROOT}/test/fixtures/extensions/basic")) }
  let(:gem_ep) { Radiant::ExtensionPath.from_path("/imaginary/test/path/gems/radiant-gem_ext-extension-0.0.0") }
  let(:git_ep) { Radiant::ExtensionPath.from_path("/imaginary/test/path/vendor/extensions/radiant-git_ext-extension-61e0ad14a3ae") }

  describe "recording a vendored extension" do
    it "should parse the name of the extension from the path" 

    
    it "should return the basename of the extension file that should be required" 

    
    it "should return the extension path" 

    
    it "should store the extension path object" 

  end

  describe "recording a gem extension" do
    it "should parse the name of the extension from the gem path" 


    it "should return the name of the extension file" 


    it "should return the extension path" 


    it "should store the extension path object" 

  end

  describe "recording a git-repository extension" do
    it "should parse the name of the extension from the gem path" 


    it "should return the name of the extension file" 


    it "should return the extension path" 


    it "should store the extension path object" 

  end

  describe "looking for load paths" do
    before do
      Radiant::ExtensionPath.clear_paths!
      @configuration = double("configuration")
      allow(Radiant).to receive(:configuration).and_return(@configuration)
      @extensions = %w{basic overriding}
      @extensions.each do |ext|
        Radiant::ExtensionPath.from_path(File.expand_path("#{RADIANT_ROOT}/test/fixtures/extensions/#{ext}"))
      end
      allow(@configuration).to receive(:enabled_extensions).and_return(@extensions.map(&:to_sym))
    end
    
    describe "in an individual extension root" do
      [:load_paths, :plugin_paths, :controller_paths, :view_paths, :metal_paths, :locale_paths].each do |meth|
        it "should respond to #{meth}" 

      end
      
      it "should report paths that exist" 

      it "should not report paths that don't exist" 

    end

    describe "across the set of enabled extensions" do
      [:load_paths, :plugin_paths, :controller_paths, :view_paths, :metal_paths, :locale_paths].each do |meth|
        it "should return collected #{meth}" 

      end

      it "should return view_paths in inverse load order" 


      it "should return metal_paths in inverse load order" 

    end

  end

end


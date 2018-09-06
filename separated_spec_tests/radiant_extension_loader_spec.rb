require "spec_helper"
require "radiant/extension_loader"

describe Radiant::ExtensionLoader do

  before :each do
    allow($LOAD_PATH).to receive(:unshift)
    @observer = double("observer")
    @configuration = double("configuration")
    allow(Radiant).to receive(:configuration).and_return(@configuration)
    @admin = double("admin_ui")
    @initializer = double("initializer")
    allow(@initializer).to receive(:configuration).and_return(@configuration)
    allow(@initializer).to receive(:admin).and_return(@admin)
    @loader = Radiant::ExtensionLoader.send(:new)
    @loader.initializer = @initializer
    @extensions = %w{basic overriding load_order_blue load_order_green load_order_red}
    @extension_paths = @extensions.each_with_object({}) do |ext, paths|
      paths[ext.to_sym] = File.expand_path("#{RADIANT_ROOT}/test/fixtures/extensions/#{ext}")
    end
    @extension_paths[:git_ext] = File.expand_path("#{RADIANT_ROOT}/test/fixtures/gems/radiant-gem_ext-extension-61e0ad14a3ae")
    allow(@loader).to receive(:known_extension_paths).and_return(@extension_paths)
    Radiant::AdminUI.instance.initialize_nav
  end

  it "should be a Simpleton" 


  it "should only load extensions specified in the configuration" 


  it "should select extensions in an explicit order from the configuration" 


  describe "loading extensions" do
    it "should load and initialize" 

  end

  describe "activating extensions" do
    it "should activate extensions" 


    it "should deactivate extensions" 


    it "should (re)load Page subclasses on activation" 

  end

  describe Radiant::ExtensionLoader::DependenciesObserver do
    before :each do
      @config = double("rails config")
      @observer = Radiant::ExtensionLoader::DependenciesObserver.new(@config)
    end

    it "should be a MethodObserver" 


    it "should attach to the clear method" 


    it "should deactivate extensions before clear" 


    it "should load and activate extensions after clear" 


  end
end


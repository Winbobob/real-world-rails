require 'radiant/extension/script'

describe "Radiant::Extension::Script" do
  it "should determine which subscript to run" 


  it "should pass the command-line args to the subscript" 


  it "should run the help command when no arguments are given" 


  it "should run the help for a given command when it fails" 

end

describe "Radiant::Extension::Script::Util" do
  include Radiant::Extension::Script::Util

  it "should determine an extension name from a camelized string" 


  it "should determine an extension name from a hyphened name" 


  it "should determine an extension name from an underscored name" 


  it "should determine extension paths" 


  it "should determine whether an extension is installed" 


  it "should determine whether an extension is not installed" 


  it "should determine whether an extension is installed" 


  it "should determine whether an extension is installed" 


  it "should determine whether an extension is installed on windows system" 


  it "should load all extensions from the web service" 


  it "should find an extension of the given name from the web service" 

end

describe "Radiant::Extension::Script::Install" do

  before :each do
    @extension = double('Extension', install: true, name: 'page_attachments')
    allow(Registry::Extension).to receive(:find).and_return([@extension])
  end

  it "should read the extension name from the command line" 


  it "should attempt to find the extension and install it" 


  it "should fail if the extension is not found" 


  it "should fail if an extension name is not given" 

end

describe "Radiant::Extension::Script::Uninstall" do
  before :each do
    @extension = double('Extension', uninstall: true, name: 'basic')
    allow(Registry::Extension).to receive(:find).and_return([@extension])
  end

  it "should read the extension name from the command line" 


  it "should attempt to find the extension and uninstall it" 


  it "should fail if an extension name is not given" 

end

describe "Radiant::Extension::Script::Info" do
  before :each do
    @extension = double('Extension', uninstall: true, name: 'archive', inspect: '')
    allow(Registry::Extension).to receive(:find).and_return([@extension])
  end

  it "should read the extension name from the command line" 


  it "should attempt to find the extension and display its info" 


  it "should fail if an extension name is not given" 

end

describe "Radiant::Extension::Script::Help" do
  it "should display the general help message when no arguments are given" 


  it "should display the general help message when the 'help' command is specified" 


  it "should display the general help message when an invalid command is given" 


  it "should display the install help message" 


  it "should display the uninstall help message" 


  it "should display the info help message" 

end

describe "Registry::Action" do
  before :each do
    @action = Registry::Action.new
  end

  it "should shell out with the specified rake task if it exists" 


  it "should not shell out with the specified rake task if it does not exist" 

end

describe "Registry::Installer" do
  before :each do
    @installer = Registry::Installer.new('http://localhost/', 'example')
  end

  it "should set the name and url of the extension" 


  it "should install by copying, migrating and updating" 


  it "should copy the extension to vendor/extensions" 


  it "should run the rake migrate task" 


  it "should run the rake update task" 

end

describe "Registry::Uninstaller" do
  before :each do
    @extension = double('Extension', name: 'example')
    @uninstaller = Registry::Uninstaller.new(@extension)
  end

  it "should migrate down" 


  it "should remove the extension directory" 


  it "should uninstall by migrating down and removing the directory" 

end

describe "Registry::Checkout" do
  before :each do
    @extension = double("Extension", name: 'example', repository_url: 'http://localhost/')
    @checkout = Registry::Checkout.new(@extension)
    @methods = [:copy_to_vendor_extensions, :migrate, :update].each do |method|
      allow(@checkout).to receive(method).and_return(true)
    end
    allow(@checkout).to receive(:cd).and_yield
  end

  it "should set the name and url" 


  it "should defer the checkout command to concrete subclasses" 


  it "should install by checking out the source and then proceeding with the normal installation" 


  it "should checkout the source" 

end

describe "Registry::Download" do
  before :each do
    @extension = double("Extension", name: 'example', download_url: 'http://localhost/example.pkg')
    @download = Registry::Download.new(@extension)
    @methods = [:copy_to_vendor_extensions, :migrate, :update].each do |method|
      allow(@download).to receive(method).and_return(true)
    end
  end

  it "should set the name and url" 


  it "should defer the unpack command to concrete subclasses" 


  it "should install by downloading and unpacking and then proceeding with the normal installation" 


  it "should determine the filename" 


  it "should download the file" 

end

describe "Registry::Git" do
  before :each do
    @extension = double("Extension", name: 'example', repository_url: 'http://localhost/')
    @git = Registry::Git.new(@extension)
    allow(@git).to receive(:system)
    allow(@git).to receive(:cd).and_yield
  end

  describe "when the Radiant project is not stored in git" do
    before :each do
      allow(File).to receive(:directory?).with(".git").and_return(false)
    end

    it "should use git to clone the repository" 


    it "should initialize and update submodules" 


    it "should copy the extension to vendor/extensions" 

  end

  describe "when the Radiant project is stored in git" do
    before :each do
      allow(File).to receive(:directory?).with(".git").and_return(true)
    end

    it "should add the extension as a submodule and initialize and update its submodules" 


    it "should not copy the extension" 

  end
end

describe "Registry::Subversion" do
  before :each do
    @extension = double("Extension", name: 'example', repository_url: 'http://localhost/')
    @svn = Registry::Subversion.new(@extension)
  end

  it "should use svn to checkout the repository" 

end

describe "Registry::Gem" do
  before :each do
    @extension = double("Extension", name: 'example', download_url: 'http://localhost/example-1.0.0.gem')
    @gem = Registry::Gem.new(@extension)
  end

  it "should download the gem and install it if it is not already installed" 


  it "should not download the gem if it is already installed" 


  it "should unpack the gem and capture the path" 

end

describe "Registry::Tarball" do
  before :each do
    @extension = double("Extension", name: 'example', download_url: 'http://localhost/example-1.0.0.tar')
    @tar = Registry::Tarball.new(@extension)
  end

  it "should unpack the tarball without compression" 

end

describe "Registry::Gzip" do
  before :each do
    @extension = double("Extension", name: 'example', download_url: 'http://localhost/example-1.0.0.tar.gz')
    @gzip = Registry::Gzip.new(@extension)
  end

  it "should unpack the archive with compression" 

end

describe "Registry::Bzip2" do
  before :each do
    @extension = double("Extension", name: 'example', download_url: 'http://localhost/example-1.0.0.tar.bz2')
    @gzip = Registry::Bzip2.new(@extension)
  end

  it "should unpack the archive with compression" 

end


describe "Registry::Zip" do
  before :each do
    @extension = double("Extension", name: 'example', download_url: 'http://localhost/example-1.0.0.zip')
    @zip = Registry::Zip.new(@extension)
  end

  it "should unpack the zip" 

end


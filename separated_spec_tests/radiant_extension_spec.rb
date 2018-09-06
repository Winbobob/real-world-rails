require "spec_helper"
extensions_path = File.expand_path('../../../fixtures/extensions', __FILE__)
$: << extensions_path
require "basic/basic_extension"

describe Radiant::Extension do

  it "should be a Simpleton" 


  it "should annotate version, description, url, path and extension_name" 


  it "should have access to the Radiant::AdminUI instance" 


  it "should have a migrator" 


  it "should have a migrations path" 


  describe 'BasicExtension' do
    describe '#routing_file' do
      subject { super().routing_file }
      it { is_expected.to match '/extensions/basic/config/routes.rb' }
    end
  end

  context "when the routing_file exists" do
    subject { RoutedExtension }
    it { is_expected.to be_routed }
  end
  context "when the routing_file does not exist" do
    subject { UnroutedExtension }
    it { is_expected.not_to be_routed }
  end

  it "should set the extension_name in subclasses" 


  it "should expose configuration object" 


  it "should allow the addition of items" 


  it "should allow the ordering of nav tabs after other tabs" 


  it "should allow the ordering of nav tabs before other tabs" 


  it "should allow the addition of tabs" 


  describe ".extension_enabled?" do
    it "should be false if extension does not exist" 


    it "should be false if extension is inactive" 


    it "should be false if extension is not migrated" 


    it "should be true if extension is defined and migrated" 

  end
end

describe Radiant::Extension, "when inactive" do

  before :each do
    BasicExtension.deactivate
    Radiant::AdminUI.instance.initialize_nav
  end

  it "should become active when activated" 


end

describe Radiant::Extension, "when active" do

  it "should become deactive when deactivated" 


  # This example needs revisiting and more detail
  it "should have loaded plugins stored in vendor/plugins" 


end


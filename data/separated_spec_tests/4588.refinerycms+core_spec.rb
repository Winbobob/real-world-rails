require 'spec_helper'

describe Refinery do
  describe "#include_once" do
    it "shouldn't double include a module" 

  end

  describe "#extensions" do
    it "should return an array of modules representing registered extensions" 

  end

  describe "#register_extension" do
    before { subject.extensions.clear }

    it "should add the extension's module to the array of registered extensions" 


    it "should not allow same extension to be registered twice" 

  end

  describe "#extension_registered?" do
    context "with Refinery::Core::Engine registered" do
      before { subject.register_extension(Refinery::Core) }

      it "should return true if the extension is registered" 

    end

    context "with no extensions registered" do
      before { subject.extensions.clear }

      it "should return false if the extension is not registered" 

    end
  end

  describe "#unregister_extension" do
    before do
      subject.extensions.clear
      subject.register_extension(Refinery::Images)
    end

    it "should remove the extension's module from the array of registered extensions" 

  end

  describe "#validate_extension!" do
    context "with a valid extension" do
      it "should return nil" 

    end

    context "with an invalid extension" do
      it "should raise invalid extension exception" 

    end
  end

  describe "#roots" do
    it "should return pathname to extension root when given constant as parameter" 


    it "should return pathname to extension root when given symbol as parameter" 


    it "should return pathname to extension root when given string as parameter" 


    it "should return an array of all pathnames if no extension_name is specified" 

  end

  describe "#deprecate" do
    before do
      @errors = StringIO.new
      @old_err = $stderr
      $stderr = @errors
    end

    after(:each) { $stderr = @old_err }

    it "shows a deprecation warning" 


    it "takes when option" 


    it "takes replacement option" 

  end

  describe ".route_for_model" do
    context 'with Refinery::Dummy' do
      module Refinery::Dummy
      end

      it "returns admin_dummy_path" 


      context ":plural => true" do
        it "returns admin_dummies_path" 

      end
    end

    context 'with Refinery::GroupClass' do
      module Refinery::GroupClass
      end

      it "returns admin_group_class_path" 

    end

    context 'with Refinery::DummyName' do
      module Refinery::DummyName
      end

      it "returns admin_dummy_name_path" 


      context ":plural => true" do
        it "returns admin_dummy_names_path" 

      end
    end

    context 'with Refinery::Dummy::Name' do
      module Refinery::Dummy
        module Name
        end
      end

      it "returns dummy_admin_name_path" 


      context ":plural => true" do
        it "returns dummy_admin_names_path" 

      end

      context ":admin => false" do
        it "returns dummy_name_path" 

      end

      context ":admin => false, :plural => true" do
        it "returns dummy_names_path" 

      end
    end
  end

  describe Refinery::Core::Engine do
    describe "#helpers" do
      it "should not include ApplicationHelper" 

    end
  end

  describe "backend_path" do
    let(:root_path) { "/custom/path" }

    it "should take into account the mount point" 

  end
end


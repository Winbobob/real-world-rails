require "spec_helper"

module RSpec::Rails
  describe HelperExampleGroup do
    module ::FoosHelper
      class InternalClass
      end
    end

    subject { HelperExampleGroup }

    it_behaves_like "an rspec-rails example group mixin", :helper,
      './spec/helpers/', '.\\spec\\helpers\\'

    it "provides a controller_path based on the helper module's name" 


    describe "#helper" do
      it "returns the instance of AV::Base provided by AV::TC::Behavior" 


      before do
        Object.const_set(:ApplicationHelper, Module.new)
      end

      after do
        Object.__send__(:remove_const, :ApplicationHelper)
      end

      it "includes ApplicationHelper" 

    end
  end

  describe HelperExampleGroup::ClassMethods do
    describe "determine_default_helper_class" do
      let(:group) do
        RSpec::Core::ExampleGroup.describe do
          include HelperExampleGroup
        end
      end

      context "the described is a module" do
        it "returns the module" 

      end

      context "the described is a class" do
        it "returns nil" 

      end
    end
  end
end


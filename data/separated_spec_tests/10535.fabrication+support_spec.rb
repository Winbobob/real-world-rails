require 'spec_helper'

describe Fabrication::Support do

  describe ".class_for" do

    context "with a class that exists" do

      it "returns the class for a class" 


      it "returns the class for a class name string" 


      it "returns the class for a class name symbol" 


    end

    context "with a class that doesn't exist" do

      it "returns nil for a class name string" 


      it "returns nil for a class name symbol" 


      context "and custom const_missing is defined" do
        before do
          module Family
            def self.const_missing(name)
              raise NameError, "original message"
            end
          end
        end

        it "raises an exception with the message from the original exception" 

      end
    end
  end

  describe '.hash_class', depends_on: :active_support do
    subject { Fabrication::Support.hash_class }

    context 'with HashWithIndifferentAccess defined' do
      it { should == HashWithIndifferentAccess }
    end

    context 'without HashWithIndifferentAccess defined' do
      before do
        TempHashWithIndifferentAccess = HashWithIndifferentAccess
        Fabrication::Support.instance_variable_set('@hash_class', nil)
        Object.send(:remove_const, :HashWithIndifferentAccess)
      end
      after do
        Fabrication::Support.instance_variable_set('@hash_class', nil)
        HashWithIndifferentAccess = TempHashWithIndifferentAccess
      end
      it { should == Hash }
    end
  end

end


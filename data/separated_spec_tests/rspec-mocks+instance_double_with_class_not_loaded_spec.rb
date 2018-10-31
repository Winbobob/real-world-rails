require 'support/doubled_classes'

module RSpec
  module Mocks
    RSpec.describe 'An instance double with the doubled class not loaded' do
      include_context "with isolated configuration"

      before do
        RSpec::Mocks.configuration.verify_doubled_constant_names = false
      end

      it 'includes the doubled module in errors for unexpected messages' 


      it 'allows any instance method to be stubbed' 


      it 'allows any instance method to be expected' 


      it 'handles classes that are materialized after mocking' 


      context 'for null objects' do
        let(:obj) { instance_double('NonLoadedClass').as_null_object }

        it 'returns self from any message' 


        it 'reports it responds to any message' 

      end

      context "when the class const has been previously stubbed" do
        before { class_double("NonLoadedClass").as_stubbed_const }

        it "treats the class as unloaded for `instance_double('NonLoadedClass')`" 


        it "treats the class as unloaded for `instance_double(NonLoadedClass)`" 

      end
    end
  end
end


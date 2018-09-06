require 'spec_helper'

describe Gitlab::Metrics::Instrumentation do
  let(:env) { {} }
  let(:transaction) { Gitlab::Metrics::WebTransaction.new(env) }

  before do
    @dummy = Class.new do
      def self.foo(text = 'foo')
        text
      end

      class << self
        def buzz(text = 'buzz')
          text
        end
        private :buzz

        def flaky(text = 'flaky')
          text
        end
        protected :flaky
      end

      def bar(text = 'bar')
        text
      end

      def wadus(text = 'wadus')
        text
      end
      private :wadus

      def chaf(text = 'chaf')
        text
      end
      protected :chaf
    end

    allow(@dummy).to receive(:name).and_return('Dummy')
  end

  describe '.series' do
    it 'returns a String' 

  end

  describe '.configure' do
    it 'yields self' 

  end

  describe '.instrument_method' do
    describe 'with metrics enabled' do
      before do
        allow(Gitlab::Metrics).to receive(:enabled?).and_return(true)

        described_class.instrument_method(@dummy, :foo)
      end

      it 'instruments the Class' 


      it 'defines a proxy method' 


      it 'calls the instrumented method with the correct arguments' 


      it 'tracks the call duration upon calling the method' 


      it 'does not track method calls below a given duration threshold' 


      it 'generates a method with the correct arity when using methods without arguments' 


      describe 'when a module is instrumented multiple times' do
        it 'calls the instrumented method with the correct arguments' 

      end
    end

    describe 'with metrics disabled' do
      before do
        allow(Gitlab::Metrics).to receive(:enabled?).and_return(false)
      end

      it 'does not instrument the method' 

    end
  end

  describe '.instrument_instance_method' do
    describe 'with metrics enabled' do
      before do
        allow(Gitlab::Metrics).to receive(:enabled?).and_return(true)

        described_class
          .instrument_instance_method(@dummy, :bar)
      end

      it 'instruments instances of the Class' 


      it 'defines a proxy method' 


      it 'calls the instrumented method with the correct arguments' 


      it 'tracks the call duration upon calling the method' 


      it 'does not track method calls below a given duration threshold' 

    end

    describe 'with metrics disabled' do
      before do
        allow(Gitlab::Metrics).to receive(:enabled?).and_return(false)
      end

      it 'does not instrument the method' 

    end
  end

  describe '.instrument_class_hierarchy' do
    before do
      allow(Gitlab::Metrics).to receive(:enabled?).and_return(true)

      @child1 = Class.new(@dummy) do
        def self.child1_foo; end

        def child1_bar; end
      end

      @child2 = Class.new(@child1) do
        def self.child2_foo; end

        def child2_bar; end
      end
    end

    it 'recursively instruments a class hierarchy' 


    it 'does not instrument the root module' 

  end

  describe '.instrument_methods' do
    before do
      allow(Gitlab::Metrics).to receive(:enabled?).and_return(true)
    end

    it 'instruments all public class methods' 


    it 'instruments all protected class methods' 


    it 'instruments all private instance methods' 


    it 'only instruments methods directly defined in the module' 


    it 'can take a block to determine if a method should be instrumented' 

  end

  describe '.instrument_instance_methods' do
    before do
      allow(Gitlab::Metrics).to receive(:enabled?).and_return(true)
    end

    it 'instruments all public instance methods' 


    it 'instruments all protected instance methods' 


    it 'instruments all private instance methods' 


    it 'only instruments methods directly defined in the module' 


    it 'can take a block to determine if a method should be instrumented' 

  end
end


require 'fast_spec_helper'

describe Gitlab::Utils::Override do
  let(:base) do
    Struct.new(:good) do
      def self.good
        0
      end
    end
  end

  let(:derived) { Class.new(base).tap { |m| m.extend described_class } }
  let(:extension) { Module.new.tap { |m| m.extend described_class } }

  let(:prepending_class) { base.tap { |m| m.prepend extension } }
  let(:including_class) { base.tap { |m| m.include extension } }

  let(:prepending_class_methods) do
    base.tap { |m| m.singleton_class.prepend extension }
  end

  let(:extending_class_methods) do
    base.tap { |m| m.extend extension }
  end

  let(:klass) { subject }

  def good(mod)
    mod.module_eval do
      override :good
      def good
        super.succ
      end
    end

    mod
  end

  def bad(mod)
    mod.module_eval do
      override :bad
      def bad
        true
      end
    end

    mod
  end

  shared_examples 'checking as intended' do
    it 'checks ok for overriding method' 


    it 'raises NotImplementedError when it is not overriding anything' 

  end

  shared_examples 'checking as intended, nothing was overridden' do
    it 'raises NotImplementedError because it is not overriding it' 


    it 'raises NotImplementedError when it is not overriding anything' 

  end

  shared_examples 'nothing happened' do
    it 'does not complain when it is overriding something' 


    it 'does not complain when it is not overriding anything' 

  end

  before do
    # Make sure we're not touching the internal cache
    allow(described_class).to receive(:extensions).and_return({})
  end

  describe '#override' do
    context 'when instance is klass.new(0)' do
      let(:instance) { klass.new(0) }

      context 'when STATIC_VERIFICATION is set' do
        before do
          stub_env('STATIC_VERIFICATION', 'true')
        end

        context 'when subject is a class' do
          subject { derived }

          it_behaves_like 'checking as intended'
        end

        context 'when subject is a module, and class is prepending it' do
          subject { extension }
          let(:klass) { prepending_class }

          it_behaves_like 'checking as intended'
        end

        context 'when subject is a module, and class is including it' do
          subject { extension }
          let(:klass) { including_class }

          it_behaves_like 'checking as intended, nothing was overridden'
        end
      end

      context 'when STATIC_VERIFICATION is not set' do
        before do
          stub_env('STATIC_VERIFICATION', nil)
        end

        context 'when subject is a class' do
          subject { derived }

          it_behaves_like 'nothing happened'
        end

        context 'when subject is a module, and class is prepending it' do
          subject { extension }
          let(:klass) { prepending_class }

          it_behaves_like 'nothing happened'
        end

        context 'when subject is a module, and class is including it' do
          subject { extension }
          let(:klass) { including_class }

          it 'does not complain when it is overriding something' 


          it 'does not complain when it is not overriding anything' 

        end
      end
    end

    context 'when instance is klass' do
      let(:instance) { klass }

      context 'when STATIC_VERIFICATION is set' do
        before do
          stub_env('STATIC_VERIFICATION', 'true')
        end

        context 'when subject is a module, and class is prepending it' do
          subject { extension }
          let(:klass) { prepending_class_methods }

          it_behaves_like 'checking as intended'
        end

        context 'when subject is a module, and class is extending it' do
          subject { extension }
          let(:klass) { extending_class_methods }

          it_behaves_like 'checking as intended, nothing was overridden'
        end
      end
    end
  end
end


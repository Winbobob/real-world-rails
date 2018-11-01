require File.dirname(__FILE__) + '/spec_helper'

require 'stringio'

describe Redis::Namespace do
  # Blind passthrough of unhandled commands will be removed
  # in 2.0; the following tests ensure that we support them
  # until that point, & that we can programatically disable
  # them in the meantime.
  context 'deprecated 1.x behaviour' do
    let(:redis) { double(Redis) }
    let(:namespaced) do
      Redis::Namespace.new(:ns, options.merge(:redis => redis))
    end

    let(:options) { Hash.new }

    subject { namespaced }

    its(:deprecations?) { should be false }
    its(:warning?) { should be true }

    context('with REDIS_NAMESPACE_DEPRECATIONS') do
      around(:each) {|e| with_env('REDIS_NAMESPACE_DEPRECATIONS'=>'1', &e) }
      its(:deprecations?) { should be true }
    end

    context('with REDIS_NAMESPACE_QUIET') do
      around(:each) {|e| with_env('REDIS_NAMESPACE_QUIET'=>'1', &e) }
      its(:warning?) { should be false }
    end

    before(:each) do
      allow(redis).to receive(:unhandled) do |*args| 
        "unhandled(#{args.inspect})"
      end
      allow(redis).to receive(:flushdb).and_return("OK")
    end

    # This behaviour will hold true after the 2.x migration
    context('with deprecations enabled') do
      let(:options) { {:deprecations => true} }
      its(:deprecations?) { should be true }

      context('with an unhandled command') do
        it { should_not respond_to :unhandled }

        it('raises a NoMethodError') do
          expect do
            namespaced.unhandled('foo')
          end.to raise_exception NoMethodError
        end
      end

      context('with an administrative command') do
        it { should_not respond_to :flushdb }

        it('raises a NoMethodError') do
          expect do
            namespaced.flushdb
          end.to raise_exception NoMethodError
        end
      end
    end

    # This behaviour will no longer be available after the 2.x migration
    context('with deprecations disabled') do
      let(:options) { {:deprecations => false} }
      its(:deprecations?) { should be false }

      context('with an an unhandled command') do
        it { should respond_to :unhandled }

        it 'blindly passes through' 


        it 'warns with helpful output' 


        context('and warnings disabled') do
          let(:options) { super().merge(:warning => false)}
          it 'does not warn' 

        end
      end

      context('with an administrative command') do
        it { should respond_to :flushdb }
        it 'processes the command' 

        it 'warns with helpful output' 

      end
    end
  end
end


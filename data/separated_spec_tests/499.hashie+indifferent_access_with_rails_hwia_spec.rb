# This set of tests verifies that Hashie::Extensions::IndifferentAccess works with
# ActiveSupport HashWithIndifferentAccess hashes. See #164 and #166 for details.

require 'active_support/hash_with_indifferent_access'
require 'active_support/core_ext/hash'
require 'spec_helper'

describe Hashie::Extensions::IndifferentAccess do
  class IndifferentHashWithMergeInitializer < Hash
    include Hashie::Extensions::MergeInitializer
    include Hashie::Extensions::IndifferentAccess

    class << self
      alias build new
    end
  end

  class IndifferentHashWithArrayInitializer < Hash
    include Hashie::Extensions::IndifferentAccess

    class << self
      alias build []
    end
  end

  class IndifferentHashWithTryConvertInitializer < Hash
    include Hashie::Extensions::IndifferentAccess

    class << self
      alias build try_convert
    end
  end

  class CoercableHash < Hash
    include Hashie::Extensions::Coercion
    include Hashie::Extensions::MergeInitializer
  end

  class MashWithIndifferentAccess < Hashie::Mash
    include Hashie::Extensions::IndifferentAccess
  end

  shared_examples_for 'hash with indifferent access' do
    it 'is able to access via string or symbol' 


    describe '#values_at' do
      it 'indifferently finds values' 

    end

    describe '#fetch' do
      it 'works like normal fetch, but indifferent' 

    end

    describe '#delete' do
      it 'deletes indifferently' 

    end

    describe '#key?' do
      let(:h) do
        indifferent_hash = ActiveSupport::HashWithIndifferentAccess.new(foo: 'bar')
        subject.build(indifferent_hash)
      end

      it 'finds it indifferently' 


      %w[include? member? has_key?].each do |key_alias|
        it "is aliased as #{key_alias}" 

      end
    end

    describe '#update' do
      let(:h) do
        indifferent_hash = ActiveSupport::HashWithIndifferentAccess.new(foo: 'bar')
        subject.build(indifferent_hash)
      end

      it 'allows keys to be indifferent still' 


      it 'recursively injects indifference into sub-hashes' 


      it 'does not change the ancestors of the injected object class' 

    end

    describe '#replace' do
      let(:h) do
        indifferent_hash = ActiveSupport::HashWithIndifferentAccess.new(foo: 'bar')
        subject.build(indifferent_hash).replace(bar: 'baz', hi: 'bye')
      end

      it 'returns self' 


      it 'removes old keys' 


      it 'creates new keys with indifferent access' 

    end

    describe '#try_convert' do
      describe 'with conversion' do
        let(:h) do
          indifferent_hash = ActiveSupport::HashWithIndifferentAccess.new(foo: 'bar')
          subject.try_convert(indifferent_hash)
        end

        it 'is a subject' 

      end

      describe 'without conversion' do
        let(:h) { subject.try_convert('{ :foo => bar }') }

        it 'is nil' 

      end
    end
  end

  describe 'with merge initializer' do
    subject { IndifferentHashWithMergeInitializer }
    it_should_behave_like 'hash with indifferent access'
  end

  describe 'with array initializer' do
    subject { IndifferentHashWithArrayInitializer }
    it_should_behave_like 'hash with indifferent access'
  end

  describe 'with try convert initializer' do
    subject { IndifferentHashWithTryConvertInitializer }
    it_should_behave_like 'hash with indifferent access'
  end

  describe 'with coercion' do
    subject { CoercableHash }

    let(:instance) { subject.new }

    it 'supports coercion for ActiveSupport::HashWithIndifferentAccess' 

  end

  describe 'Mash with indifferent access' do
    it 'is able to be created for a deep nested HashWithIndifferentAccess' 

  end
end


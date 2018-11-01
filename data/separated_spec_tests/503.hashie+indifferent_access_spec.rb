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

  class IndifferentHashWithDash < Hashie::Dash
    include Hashie::Extensions::IndifferentAccess
    property :foo
  end

  class IndifferentHashWithIgnoreUndeclaredAndPropertyTranslation < Hashie::Dash
    include Hashie::Extensions::IgnoreUndeclared
    include Hashie::Extensions::Dash::PropertyTranslation
    include Hashie::Extensions::IndifferentAccess
    property :foo, from: :bar
  end

  describe '#merge' do
    it 'indifferently merges in a hash' 


    it 'injects the resulting new Hash with IndifferentAccess' 

  end

  describe '#merge!' do
    it 'indifferently merges in a hash' 

  end

  describe 'when included in dash' do
    let(:params) { { foo: 'bar' } }
    subject { IndifferentHashWithDash.new(params) }

    it 'initialize with a symbol' 

  end

  describe 'when translating properties and ignoring undeclared' do
    let(:value) { 'baz' }

    subject { IndifferentHashWithIgnoreUndeclaredAndPropertyTranslation.new(params) }

    context 'and the hash keys are strings' do
      let(:params) { { 'bar' => value } }

      it 'sets the property' 

    end

    context 'and the hash keys are symbols' do
      let(:params) { { bar: 'baz' } }

      it 'sets the property' 

    end

    context 'and there are undeclared keys' do
      let(:params) { { 'bar' => 'baz', 'fail' => false } }

      it 'sets the property' 

    end
  end

  shared_examples_for 'hash with indifferent access' do
    it 'is able to access via string or symbol' 


    describe '#values_at' do
      it 'indifferently finds values' 


      it 'returns the same instance of the hash that was set' 


      it 'returns the same instance of the array that was set' 


      it 'returns the same instance of the string that was set' 


      it 'returns the same instance of the object that was set' 

    end

    describe '#fetch' do
      it 'works like normal fetch, but indifferent' 


      it 'returns the same instance of the hash that was set' 


      it 'returns the same instance of the array that was set' 


      it 'returns the same instance of the string that was set' 


      it 'returns the same instance of the object that was set' 


      it 'yields with key name if key does not exists' 

    end

    describe '#delete' do
      it 'deletes indifferently' 

    end

    describe '#key?' do
      let(:h) { subject.build(foo: 'bar') }

      it 'finds it indifferently' 


      %w[include? member? has_key?].each do |key_alias|
        it "is aliased as #{key_alias}" 

      end
    end

    describe '#update' do
      let(:h) { subject.build(foo: 'bar') }

      it 'allows keys to be indifferent still' 


      it 'recursively injects indifference into sub-hashes' 


      it 'does not change the ancestors of the injected object class' 

    end

    describe '#replace' do
      let(:h) { subject.build(foo: 'bar').replace(bar: 'baz', hi: 'bye') }

      it 'returns self' 


      it 'removes old keys' 


      it 'creates new keys with indifferent access' 

    end

    describe '#try_convert' do
      describe 'with conversion' do
        let(:h) { subject.try_convert(foo: 'bar') }

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
end


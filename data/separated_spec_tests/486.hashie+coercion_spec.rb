require 'spec_helper'

describe Hashie::Extensions::Coercion do
  class NotInitializable
    private_class_method :new
  end

  class Initializable
    attr_reader :coerced, :value

    def initialize(obj, coerced = nil)
      @coerced = coerced
      @value = obj.class.to_s
    end

    def coerced?
      !@coerced.nil?
    end
  end

  class Coercable < Initializable
    def self.coerce(obj)
      new(obj, true)
    end
  end

  before(:each) do
    class ExampleCoercableHash < Hash
      include Hashie::Extensions::Coercion
      include Hashie::Extensions::MergeInitializer
    end
  end

  subject { ExampleCoercableHash }

  let(:instance) { subject.new }

  describe '#coerce_key' do
    context 'nesting' do
      class BaseCoercableHash < Hash
        include Hashie::Extensions::Coercion
        include Hashie::Extensions::MergeInitializer
      end

      class NestedCoercableHash < BaseCoercableHash
        coerce_key :foo, String
        coerce_key :bar, Integer
      end

      class OtherNestedCoercableHash < BaseCoercableHash
        coerce_key :foo, Symbol
      end

      class RootCoercableHash < BaseCoercableHash
        coerce_key :nested, NestedCoercableHash
        coerce_key :other, OtherNestedCoercableHash
        coerce_key :nested_list, Array[NestedCoercableHash]
        coerce_key :nested_hash, Hash[String => NestedCoercableHash]
      end

      def test_nested_object(obj)
        expect(obj).to be_a(NestedCoercableHash)
        expect(obj[:foo]).to be_a(String)
        expect(obj[:bar]).to be_an(Integer)
      end

      subject { RootCoercableHash }
      let(:instance) { subject.new }

      it 'does not add coercions to superclass' 


      it 'coerces nested objects' 


      it 'coerces nested arrays' 


      it 'coerces nested hashes' 


      context 'when repetitively including the module' do
        class RepetitiveCoercableHash < NestedCoercableHash
          include Hashie::Extensions::Coercion
          include Hashie::Extensions::MergeInitializer

          coerce_key :nested, NestedCoercableHash
        end

        subject { RepetitiveCoercableHash }
        let(:instance) { subject.new }

        it 'does not raise a stack overflow error' 

      end
    end

    it { expect(subject).to be_respond_to(:coerce_key) }

    it 'runs through coerce on a specified key' 


    it 'skips unnecessary coercions' 


    it 'supports an array of keys' 


    it 'supports coercion for Array' 


    it 'supports coercion for Set' 


    it 'supports coercion for Set of primitive' 


    it 'supports coercion for Hash' 


    it 'supports coercion for Hash with primitive as value' 


    context 'coercing core types' do
      def test_coercion(literal, target_type, coerce_method)
        subject.coerce_key :foo, target_type
        instance[:foo] = literal
        expect(instance[:foo]).to be_a(target_type)
        expect(instance[:foo]).to eq(literal.send(coerce_method))
      end

      RSpec.shared_examples 'coerces from numeric types' do |target_type, coerce_method|
        it "coerces from String to #{target_type} via #{coerce_method}" 


        it "coerces from Integer to #{target_type} via #{coerce_method}" 


        it "coerces from Rational to #{target_type} via #{coerce_method}" 

      end

      RSpec.shared_examples 'coerces from alphabetical types' do |target_type, coerce_method|
        it "coerces from String to #{target_type} via #{coerce_method}" 


        it "coerces from Symbol to #{target_type} via #{coerce_method}" 

      end

      include_examples 'coerces from numeric types', Integer, :to_i
      include_examples 'coerces from numeric types', Float, :to_f
      include_examples 'coerces from numeric types', String, :to_s

      include_examples 'coerces from alphabetical types', String, :to_s
      include_examples 'coerces from alphabetical types', Symbol, :to_sym

      it 'can coerce String to Rational when possible' 


      it 'can coerce String to Complex when possible' 


      it 'coerces collections with core types' 


      it 'can coerce via a proc' 


      it 'raises errors for non-coercable types' 


      it 'can coerce false' 


      it 'does not coerce nil' 

    end

    it 'calls #new if no coerce method is available' 


    it 'coerces when the merge initializer is used' 


    context 'when #replace is used' do
      before { subject.coerce_key :foo, :bar, Coercable }

      let(:instance) do
        subject.new(foo: 'bar').replace(foo: 'foz', bar: 'baz', hi: 'bye')
      end

      it 'coerces relevant keys' 


      it 'sets correct values' 

    end

    context 'when used with a Mash' do
      class UserMash < Hashie::Mash
      end
      class TweetMash < Hashie::Mash
        include Hashie::Extensions::Coercion
        coerce_key :user, UserMash
      end

      it 'coerces with instance initialization' 


      it 'coerces when setting with attribute style' 


      it 'coerces when setting with string index' 


      it 'coerces when setting with symbol index' 

    end

    context 'when used with a Trash' do
      class UserTrash < Hashie::Trash
        property :email
      end
      class TweetTrash < Hashie::Trash
        include Hashie::Extensions::Coercion

        property :user, from: :user_data
        coerce_key :user, UserTrash
      end

      it 'coerces with instance initialization' 

    end

    context 'when used with IndifferentAccess to coerce a Mash' do
      class MyHash < Hash
        include Hashie::Extensions::Coercion
        include Hashie::Extensions::IndifferentAccess
        include Hashie::Extensions::MergeInitializer
      end

      class UserHash < MyHash
      end

      class TweetHash < MyHash
        coerce_key :user, UserHash
      end

      it 'coerces with instance initialization' 


      it 'coerces when setting with string index' 


      it 'coerces when setting with symbol index' 

    end

    context 'when subclassing' do
      class MyOwnBase < Hash
        include Hashie::Extensions::Coercion
      end

      class MyOwnHash < MyOwnBase
        coerce_key :value, Integer
      end

      class MyOwnSubclass < MyOwnHash
      end

      it 'inherits key coercions' 


      it 'the superclass does not accumulate coerced attributes from subclasses' 

    end

    context 'when using circular coercion' do
      context 'with a proc on one side' do
        class CategoryHash < Hash
          include Hashie::Extensions::Coercion
          include Hashie::Extensions::MergeInitializer

          coerce_key :products, lambda { |value|
            return value.map { |v| ProductHash.new(v) } if value.respond_to?(:map)

            ProductHash.new(v)
          }
        end

        class ProductHash < Hash
          include Hashie::Extensions::Coercion
          include Hashie::Extensions::MergeInitializer

          coerce_key :categories, Array[CategoryHash]
        end

        let(:category) { CategoryHash.new(type: 'rubygem', products: [Hashie::Mash.new(name: 'Hashie')]) }
        let(:product) { ProductHash.new(name: 'Hashie', categories: [Hashie::Mash.new(type: 'rubygem')]) }

        it 'coerces CategoryHash[:products] correctly' 


        it 'coerces ProductHash[:categories] correctly' 

      end

      context 'without a proc on either side' do
        it 'fails with a NameError since the other class is not defined yet' 

      end
    end
  end

  describe '#coerce_value' do
    context 'with strict: true' do
      it 'coerces any value of the exact right class' 


      it 'coerces values from a #replace call' 


      it 'does not coerce superclasses' 

    end

    context 'core types' do
      it 'coerces String to Integer when possible' 


      it 'coerces non-numeric from String to Integer' 


      it 'raises a CoercionError when coercion is not possible' 


      it 'coerces Integer to String' 


      it 'coerces Numeric to String' 


      it 'can coerce via a proc' 

    end
  end

  after(:each) do
    Object.send(:remove_const, :ExampleCoercableHash)
  end
end


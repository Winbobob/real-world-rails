require 'spec_helper'

describe Hashie::Trash do
  class TrashTest < Hashie::Trash
    property :first_name, from: :firstName
  end

  let(:trash) { TrashTest.new }

  describe 'translating properties' do
    it 'adds the property to the list' 


    it 'creates a method for reading the property' 


    it 'creates a method for writing the property' 


    it 'creates a method for writing the translated property' 


    it 'does not create a method for reading the translated property' 


    it 'maintains translations hash mapping from the original to the translated name' 


    it 'maintains inverse translations hash mapping from the translated to the original name' 


    it '#permitted_input_keys contain the :from key of properties with translations' 

  end

  describe 'standard properties' do
    class TrashTestPermitted < Hashie::Trash
      property :id
    end

    it '#permitted_input_keys contain names of properties without translations' 

  end

  describe 'writing to properties' do
    it 'does not write to a non-existent property using []=' 


    it 'writes to an existing property using []=' 


    it 'writes to a translated property using []=' 


    it 'reads/writes to an existing property using a method call' 


    it 'writes to an translated property using a method call' 


    it 'writes to a translated property using #replace' 


    it 'writes to a non-translated property using #replace' 

  end

  describe ' initializing with a Hash' do
    it 'does not initialize non-existent properties' 


    it 'sets the desired properties' 


    context 'with both the translated property and the property' do
      it 'sets the desired properties' 

    end

    it 'sets the translated properties' 

  end

  describe 'translating properties using a proc' do
    class TrashLambdaTest < Hashie::Trash
      property :first_name, from: :firstName, with: ->(value) { value.reverse }
    end

    let(:lambda_trash) { TrashLambdaTest.new }

    it 'translates the value given on initialization with the given lambda' 


    it 'does not translate the value if given with the right property' 


    it 'translates the value given as property with the given lambda' 


    it 'does not translate the value given as right property' 

  end

  describe 'translating multiple properties using a proc' do
    class SomeDataModel < Hashie::Trash
      property :value_a, from: :config, with: ->(config) { config.a }
      property :value_b, from: :config, with: ->(config) { config.b }
    end

    ConfigDataModel = Struct.new(:a, :b)

    subject { SomeDataModel.new(config: ConfigDataModel.new('value in a', 'value in b')) }

    it 'translates the first key' 


    it 'translates the second key' 


    it 'maintains translations hash mapping from the original to the translated name' 

  end

  describe 'uses with or transform_with interchangeably' do
    class TrashLambdaTestTransformWith < Hashie::Trash
      property :first_name, from: :firstName, transform_with: ->(value) { value.reverse }
    end

    let(:lambda_trash) { TrashLambdaTestTransformWith.new }

    it 'translates the value given as property with the given lambda' 


    it 'does not translate the value given as right property' 

  end

  describe 'translating properties without from option using a proc' do
    class TrashLambdaTestWithProperties < Hashie::Trash
      property :first_name, transform_with: ->(value) { value.reverse }
    end

    let(:lambda_trash) { TrashLambdaTestWithProperties.new }

    it 'translates the value given as property with the given lambda' 


    it 'transforms the value when given in constructor' 


    context 'when :from option is given' do
      class TrashLambdaTest3 < Hashie::Trash
        property :first_name, from: :firstName, transform_with: ->(value) { value.reverse }
      end

      it 'does not override the :from option in the constructor' 


      it 'does not override the :from option when given as property' 

    end
  end

  describe 'inheritable transforms' do
    class TransformA < Hashie::Trash
      property :some_value, transform_with: ->(v) { v.to_i }
    end

    class TransformB < TransformA
      property :some_other_value, transform_with: ->(v) { v.to_i }
    end

    class TransformC < TransformB
      property :some_value, transform_with: ->(v) { -v.to_i }
    end

    it 'inherit properties transforms' 


    it 'replaces property transform' 

  end

  describe 'inheritable translations' do
    class TranslationA < Hashie::Trash
      property :some_value, from: 'someValue', with: ->(v) { v.to_i }
    end

    class TranslationB < TranslationA
      property :some_other_value, from: 'someOtherValue'
    end

    it 'inherit properties translations' 

  end

  it 'raises an error when :from have the same value as property' 


  context 'when subclassing' do
    class Person < Hashie::Trash
      property :first_name, from: :firstName
    end

    class Hobbit < Person; end

    subject { Hobbit.new(firstName: 'Frodo') }

    it 'keeps translation definitions in subclasses' 

  end
end


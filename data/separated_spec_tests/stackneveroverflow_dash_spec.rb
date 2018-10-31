require 'spec_helper'

Hashie::Hash.class_eval do
  def self.inherited(klass)
    klass.instance_variable_set('@inheritance_test', true)
  end
end

class DashTest < Hashie::Dash
  property :first_name, required: true
  property :email
  property :count, default: 0
end

class DashTestDefaultProc < Hashie::Dash
  property :fields, default: -> { [] }
end

class DashNoRequiredTest < Hashie::Dash
  property :first_name
  property :email
  property :count, default: 0
end

class DashWithCoercion < Hashie::Dash
  include Hashie::Extensions::Coercion
  property :person
  property :city

  coerce_key :person, ::DashNoRequiredTest
end

class PropertyBangTest < Hashie::Dash
  property :important!
end

class SubclassedTest < DashTest
  property :last_name, required: true
end

class RequiredMessageTest < DashTest
  property :first_name, required: true, message: 'must be set.'
end

class DashDefaultTest < Hashie::Dash
  property :aliases, default: ['Snake']
end

class DeferredTest < Hashie::Dash
  property :created_at, default: proc { Time.now }
end

class DeferredWithSelfTest < Hashie::Dash
  property :created_at, default: -> { Time.now }
  property :updated_at, default: ->(test) { test.created_at }
end

describe DashTestDefaultProc do
  it 'as_json behaves correctly with default proc' 

end

describe DashTest do
  def property_required_error(property)
    [ArgumentError, "The property '#{property}' is required for #{subject.class.name}."]
  end

  def property_required_custom_error(property)
    [ArgumentError, "The property '#{property}' must be set."]
  end

  def property_message_without_required_error
    [ArgumentError, 'The :message option should be used with :required option.']
  end

  def no_property_error(property)
    [NoMethodError, "The property '#{property}' is not defined for #{subject.class.name}."]
  end

  subject { DashTest.new(first_name: 'Bob', email: 'bob@example.com') }
  let(:required_message) { RequiredMessageTest.new(first_name: 'Bob') }

  it('subclasses Hashie::Hash') { should respond_to(:to_mash) }

  describe '#to_s' do
    subject { super().to_s }
    it { should eq '#<DashTest count=0 email="bob@example.com" first_name="Bob">' }
  end

  it 'lists all set properties in inspect' 


  describe '#count' do
    subject { super().count }
    it { should be_zero }
  end

  it { should respond_to(:first_name) }
  it { should respond_to(:first_name=) }
  it { should_not respond_to(:nonexistent) }

  it 'errors out for a non-existent property' 


  it 'errors out when attempting to set a required property to nil' 


  it 'errors out when message added to not required property' 


  context 'writing to properties' do
    it 'fails writing a required property to nil' 


    it 'fails writing a required property to nil using []=' 


    it 'fails writing to a non-existent property using []=' 


    it 'works for an existing property using []=' 


    it 'works for an existing property using a method call' 

  end

  context 'reading from properties' do
    it 'fails reading from a non-existent property using []' 


    it 'is able to retrieve properties through blocks' 


    it 'is able to retrieve properties through blocks with method calls' 

  end

  context 'reading from deferred properties' do
    it 'evaluates proc after initial read' 


    it 'does not evalute proc after subsequent reads' 

  end

  context 'reading from a deferred property based on context' do
    it 'provides the current hash as context for evaluation' 

  end

  context 'converting from a Mash' do
    class ConvertingFromMash < Hashie::Dash
      property :property, required: true
    end

    context 'without keeping the original keys' do
      let(:mash) { Hashie::Mash.new(property: 'test') }

      it 'does not pick up the property from the stringified key' 

    end

    context 'when keeping the original keys' do
      class KeepingMash < Hashie::Mash
        include Hashie::Extensions::Mash::KeepOriginalKeys
      end

      let(:mash) { KeepingMash.new(property: 'test') }

      it 'picks up the property from the original key' 

    end
  end

  describe '#new' do
    it 'fails with non-existent properties' 


    it 'sets properties that it is able to' 


    it 'accepts nil' 


    it 'accepts block to define a global default' 


    it 'fails when required values are missing' 


    it 'does not overwrite default values' 

  end

  describe '#merge' do
    it 'creates a new instance of the Dash' 


    it 'merges the given hash' 


    it 'fails with non-existent properties' 


    it 'errors out when attempting to set a required property to nil' 


    context 'given a block' do
      it "sets merged key's values to the block's return value" 

    end
  end

  describe '#merge!' do
    it 'modifies the existing instance of the Dash' 


    it 'merges the given hash' 


    it 'fails with non-existent properties' 


    it 'errors out when attempting to set a required property to nil' 


    context 'given a block' do
      it "sets merged key's values to the block's return value" 

    end
  end

  describe 'properties' do
    it 'lists defined properties' 


    it 'checks if a property exists' 


    it 'checks if a property is required' 


    it 'doesnt include property from subclass' 


    it 'lists declared defaults' 


    it 'allows properties that end in bang' 

  end

  describe '#replace' do
    before { subject.replace(first_name: 'Cain') }

    it 'return self' 


    it 'sets all specified keys to their corresponding values' 


    it 'leaves only specified keys and keys with default values' 


    context 'when replacing keys with default values' do
      before { subject.replace(count: 3) }

      it 'sets all specified keys to their corresponding values' 

    end
  end

  describe '#update_attributes!(params)' do
    let(:params) { { first_name: 'Alice', email: 'alice@example.com' } }

    context 'when there is coercion' do
      let(:params_before) { { city: 'nyc', person: { first_name: 'Bob', email: 'bob@example.com' } } }
      let(:params_after) { { city: 'sfo', person: { first_name: 'Alice', email: 'alice@example.com' } } }

      subject { DashWithCoercion.new(params_before) }

      it 'update the attributes' 

    end

    it 'update the attributes' 


    context 'when required property is update to nil' do
      let(:params) { { first_name: nil, email: 'alice@example.com' } }

      it 'raise an ArgumentError' 

    end

    context 'when a default property is update to nil' do
      let(:params) { { count: nil, email: 'alice@example.com' } }

      it 'set the property back to the default value' 

    end
  end
end

describe Hashie::Dash, 'inheritance' do
  before do
    @top = Class.new(Hashie::Dash)
    @middle = Class.new(@top)
    @bottom = Class.new(@middle)
  end

  it 'reports empty properties when nothing defined' 


  it 'inherits properties downwards' 


  it 'doesnt inherit properties upwards' 


  it 'allows overriding a default on an existing property' 


  it 'allows clearing an existing default' 


  it 'allows nil defaults' 

end

describe SubclassedTest do
  subject { SubclassedTest.new(first_name: 'Bob', last_name: 'McNob', email: 'bob@example.com') }

  describe '#count' do
    subject { super().count }
    it { should be_zero }
  end

  it { should respond_to(:first_name) }
  it { should respond_to(:first_name=) }
  it { should respond_to(:last_name) }
  it { should respond_to(:last_name=) }

  it 'has one additional property' 


  it "didn't override superclass inheritance logic" 

end

class ConditionallyRequiredTest < Hashie::Dash
  property :username
  property :password, required: -> { !username.nil? }, message: 'must be set, too.'
end

describe ConditionallyRequiredTest do
  it 'does not allow a conditionally required property to be set to nil if required' 


  it 'allows a conditionally required property to be set to nil if not required' 


  it 'allows a conditionally required property to be set if required' 

end

class MixedPropertiesTest < Hashie::Dash
  property :symbol
  property 'string'
end

describe MixedPropertiesTest do
  subject { MixedPropertiesTest.new('string' => 'string', symbol: 'symbol') }

  it { should respond_to('string') }
  it { should respond_to(:symbol) }

  it 'property?' 


  it 'fetch' 


  it 'double define' 


  it 'assign' 

end

context 'Dynamic Dash Class' do
  it 'define property' 

end

context 'with method access' do
  class DashWithMethodAccess < Hashie::Dash
    include Hashie::Extensions::IndifferentAccess
    include Hashie::Extensions::MethodQuery

    property :test
  end

  subject(:dash) { DashWithMethodAccess.new(test: 'value') }

  describe '#test' do
    subject { dash.test }

    it { is_expected.to eq('value') }
  end

  describe '#test?' do
    subject { dash.test? }

    it { is_expected.to eq true }
  end
end


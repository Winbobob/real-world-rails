require "spec_helper"

class Service
  def single_associations
    FogSingleAssociationCollection.new
  end

  def multiple_associations
    FogMultipleAssociationsCollection.new
  end
end

class FogSingleAssociationModel < Fog::Model
  identity  :id
  attribute :name,  :type => :string
end

class FogMultipleAssociationsModel < Fog::Model
  identity  :id
  attribute :name,  :type => :string
end

class FogSingleAssociationCollection
  def get(id)
    FogSingleAssociationModel.new(:id => id)
  end
end

class FogMultipleAssociationsCollection < Fog::Association
  model FogMultipleAssociationsModel

  def get(id)
    FogMultipleAssociationsModel.new(:id => id)
  end
end

class FogAttributeTestModel < Fog::Model
  identity  :id
  attribute :key, :aliases => "keys", :squash => "id"
  attribute :time, :type => :time
  attribute :bool, :type => :boolean
  attribute :float, :type => :float
  attribute :integer, :type => :integer
  attribute :string, :type => :string
  attribute :timestamp, :type => :timestamp
  attribute :array, :type => :array
  attribute :default, :default => "default_value", :aliases => :some_name
  attribute :another_default, :default => false
  attribute :good_name, :as => :Badname

  has_one :one_object, :single_associations, :aliases => :single
  has_many :many_objects, :multiple_associations
  has_many :objects, :multiple_associations, :association_class => FogMultipleAssociationsCollection
  has_one_identity :one_identity, :single_associations, :as => :Crazyname
  has_many_identities :many_identities, :multiple_associations, :aliases => :multiple
  has_many_identities :identities, :multiple_associations, :association_class => FogMultipleAssociationsCollection

  def service
    Service.new
  end

  def requires_one_test
    requires_one :key, :time
  end

  def requires_test
    requires :string, :integer
  end
end

describe "Fog::Attributes" do
  let(:model) { FogAttributeTestModel.new }

  it "should not create alias for nil" 


  describe "squash 'id'" do
    it "squashes if the key is a String" 


    it "squashes if the key is a Symbol" 

  end

  describe ":type => time" do
    it "returns nil when provided nil" 


    it "returns '' when provided ''" 


    it "returns a Time object when passed a Time object" 


    it "returns a Time object when passed a string that is monkeypatched" 

  end

  describe ":type => :boolean" do
    it "returns the String 'true' as a boolean" 


    it "returns true as true" 


    it "returns the String 'false' as a boolean" 


    it "returns false as false" 


    it "returns a non-true/false value as nil" 

  end

  describe ":type => :float" do
    it "returns an integer as float" 


    it "returns a string as float" 

  end

  describe ":type => :integer" do
    it "returns a float as integer" 


    it "returns a string as integer" 

  end

  describe ":type => :string" do
    it "returns a float as string" 


    it "returns a integer as string" 

  end

  describe ":type => :timestamp" do
    it "returns a date as time" 


    it "returns a time as time" 


    it "returns a date_time as time" 

  end

  describe ":type => :array" do
    it "returns an empty array when not initialized" 


    it "returns an empty array as an empty array" 


    it "returns nil as an empty array" 


    it "returns an array with nil as an array with nil" 


    it "returns a single element as array" 


    it "returns an array as array" 

  end

  describe ":default => 'default_value'" do
    it "should return nil when default is not defined on a new object" 


    it "should return the value of the object when default is not defined" 


    it "should return the default value on a new object with value equal nil" 


    it "should return the value on a new object with value not equal nil" 


    it "should return false when default value is false on a new object" 


    it "should return the value of the persisted object" 


    it "should return nil on a persisted object without a value" 


    it "should return nil when an attribute with default value is setted to nil" 

  end

  describe ".has_one" do
    it "should create an instance_variable to save the association object" 


    it "should create a getter to save the association model" 


    it "should create a setter that accept an object as param" 


    it "should create an alias to single" 

  end

  describe ".has_one_identity" do
    it "should create an instance_variable to save the association identity" 


    it "should create a getter to load the association model" 


    describe "should create a setter that accept" do
      it "an id as param" 


      it "a model as param" 

    end
  end

  describe ".has_many" do
    it "should return an instance of Fog::Association" 


    it "should create an instance_variable to save the associated objects" 


    it "should create a getter to save all associated models" 


    it "should create a setter that accept an array of objects as param" 


    describe "with a custom collection class" do
      it "should return an instance of that collection class" 

    end
  end

  describe "#requires_one" do
    it "should require at least one attribute is supplied" 

  end

  describe "#requires" do
    it "should require all attributes are supplied" 

  end

  describe ".has_many_identities" do
    it "should return an instance of Fog::Association" 


    it "should create an instance_variable to save the associations identities" 


    it "should create a getter to load all association models" 


    describe "should create a setter that accept an array of" do
      it "ids as param" 


      it "models as param" 

    end

    it "should create an alias to multiple" 


    describe "with a custom collection class" do
      it "should return an instance of that collection class" 

    end
  end

  describe "#all_attributes" do
    describe "on a persisted object" do
      it "should return all attributes without default values" 

    end

    describe "on a new object" do
      it "should return all attributes including default values for empty attributes" 

    end
  end

  describe "#all_associations" do
    describe "without any association" do
      it "should return all associations empty" 

    end

    describe "with associations" do
      it "should return all association objects" 

    end
  end

  describe "#all_associations_and_attributes" do
    describe "on a persisted object" do
      it "should return all association and attributes but no default values" 

    end

    describe "on a non persisted object" do
      it "should return all association and attributes and the default value for blank attributes" 

    end
  end
end


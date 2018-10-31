require 'virtus'
require 'field_inspector'

RSpec.describe FieldInspector do
  module FieldInspectorSpec
    class Bar
      include Virtus.model

      attribute :a, String
    end

    class Foo
      include Virtus.model

      attribute :a, String
      attribute :b, Virtus::Attribute::Boolean
      attribute :c, DateTime
      attribute :d, Date
      attribute :e, Bar
      attribute :f, Array[String]
      attribute :g, Array[Bar]
    end
  end

  subject {
    described_class.new.fields(FieldInspectorSpec::Foo)
  }

  describe 'name' do
    it 'gives attribute names as symbols' 

  end

  describe 'type' do
    it 'gives non-Virtus types as symbols' 


    it 'gives Virtus types as themselves' 


    it 'gives non-Virtus array types as symbols' 


    it 'gives Virtus array types as themselves' 

  end

  describe 'cardinality' do
    it 'is :one for singular attributes' 


    it 'is :many for array attributes' 

  end

  describe 'array?' do
    it 'is true iff cardinality is :many' 

  end

  describe 'basic?' do
    it 'is false iff attribute is a Virtus type' 

  end
end


require 'unit_spec_helper'

describe Shoulda::Matchers::ActiveRecord::SerializeMatcher, type: :model do
  it 'accepts when the attribute is serialized' 


  context 'when attribute is not serialized' do
    it 'rejects' 


    it 'assigns a helpful failure message' 


    it 'assigns a helpful failure message when using #as' 


    it 'assigns a helpful failure message when using #as_instance_of' 


    def unserialized_model
      @model ||= define_model(:example, attr: :string).new
    end
  end

  context 'an attribute that will end up being serialized as YAML' do
    it 'accepts when the types match' 


    it 'rejects when the types do not match' 


    it 'rejects when using as_instance_of' 

  end

  context 'a serializer that is an instance of a class' do
    it 'accepts when using #as_instance_of' 


    it 'rejects when using #as' 

  end

  def with_serialized_attr(type = nil)
    define_model(:example, attr: :string) do
      if type
        serialize :attr, type
      else
        serialize :attr
      end
    end.new
  end

  def define_serializer(name)
    define_class(name) do
      def load(*); end
      def dump(*); end
    end
  end
end


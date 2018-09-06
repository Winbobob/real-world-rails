require 'spec_helper'

describe PhoneNumberValidator, '#validate_each' do
  it 'does not add errors with a valid phone number' 


  it 'adds errors with an invalid phone number' 


  def build_record(phone)
    test_class.new.tap do |object|
      object.phone = phone
    end
  end

  def test_class
    Class.new do
      include ActiveModel::Validations
      attr_accessor :phone

      def self.name
        'TestClass'
      end
    end
  end
end


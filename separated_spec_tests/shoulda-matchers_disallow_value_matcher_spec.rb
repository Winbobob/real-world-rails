require 'unit_spec_helper'

describe Shoulda::Matchers::ActiveModel::DisallowValueMatcher, type: :model do
  context 'an attribute with a format validation' do
    it 'does not match if the value is allowed' 


    it 'matches if the value is not allowed' 

  end

  context "an attribute with a context-dependent validation" do
    context "without the validation context" do
      it "does not match" 

    end

    context "with the validation context" do
      it "disallows a bad value" 


      it "does not match a good value" 

    end
  end

  context 'an attribute with a format validation and a custom message' do
    it 'does not match if the value and message are both correct' 


    it "delegates its failure message to its allow matcher's negative failure message" 


    it 'matches if the message is correct but the value is not' 

  end

  context 'an attribute where the message occurs on another attribute' do
    it 'matches if the message is correct but the value is not' 


    it 'does not match if the value and message are both correct' 


    def record_with_custom_validation
      define_model :example, attr: :string, attr2: :string do
        validate :custom_validation

        def custom_validation
          if self[:attr] != 'good value'
            self.errors[:attr2] << 'some message'
          end
        end
      end.new
    end
  end

  def matcher(value)
    described_class.new(value)
  end
  alias_method :disallow_value, :matcher
end


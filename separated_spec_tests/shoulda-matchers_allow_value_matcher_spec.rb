require 'unit_spec_helper'

describe Shoulda::Matchers::ActiveModel, type: :model do
  describe '#allow_values' do
    it 'is aliased to #allow_value' 

  end
end

describe Shoulda::Matchers::ActiveModel::AllowValueMatcher, type: :model do
  context "#description" do
    it 'describes itself with two values' 


    it 'describes itself with more than two values' 


    it 'describes itself with a single value' 


    if active_model_3_2?
      it 'describes itself with a strict validation' 

    end
  end

  describe '#_after_setting_value' do
    it 'sets a block which is yielded after each value is set on the attribute' 

  end

  context 'an attribute with a validation' do
    context 'given one good value' do
      context 'when used in the positive' do
        it 'accepts' 

      end

      context 'when used in the negative' do
        it 'rejects with an appropriate failure message' 

      end
    end

    context 'given several good values' do
      context 'when used in the positive' do
        it 'accepts' 

      end

      context 'when used in the negative' do
        it 'rejects with an appropriate failure message' 

      end
    end

    context 'given one bad value' do
      context 'when used in the positive' do
        it 'rejects with an appropriate failure message' 

      end

      context 'when used in the negative' do
        it 'accepts' 

      end
    end

    context 'given several bad values' do
      context 'when used in the positive' do
        it 'rejects with an appropriate failure message' 

      end

      context 'when used in the negative' do
        it 'accepts' 

      end
    end

    context 'given good values along with bad values' do
      context 'when used in the positive' do
        it 'rejects with an appropriate failure message' 

      end

      context 'when used in the negative' do
        it 'rejects with an appropriate failure message' 

      end
    end

    context 'given bad values along with good values' do
      context 'when used in the positive' do
        it 'rejects with an appropriate failure message' 

      end

      context 'when used in the negative' do
        it 'rejects with an appropriate failure message' 

      end
    end
  end

  context 'an attribute with a validation and a custom message' do
    it 'allows a good value' 


    it 'rejects a bad value with an appropriate failure message' 


    context 'when the custom messages do not match' do
      it 'rejects with an appropriate failure message' 

    end

    context 'when interpolation values are provided along with a custom message' do
      context 'when the messages match' do
        it 'accepts' 

      end

      context 'when the messages do not match' do
        it 'rejects with an appropriate failure message' 

      end
    end
  end

  context 'when the attribute being validated is different than the attribute that receives the validation error' do
    include UnitTests::AllowValueMatcherHelpers

    context 'when the validation error message was provided directly' do
      context 'given a valid value' do
        it 'accepts' 

      end

      context 'given an invalid value' do
        it 'rejects' 


        context 'if the messages do not match' do
          it 'technically accepts' 

        end
      end
    end

    context 'when the validation error message was provided via i18n' do
      it 'passes given a valid value' 


      it 'fails given an invalid value' 

    end
  end

  context "an attribute with a context-dependent validation" do
    context "without the validation context" do
      it "allows a bad value" 

    end

    context "with the validation context" do
      it "allows a good value" 


      it "rejects a bad value" 

    end
  end

  context 'an attribute with several validations' do
    let(:model) do
      define_model :example, attr: :string do
        validates_presence_of     :attr
        validates_length_of       :attr, within: 1..5
        validates_numericality_of :attr, greater_than_or_equal_to: 1,
          less_than_or_equal_to: 50000
      end.new
    end

    bad_values = [nil, '', 'abc', '0', '50001', '123456', []]

    it 'matches given a good value' 


    it 'does not match given a bad value' 


    it 'does not match given multiple bad values' 


    it "does not match given good values along with bad values" 


    it "does not match given bad values along with good values" 

  end

  context 'with a single value' do
    it 'allows you to call description before calling matches?' 

  end

  context 'with no values' do
    it 'raises an error' 

  end

  if active_model_3_2?
    context 'an attribute with a strict format validation' do
      context 'when qualified with strict' do
        it 'rejects a bad value, providing the correct failure message' 


        context 'qualified with a custom message' do
          it 'rejects a bad value when the failure messages do not match' 

        end
      end
    end
  end

  context 'when the attribute interferes with attempts to be set' do
    context 'when the attribute cannot be changed from nil to non-nil' do
      context 'and the record remains valid' do
        it 'accepts (and does not raise an AttributeChangedValueError)' 

      end

      context 'and the record becomes invalid' do
        it 'rejects with an appropriate failure message' 

      end
    end

    context 'when the attribute cannot be changed from non-nil to nil' do
      context 'and the record remains valid' do
        it 'accepts (and does not raise an AttributeChangedValueError)' 

      end

      context 'and the record becomes invalid' do
        it 'rejects with an appropriate failure message' 

      end
    end

    context 'when the attribute cannot be changed from a non-nil value to another non-nil value' do
      context 'and the record remains valid' do
        it 'accepts (and does not raise an AttributeChangedValueError)' 

      end

      context 'and the record becomes invalid' do
        it 'rejects with an appropriate failure message' 

      end
    end
  end

  context 'when the attribute does not exist on the model' do
    context 'when the assertion is positive' do
      it 'raises an AttributeDoesNotExistError' 

    end

    context 'when the assertion is negative' do
      it 'raises an AttributeDoesNotExistError' 

    end
  end

  context 'given attributes to preset on the record before validation' do
    context 'when the assertion is positive' do
      context 'if any attributes do not exist on the model' do
        it 'raises an AttributeDoesNotExistError' 

      end
    end

    context 'when the assertion is negative' do
      context 'if any attributes do not exist on the model' do
        it 'raises an AttributeDoesNotExistError' 

      end
    end
  end

  context 'given an ActiveRecord model' do
    context 'where the attribute under test is an enum and the given value is a value in that enum' do
      it 'accepts' 

    end
  end
end


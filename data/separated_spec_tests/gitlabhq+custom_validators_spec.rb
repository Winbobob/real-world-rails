require 'spec_helper'

describe API::Helpers::CustomValidators do
  let(:scope) do
    Struct.new(:opts) do
      def full_name(attr_name)
        attr_name
      end
    end
  end

  describe API::Helpers::CustomValidators::Absence do
    subject do
      described_class.new(['test'], {}, false, scope.new)
    end

    context 'empty param' do
      it 'does not raise a validation error' 

    end

    context 'invalid parameters' do
      it 'should raise a validation error' 

    end
  end

  describe API::Helpers::CustomValidators::IntegerNoneAny do
    subject do
      described_class.new(['test'], {}, false, scope.new)
    end

    context 'valid parameters' do
      it 'does not raise a validation error' 

    end

    context 'invalid parameters' do
      it 'should raise a validation error' 

    end
  end

  def expect_no_validation_error(params)
    expect { validate_test_param!(params) }.not_to raise_error
  end

  def expect_validation_error(params)
    expect { validate_test_param!(params) }.to raise_error(Grape::Exceptions::Validation)
  end

  def validate_test_param!(params)
    subject.validate_param!('test', params)
  end
end


require 'spec_helper'

describe Gitlab::Ci::Config::Entry::Validatable do
  let(:entry) do
    Class.new(Gitlab::Ci::Config::Entry::Node) do
      include Gitlab::Ci::Config::Entry::Validatable
    end
  end

  describe '.validator' do
    before do
      entry.class_eval do
        attr_accessor :test_attribute

        validations do
          validates :test_attribute, presence: true
        end
      end
    end

    it 'returns validator' 


    it 'returns only one validator to mitigate leaks' 


    context 'when validating entry instance' do
      let(:entry_instance) { entry.new('something') }

      context 'when attribute is valid' do
        before do
          entry_instance.test_attribute = 'valid'
        end

        it 'instance of validator is valid' 

      end

      context 'when attribute is not valid' do
        before do
          entry_instance.test_attribute = nil
        end

        it 'instance of validator is invalid' 

      end
    end
  end
end


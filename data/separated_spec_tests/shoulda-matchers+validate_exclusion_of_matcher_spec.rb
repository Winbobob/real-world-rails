require 'unit_spec_helper'

describe Shoulda::Matchers::ActiveModel::ValidateExclusionOfMatcher, type: :model do
  context 'an attribute which must be excluded from a range' do
    it 'accepts ensuring the correct range' 


    it 'rejects if the given range spills past the top of the range in the validation' 


    it 'rejects if the given range falls short of the top of the range in the validation' 


    it 'rejects if the given range spills past the bottom of the range in the validation' 


    it 'rejects if the given range falls short of the bottom of the range in the validation' 


    it 'does not override the default message with a blank' 


    it_supports(
      'ignoring_interference_by_writer',
      tests: {
        reject_if_qualified_but_changing_value_interferes: {
          model_name: 'Example',
          attribute_name: :attr,
          changing_values_with: :next_value,
          expected_message: <<-MESSAGE.strip
Expected Example to validate that :attr lies outside the range ‹2› to
‹5›, but this could not be proved.
  After setting :attr to ‹1› -- which was read back as ‹2› -- the
  matcher expected the Example to be valid, but it was invalid instead,
  producing these validation errors:

  * attr: ["is reserved"]

  As indicated in the message above, :attr seems to be changing certain
  values as they are set, and this could have something to do with why
  this test is failing. If you've overridden the writer method for this
  attribute, then you may need to change it to make this test pass, or
  do something else entirely.
          MESSAGE
        },
      },
      model_creator: :active_model
    ) do
      def validation_matcher_scenario_args
        super.deep_merge(validation_options: { in: 2..5 })
      end

      def configure_validation_matcher(matcher)
        matcher.in_range(2..5)
      end
    end

    it 'fails when used in the negative' 

  end

  context 'an attribute which must be excluded from a range with excluded end' do
    it 'accepts ensuring the correct range' 


    it 'rejects ensuring excluded value' 

  end

  context 'an attribute with a custom validation message' do
    it 'accepts ensuring the correct range' 


    it 'accepts ensuring the correct range with an interpolated variable in the message' 

  end

  context 'an attribute with custom range validations' do
    it 'accepts ensuring the correct range and messages' 


    it 'has correct description' 

  end

  context 'an attribute which must be excluded from an array' do
    it 'accepts with correct array' 


    it 'rejects when only part of array matches' 


    it 'rejects when array does not match at all' 


    context 'when there is one value' do
      it 'has correct description' 

    end

    context 'when there are two values' do
      it 'has correct description' 

    end

    context 'when there are three or more values' do
      it 'has correct description' 

    end

    it_supports(
      'ignoring_interference_by_writer',
      tests: {
        reject_if_qualified_but_changing_value_interferes: {
          model_name: 'Example',
          attribute_name: :attr,
          changing_values_with: :next_value,
          expected_message: <<-MESSAGE.strip
Expected Example to validate that :attr is neither ‹"one"› nor ‹"two"›,
but this could not be proved.
  After setting :attr to ‹"one"› -- which was read back as ‹"onf"› --
  the matcher expected the Example to be invalid, but it was valid
  instead.

  As indicated in the message above, :attr seems to be changing certain
  values as they are set, and this could have something to do with why
  this test is failing. If you've overridden the writer method for this
  attribute, then you may need to change it to make this test pass, or
  do something else entirely.
        MESSAGE
        },
      },
      model_creator: :active_model
    ) do
      def validation_matcher_scenario_args
        super.deep_merge(validation_options: { in: ['one', 'two'] })
      end

      def configure_validation_matcher(matcher)
        matcher.in_array(['one', 'two'])
      end
    end

    it 'fails when used in the negative' 


    def define_model_validating_exclusion(options)
      options = options.dup
      column_type = options.delete(:column_type) { :string }
      super options.merge(column_type: column_type)
    end
  end

  def define_model_validating_exclusion(options)
    options = options.dup
    attribute_name = options.delete(:attribute_name) { :attr }
    column_type = options.delete(:column_type) { :integer }

    define_model(:example, attribute_name => column_type) do |model|
      model.validates_exclusion_of(attribute_name, options)
    end
  end

  def validating_exclusion(options)
    define_model_validating_exclusion(options).new
  end

  alias_method :build_record_validating_exclusion, :validating_exclusion

  def validation_matcher_scenario_args
    super.deep_merge(matcher_name: :validate_exclusion_of)
  end
end


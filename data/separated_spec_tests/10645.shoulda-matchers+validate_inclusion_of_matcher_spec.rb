require 'unit_spec_helper'

describe Shoulda::Matchers::ActiveModel::ValidateInclusionOfMatcher, type: :model do
  shared_context 'for a generic attribute' do
    def self.testing_values_of_option(option_name, &block)
      [nil, true, false].each do |option_value|
        context_name = "+ #{option_name}"
        option_args = []
        matches_or_not = ['matches', 'does not match']
        to_or_not_to = [:to, :not_to]

        unless option_value == nil
          context_name << "(#{option_value})"
          option_args = [option_value]
        end

        if option_value == false
          matches_or_not.reverse!
          to_or_not_to.reverse!
        end
      end
    end

    context 'against an integer attribute' do
      it_behaves_like 'it supports in_array',
        possible_values: (1..5).to_a,
        zero: 0,
        reserved_outside_value: described_class::ARBITRARY_OUTSIDE_INTEGER

      it_behaves_like 'it supports in_range',
        possible_values: 1..5,
        zero: 0

      context 'when attribute validates a range of values via custom validation' do
        it 'matches ensuring the correct range and messages' 

      end

      def build_object(options = {}, &block)
        build_object_with_generic_attribute(
          options.merge(column_type: :integer, value: 1),
          &block
        )
      end

      def add_outside_value_to(values)
        values + [values.last + 1]
      end

      def validation_matcher_scenario_args
        super.deep_merge(column_type: :integer, default_value: 1)
      end
    end

    context 'against an attribute with a specific column limit' do
      it 'does not raise an exception when attempting to use the matcher' 


      def build_object(options = {}, &block)
        build_object_with_generic_attribute(
          options.merge(
            column_type: :integer,
            column_options: { limit: 2 },
            value: 1
          ),
          &block
        )
      end

      def expect_to_match_on_values(builder, values, &block)
        expect_to_match_in_array(builder, values, &block)
      end
    end

    context 'against a float attribute' do
      it_behaves_like 'it supports in_array',
        possible_values: [1.0, 2.0, 3.0, 4.0, 5.0],
        zero: 0.0,
        reserved_outside_value: described_class::ARBITRARY_OUTSIDE_INTEGER

      it_behaves_like 'it supports in_range',
        possible_values: 1.0..5.0,
        zero: 0.0

      def build_object(options = {}, &block)
        build_object_with_generic_attribute(
          options.merge(column_type: :float, value: 1.0),
          &block
        )
      end

      def add_outside_value_to(values)
        values + [values.last + 1]
      end

      def validation_matcher_scenario_args
        super.deep_merge(column_type: :float, default_value: 1.0)
      end
    end

    context 'against a decimal attribute' do
      it_behaves_like 'it supports in_array',
        possible_values: [1.0, 2.0, 3.0, 4.0, 5.0].map { |number|
          BigDecimal(number.to_s)
        },
        zero: BigDecimal('0.0'),
        reserved_outside_value: described_class::ARBITRARY_OUTSIDE_DECIMAL

      it_behaves_like 'it supports in_range',
        possible_values: BigDecimal('1.0') .. BigDecimal('5.0'),
        zero: BigDecimal('0.0')

      def build_object(options = {}, &block)
        build_object_with_generic_attribute(
          options.merge(column_type: :decimal, value: BigDecimal('1.0')),
          &block
        )
      end

      def add_outside_value_to(values)
        values + [values.last + 1]
      end

      def validation_matcher_scenario_args
        super.deep_merge(
          column_type: :decimal,
          default_value: BigDecimal('1.0')
        )
      end
    end

    context 'against a date attribute' do
      today = Date.today

      define_method(:today) { today }

      it_behaves_like 'it supports in_array',
        possible_values: (1..5).map { |n| today + n },
        reserved_outside_value: described_class::ARBITRARY_OUTSIDE_DATE

      it_behaves_like 'it supports in_range',
        possible_values: (today .. today + 5)

      define_method :build_object do |options = {}, &block|
        build_object_with_generic_attribute(
          options.merge(column_type: :date, value: today),
          &block
        )
      end

      def add_outside_value_to(values)
        values + [values.last + 1]
      end

      def validation_matcher_scenario_args
        super.deep_merge(column_type: :date, default_value: today)
      end
    end

    context 'against a datetime attribute' do
      now = DateTime.now

      define_method(:now) { now }

      it_behaves_like 'it supports in_array',
        possible_values: (1..5).map { |n| now + n },
        reserved_outside_value: described_class::ARBITRARY_OUTSIDE_DATETIME

      it_behaves_like 'it supports in_range',
        possible_values: (now .. now + 5)

      define_method :build_object do |options = {}, &block|
        build_object_with_generic_attribute(
          options.merge(column_type: :datetime, value: now),
          &block
        )
      end

      def add_outside_value_to(values)
        values + [values.last + 1]
      end

      def validation_matcher_scenario_args
        super.deep_merge(column_type: :datetime, default_value: now)
      end
    end

    context 'against a time attribute' do
      default_time = Time.zone.local(2000, 1, 1)

      define_method(:default_time) { default_time }

      it_behaves_like 'it supports in_array',
        possible_values: (1..3).map { |hour| default_time.change(hour: hour) }

      it_behaves_like 'it supports in_range',
        possible_values: (default_time.change(hour: 1) .. default_time.change(hour: 3))

      define_method :build_object do |options = {}, &block|
        build_object_with_generic_attribute(
          options.merge(column_type: :time, value: default_time),
          &block
        )
      end

      def add_outside_value_to(values)
        values + [values.last + 1]
      end

      def validation_matcher_scenario_args
        super.deep_merge(column_type: :time, default_value: default_time)
      end
    end

    context 'against a string attribute' do
      it_behaves_like 'it supports in_array',
        possible_values: %w(foo bar baz),
        reserved_outside_value: described_class::ARBITRARY_OUTSIDE_STRING

      def build_object(options = {}, &block)
        build_object_with_generic_attribute(
          options.merge(column_type: :string),
          &block
        )
      end

      def add_outside_value_to(values)
        values + %w(qux)
      end

      def validation_matcher_scenario_args
        super.deep_merge(column_type: :string)
      end
    end
  end

  shared_examples_for 'it supports allow_nil' do |args|
    valid_values = args.fetch(:valid_values)

    testing_values_of_option 'allow_nil' do |option_args, matches_or_not, to_or_not_to|
      it "#{matches_or_not[0]} when the validation specifies allow_nil" 


      it "#{matches_or_not[1]} when the validation does not specify allow_nil" 

    end

=begin
    it_supports(
      'ignoring_interference_by_writer',
      tests: {
        accept_if_qualified_but_changing_value_does_not_interfere: {
          changing_values_with: -> (value) { value || valid_values.first }
        },
        reject_if_qualified_but_changing_value_interferes: {
          attribute_name: :attr,
          changing_values_with: :never_falsy,
          expected_message_includes: <<-MESSAGE.strip
  As indicated in the message above, :attr seems to be changing certain
  values as they are set, and this could have something to do with why
  this test is failing. If you've overridden the writer method for this
  attribute, then you may need to change it to make this test pass, or
  do something else entirely.
          MESSAGE
        }
      }
    )
=end

    def validation_matcher_scenario_args
      super.deep_merge(validation_options: { allow_nil: true })
    end

    def configure_validation_matcher(matcher)
      super(matcher).allow_nil
    end
  end

  shared_examples_for 'it supports allow_blank' do |args|
    valid_values = args.fetch(:valid_values)

    testing_values_of_option 'allow_blank' do |option_args, matches_or_not, to_or_not_to|
      it "#{matches_or_not[0]} when the validation specifies allow_blank" 


      it "#{matches_or_not[1]} when the validation does not specify allow_blank" 

    end

=begin
    it_supports(
      'ignoring_interference_by_writer',
      tests: {
        accept_if_qualified_but_changing_value_does_not_interfere: {
          changing_values_with: -> (value) {
            value.presence || valid_values.first
          }
        },
        reject_if_qualified_but_changing_value_interferes: {
          attribute_name: :attr,
          changing_values_with: :never_blank,
          expected_message_includes: <<-MESSAGE.strip
  As indicated in the message above, :attr seems to be changing certain
  values as they are set, and this could have something to do with why
  this test is failing. If you've overridden the writer method for this
  attribute, then you may need to change it to make this test pass, or
  do something else entirely.
          MESSAGE
        }
      }
    )
=end

    def validation_matcher_scenario_args
      super.deep_merge(validation_options: { allow_blank: true })
    end

    def configure_validation_matcher(matcher)
      super(matcher).allow_blank
    end
  end

  shared_examples_for 'it supports with_message' do |args|
    valid_values = args.fetch(:valid_values)

    context 'given a string' do
      it 'matches when validation uses given message' 


      it 'matches when validation uses given message that has an interpolated variable' 


      it 'does not match when validation uses the default message instead of given message' 


      it 'does not match when validation uses a message but it is not same as given' 

    end

    context 'given a regex' do
      it 'matches when validation uses a message that matches the regex' 


      it 'does not match when validation uses the default message instead of given message' 


      it 'does not match when validation uses a message but it does not match regex' 

    end

    context 'given nil' do
      it 'is as if with_message had never been called' 

    end
  end

  shared_examples_for 'it supports in_array' do |args|
    possible_values = args.fetch(:possible_values)
    zero = args[:zero]
    reserved_outside_value = args[:reserved_outside_value]

    define_method(:valid_values) { args.fetch(:possible_values) }

    context 'when the record has no validations' do
      it 'passes when used in the negative' 


      it 'fails when used in the positive with an appropriate failure message' 

    end

    it 'matches given the same array of valid values' 


    it 'matches given a subset of the valid values' 


    if zero
      it 'matches when one of the given values is a zero' 

    end

    it 'does not match when one of the given values is invalid' 


    if reserved_outside_value
      it 'raises an error when valid and given value is our test outside value' 

    end

    it 'fails when used in the negative' 


    it_behaves_like 'it supports allow_nil', valid_values: possible_values
    it_behaves_like 'it supports allow_blank', valid_values: possible_values
    it_behaves_like 'it supports with_message', valid_values: possible_values

    if active_model_3_2?
      context '+ strict' do
        context 'when the validation specifies strict' do
          it 'matches when the given values match the valid values' 


          it 'does not match when the given values do not match the valid values' 

        end

        context 'when the validation does not specify strict' do
          it 'does not match' 

        end
      end
    end

    it_supports(
      'ignoring_interference_by_writer',
      tests: {
        reject_if_qualified_but_changing_value_interferes: {
          attribute_name: :attr,
          changing_values_with: :next_value,
          expected_message_includes: <<-MESSAGE.strip
  As indicated in the message above, :attr seems to be changing certain
  values as they are set, and this could have something to do with why
  this test is failing. If you've overridden the writer method for this
  attribute, then you may need to change it to make this test pass, or
  do something else entirely.
          MESSAGE
        }
      }
    )

    def expect_to_match_on_values(builder, values, &block)
      expect_to_match_in_array(builder, values, &block)
    end

    def expect_not_to_match_on_values(builder, values, &block)
      expect_not_to_match_in_array(builder, values, &block)
    end

    def validation_matcher_scenario_args
      super.deep_merge(validation_options: { in: valid_values })
    end

    def configure_validation_matcher(matcher)
      super(matcher).in_array(valid_values)
    end
  end

  shared_examples_for 'it supports in_range' do |args|
    possible_values = args[:possible_values]

    define_method(:valid_values) { args.fetch(:possible_values) }

    it 'does not match a record with no validations' 


    it 'matches given a range that exactly matches the valid range' 


    it 'does not match given a range whose start value falls outside valid range' 


    it 'does not match given a range whose start value falls inside valid range' 


    it 'does not match given a range whose end value falls inside valid range' 


    it 'does not match given a range whose end value falls outside valid range' 


    it_behaves_like 'it supports allow_nil', valid_values: possible_values
    it_behaves_like 'it supports allow_blank', valid_values: possible_values
    it_behaves_like 'it supports with_message', valid_values: possible_values

    if active_model_3_2?
      context '+ strict' do
        context 'when the validation specifies strict' do
          it 'matches when the given range matches the range in the validation' 


          it 'matches when the given range does not match the range in the validation' 

        end

        context 'when the validation does not specify strict' do
          it 'does not match' 

        end
      end
    end

    it_supports(
      'ignoring_interference_by_writer',
      tests: {
        reject_if_qualified_but_changing_value_interferes: {
          attribute_name: :attr,
          changing_values_with: :next_value,
          expected_message_includes: <<-MESSAGE.strip
  As indicated in the message above, :attr seems to be changing certain
  values as they are set, and this could have something to do with why
  this test is failing. If you've overridden the writer method for this
  attribute, then you may need to change it to make this test pass, or
  do something else entirely.
          MESSAGE
        }
      }
    )

    def expect_to_match_on_values(builder, range, &block)
      expect_to_match_in_range(builder, range, &block)
    end

    def expect_not_to_match_on_values(builder, range, &block)
      expect_not_to_match_in_range(builder, range, &block)
    end

    def validation_matcher_scenario_args
      super.deep_merge(validation_options: { in: valid_values })
    end

    def configure_validation_matcher(matcher)
      super(matcher).in_range(valid_values)
    end
  end

  shared_context 'against a boolean attribute for true and false' do
    context 'when ensuring inclusion of true' do
      it 'matches' 

    end

    context 'when ensuring inclusion of false' do
      it 'matches' 

    end

    context 'when ensuring inclusion of true and false' do
      it 'matches' 


      [[false, true], [true, false]].each do |booleans|
        it 'prints a warning' 

      end
    end
  end

  context 'for a database column' do
    include_context 'for a generic attribute'

    context 'against a timestamp column' do
      now = DateTime.now

      define_method(:now) { now }

      it_behaves_like 'it supports in_array',
        possible_values: (1..5).map { |n| now + n },
        reserved_outside_value: described_class::ARBITRARY_OUTSIDE_DATETIME

      it_behaves_like 'it supports in_range',
        possible_values: (now .. now + 5)

      define_method :build_object do |options = {}, &block|
        build_object_with_generic_attribute(
          options.merge(column_type: :timestamp, value: now),
          &block
        )
      end

      def add_outside_value_to(values)
        values + [values.last + 1]
      end

      def validation_matcher_scenario_args
        super.deep_merge(column_type: :timestamp, default_value: now)
      end
    end

    context 'against a boolean attribute' do
      context 'which is nullable' do
        include_context 'against a boolean attribute for true and false'

        context 'when ensuring inclusion of nil' do
          it 'matches' 


          it 'prints a warning' 

        end

        def build_object(options = {}, &block)
          super(options.merge(column_options: { null: true }, value: true))
        end
      end

      context 'which is non-nullable' do
        include_context 'against a boolean attribute for true and false'

        context 'when ensuring inclusion of nil' do
          it 'raises a specific error' 

        end

        def build_object(options = {}, &block)
          super(options.merge(column_options: { null: false }))
        end
      end

      def build_object(options = {}, &block)
        build_object_with_generic_attribute(
          options.merge(column_type: :boolean),
          &block
        )
      end
    end

    def define_simple_model(attribute_name: :attr, column_options: {}, &block)
      define_model('Example', attribute_name => column_options, &block)
    end

    def validation_matcher_scenario_args
      super.deep_merge(model_creator: :active_record)
    end
  end

  context 'for a plain Ruby attribute' do
    include_context 'for a generic attribute'

    context 'against a boolean attribute (designated by true)' do
      include_context 'against a boolean attribute for true and false'

      def build_object(options = {}, &block)
        build_object_with_generic_attribute(options.merge(value: true))
      end
    end

    context 'against a boolean attribute (designated by false)' do
      include_context 'against a boolean attribute for true and false'

      def build_object(options = {}, &block)
        build_object_with_generic_attribute(options.merge(value: false))
      end
    end

    def define_simple_model(attribute_name: :attr, column_options: {}, &block)
      define_active_model_class('Example', accessors: [attribute_name], &block)
    end

    def validation_matcher_scenario_args
      super.deep_merge(model_creator: :active_model)
    end
  end

  describe '#description' do
    context 'given an array of values' do
      context 'when there is one value' do
        it 'returns the correct string' 

      end

      context 'when there are two values' do
        it 'returns the correct string' 

      end

      context 'when there are three or more values' do
        it 'returns the correct string' 

      end
    end

    context 'given a range of values' do
      it 'returns the correct string' 

    end
  end

  def object_builder_class
    @_object_builder_class ||= Struct.new(:attribute, :object, :validation_options)
  end

  def build_object_with_generic_attribute(
    attribute_name: :attr,
    validation_options: nil,
    value: nil,
    **other_options
  )
    model = define_model_validating_inclusion(
      attribute_name: attribute_name,
      validation_options: validation_options,
      **other_options
    )

    object = model.new
    object.__send__("#{attribute_name}=", value)

    object_builder_class.new(attribute_name, object, validation_options)
  end

  def define_model_validating_inclusion(
    attribute_name: :attr,
    column_type: :string,
    column_options: {},
    validation_options: nil,
    custom_validation: nil,
    customize_model_class: -> (object) { }
  )
    column_options = { type: column_type, options: column_options }

    define_simple_model(
      attribute_name: attribute_name,
      column_options: column_options
    ) do |model|
      if validation_options
        model.validates_inclusion_of(attribute_name, validation_options)
      end

      if custom_validation
        model.class_eval do
          define_method :custom_validation do
            custom_validation.call(self, attribute_name)
          end

          validate :custom_validation
        end
      end

      if customize_model_class
        model.instance_eval(&customize_model_class)
      end
    end
  end

  def build_object_allowing(values, validation_options: {}, **other_options)
    build_object(
      validation_options: validation_options.merge(in: values),
      **other_options
    )
  end

  def expect_to_match(builder)
    matcher = validate_inclusion_of(builder.attribute)
    yield matcher if block_given?
    expect(builder.object).to(matcher)
  end

  def expect_not_to_match(builder)
    matcher = validate_inclusion_of(builder.attribute)
    yield matcher if block_given?
    expect(builder.object).not_to(matcher)
  end

  def expect_to_match_in_array(builder, array)
    expect_to_match(builder) do |matcher|
      matcher.in_array(array)
      yield matcher if block_given?
    end
  end

  def expect_not_to_match_in_array(builder, array)
    expect_not_to_match(builder) do |matcher|
      matcher.in_array(array)
      yield matcher if block_given?
    end
  end

  def expect_to_match_in_range(builder, range)
    expect_to_match(builder) do |matcher|
      matcher.in_range(range)
      yield matcher if block_given?
    end
  end

  def expect_not_to_match_in_range(builder, range)
    expect_not_to_match(builder) do |matcher|
      matcher.in_range(range)
      yield matcher if block_given?
    end
  end

  def expect_to_match_ensuring_range_and_messages(range, low_value, high_value)
    low_message = 'too low'
    high_message = 'too high'

    builder = build_object custom_validation: -> (object, attribute) {
      value = object.public_send(attribute)

      if value < low_value
        object.errors.add(attribute, low_message)
      elsif value > high_value
        object.errors.add(attribute, high_message)
      end
    }

    expect_to_match(builder) do |matcher|
      matcher.
        in_range(range).
        with_low_message(low_message).
        with_high_message(high_message)
    end
  end

  def validation_matcher_scenario_args
    super.deep_merge(matcher_name: :validate_inclusion_of)
  end
end


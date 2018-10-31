require 'unit_spec_helper'

describe Shoulda::Matchers::ActiveRecord::ValidateUniquenessOfMatcher, type: :model do
  shared_context 'it supports scoped attributes of a certain type' do |options = {}|
    column_type = options.fetch(:column_type)
    value_type = options.fetch(:value_type, column_type)
    array = options.fetch(:array, false)

    context 'when the correct scope is specified' do
      context 'when the subject is a new record' do
        it 'accepts' 


        it 'still accepts if the scope is unset beforehand' 

      end

      context 'when the subject is an existing record' do
        it 'accepts' 


        it 'still accepts if the scope is unset beforehand' 

      end
    end

    context "when more than one record exists that has the next version of the attribute's value" do
      it 'accepts' 

    end

    context 'when too narrow of a scope is specified' do
      it 'rejects with an appropriate failure message' 

    end

    context 'when too broad of a scope is specified' do
      it 'rejects with an appropriate failure message' 

    end

    context 'when a different scope is specified' do
      it 'rejects with an appropriate failure message' 

    end

    context 'when no scope is specified' do
      it 'rejects with an appropriate failure message' 


      context 'if the scope attribute is unset in the record given to the matcher' do
        it 'rejects with an appropriate failure message' 

      end
    end

    context 'when a non-existent attribute is specified as a scope' do
      context 'when there is more than one scope' do
        it 'rejects with an appropriate failure message (and does not raise an error)' 

      end

      context 'when there is more than one scope' do
        it 'rejects with an appropriate failure message (and does not raise an error)' 

      end
    end

    context 'when there is more than one validation on the same attribute with different scopes' do
      context 'when a record exists beforehand, where all scopes are set' do
        if column_type != :boolean
          context 'when each validation has the same (default) message' do
            it 'accepts' 

          end
        end

        context 'when each validation has a different message' do
          it 'accepts' 

        end
      end

      context 'when no record exists beforehand' do
        it 'accepts' 

      end
    end

    define_method(:build_attribute) do |attribute_options|
      attribute_options.deep_merge(
        column_type: column_type,
        value_type: value_type,
        options: { array: array }
      )
    end
  end

  context 'when the model does not have a uniqueness validation' do
    it 'rejects with an appropriate failure message' 

  end

  context 'when the model has a uniqueness validation' do
    context 'when the attribute has a character limit' do
      it 'accepts' 

    end

    context 'when the attribute is of integer type' do
      it 'accepts' 

    end

    context 'when the existing record was created beforehand' do
      context 'when the subject is a new record' do
        it 'accepts' 

      end

      context 'when the subject is itself the existing record' do
        it 'accepts' 

      end
    end

    context 'when the existing record was not created beforehand' do
      context 'and the subject is empty' do
        context 'and the attribute being tested is required' do
          it 'can save the subject without the attribute being set' 

        end

        context 'and the attribute being tested are required along with other attributes' do
          it 'can save the subject without the attributes being set' 

        end

        context 'and the attribute being tested has other validations on it' do
          it 'can save the subject without it being completely valid' 

        end

        context 'and the table has non-nullable columns other than the attribute being validated' do
          context 'which are set beforehand' do
            it 'can save the subject' 

          end

          context 'which are not set beforehand' do
            it 'raises a useful exception' 

          end
        end

        context 'and the model has required attributes other than the attribute being validated' do
          it 'can save the subject without the attributes being set' 

        end
      end

      context 'and the subject is not empty' do
        it 'creates the record automatically from the subject' 


        context 'and the table has required attributes other than the attribute being validated, set beforehand' do
          it 'can save the subject' 

        end

        context 'and the model has required attributes other than the attribute being validated, set beforehand' do
          it 'can save the subject' 

        end
      end
    end

    context 'when the validation has no scope and a scope is specified' do
      it 'rejects with an appropriate failure message' 

    end

    context 'and the validation has a custom message' do
      context 'when no message is specified' do
        it 'rejects with an appropriate failure message' 

      end

      context 'given a string' do
        context 'when the given and actual messages do not match' do
          it 'rejects with an appropriate failure message' 

        end

        context 'when the given and actual messages match' do
          it 'accepts' 

        end
      end

      context 'given a regex' do
        context 'when the given and actual messages do not match' do
          it 'rejects with an appropriate failure message' 

        end

        context 'when the given and actual messages match' do
          it 'accepts' 

        end
      end
    end

    it_supports(
      'ignoring_interference_by_writer',
      tests: {
        reject_if_qualified_but_changing_value_interferes: {
          model_name: 'Example',
          attribute_name: :attr,
          default_value: 'some value',
          changing_values_with: :next_value,
          expected_message: <<-MESSAGE.strip
Expected Example to validate that :attr is case-sensitively unique, but
this could not be proved.
  After taking the given Example, whose :attr is ‹"some valuf"›, and
  saving it as the existing record, then making a new Example and
  setting its :attr to ‹"some valuf"› (read back as ‹"some valug"›) as
  well, the matcher expected the new Example to be invalid, but it was
  valid instead.

  As indicated in the message above, :attr seems to be changing certain
  values as they are set, and this could have something to do with why
  this test is failing. If you or something else has overridden the
  writer method for this attribute to normalize values by changing their
  case in any way (for instance, ensuring that the attribute is always
  downcased), then try adding `ignoring_case_sensitivity` onto the end
  of the uniqueness matcher. Otherwise, you may need to write the test
  yourself, or do something different altogether.

          MESSAGE
        }
      }
    )

    it 'fails when used in the negative' 

  end

  context 'when the model has a scoped uniqueness validation' do
    context 'when one of the scoped attributes is a string column' do
      include_context 'it supports scoped attributes of a certain type',
        column_type: :string
    end

    context 'when one of the scoped attributes is a boolean column' do
      include_context 'it supports scoped attributes of a certain type',
        column_type: :boolean
    end

    context 'when there is more than one scoped attribute and all are boolean columns' do
      it 'accepts when all of the scoped attributes are true' 


      it 'accepts when all the scoped attributes are false' 


      it 'accepts when one of the scoped attributes is true and the other is false' 

    end

    context 'when one of the scoped attributes is an integer column' do
      include_context 'it supports scoped attributes of a certain type',
        column_type: :integer

      context 'when one of the scoped attributes is an enum' do
        it 'accepts' 


        context 'when too narrow of a scope is specified' do
          it 'rejects with an appropriate failure message' 

        end

        context 'when too broad of a scope is specified' do
          it 'rejects with an appropriate failure message' 

        end
      end
    end

    context 'when one of the scoped attributes is a date column' do
      include_context 'it supports scoped attributes of a certain type',
        column_type: :date
    end

    context 'when one of the scoped attributes is a datetime column (using DateTime)' do
      include_context 'it supports scoped attributes of a certain type',
        column_type: :datetime
    end

    context 'when one of the scoped attributes is a datetime column (using Time)' do
      include_context 'it supports scoped attributes of a certain type',
        column_type: :datetime,
        value_type: :time
    end

    context 'when one of the scoped attributes is a text column' do
      include_context 'it supports scoped attributes of a certain type',
        column_type: :text
    end

    if database_supports_uuid_columns?
      context 'when one of the scoped attributes is a UUID column' do
        include_context 'it supports scoped attributes of a certain type',
          column_type: :uuid
      end
    end

    if (
      database_supports_array_columns? &&
      active_record_supports_array_columns? &&
      active_record_uniqueness_supports_array_columns?
    )
      context 'when one of the scoped attributes is a array-of-string column' do
        include_examples 'it supports scoped attributes of a certain type',
          column_type: :string,
          array: true
      end

      context 'when one of the scoped attributes is an array-of-integer column' do
        include_examples 'it supports scoped attributes of a certain type',
          column_type: :integer,
          array: true
      end

      context 'when one of the scoped attributes is an array-of-date column' do
        include_examples 'it supports scoped attributes of a certain type',
          column_type: :date,
          array: true
      end

      context 'when one of the scoped attributes is an array-of-datetime column (using DateTime)' do
        include_examples 'it supports scoped attributes of a certain type',
          column_type: :datetime,
          array: true
      end

      context 'when one of the scoped attributes is an array-of-datetime column (using Time)' do
        include_examples 'it supports scoped attributes of a certain type',
          column_type: :datetime,
          value_type: :time,
          array: true
      end

      context 'when one of the scoped attributes is an array-of-text column' do
        include_examples 'it supports scoped attributes of a certain type',
          column_type: :text,
          array: true
      end
    end

    context "when an existing record that is not the first has a nil value for the scoped attribute" do
      it 'still works' 

    end
  end

  context 'when the model has a case-sensitive validation' do
    context 'when the matcher is not qualified with case_insensitive' do
      it 'accepts' 


      context 'given an existing record where the value of the attribute under test is not case-swappable' do
        it 'raises a NonCaseSwappableValueError' 

      end
    end

    context 'when the matcher is qualified with case_insensitive' do
      it 'rejects with an appropriate failure message' 

    end
  end

  context 'when the model has a case-insensitive validation' do
    context 'when case_insensitive is not specified' do
      it 'rejects with an appropriate failure message' 

    end

    context 'when case_insensitive is specified' do
      it 'accepts' 


      it_supports(
        'ignoring_interference_by_writer',
        tests: {
          reject_if_qualified_but_changing_value_interferes: {
            model_name: 'Example',
            attribute_name: :attr,
            default_value: 'some value',
            changing_values_with: :next_value,
            expected_message: <<-MESSAGE.strip
Expected Example to validate that :attr is case-insensitively unique,
but this could not be proved.
  After taking the given Example, whose :attr is ‹"some valuf"›, and
  saving it as the existing record, then making a new Example and
  setting its :attr to ‹"some valuf"› (read back as ‹"some valug"›) as
  well, the matcher expected the new Example to be invalid, but it was
  valid instead.

  As indicated in the message above, :attr seems to be changing certain
  values as they are set, and this could have something to do with why
  this test is failing. If you or something else has overridden the
  writer method for this attribute to normalize values by changing their
  case in any way (for instance, ensuring that the attribute is always
  downcased), then try adding `ignoring_case_sensitivity` onto the end
  of the uniqueness matcher. Otherwise, you may need to write the test
  yourself, or do something different altogether.
            MESSAGE
          }
        }
      )

      def validation_matcher_scenario_args
        super.deep_merge(validation_options: { case_sensitive: false })
      end

      def configure_validation_matcher(matcher)
        super(matcher).case_insensitive
      end
    end
  end

  context 'when the validation is declared with allow_nil' do
    context 'given a new record whose attribute is nil' do
      it 'accepts' 

    end

    context 'given an existing record whose attribute is nil' do
      it 'accepts' 

    end

    if active_record_supports_has_secure_password?
      context 'when the model is declared with has_secure_password' do
        it 'accepts' 

      end
    end
  end

  context 'when the validation is not declared with allow_nil' do
    context 'given a new record whose attribute is nil' do
      it 'rejects with an appropriate failure message' 

    end

    context 'given an existing record whose attribute is nil' do
      it 'rejects with an appropriate failure message' 

    end
  end

  context 'when the validation is declared with allow_blank' do
    context 'given a new record whose attribute is nil' do
      it 'accepts' 

    end

    context 'given an existing record whose attribute is nil' do
      it 'accepts' 

    end

    context 'given a new record whose attribute is empty' do
      it 'accepts' 

    end

    context 'given an existing record whose attribute is empty' do
      it 'accepts' 

    end

    if active_record_supports_has_secure_password?
      context 'when the model is declared with has_secure_password' do
        context 'given a record whose attribute is nil' do
          it 'accepts' 

        end

        context 'given a record whose attribute is empty' do
          it 'accepts' 

        end
      end
    end
  end

  context 'when the validation is not declared with allow_blank' do
    context 'given a new record whose attribute is nil' do
      it 'rejects with an appropriate failure message' 

    end

    context 'given an existing record whose attribute is nil' do
      it 'rejects with an appropriate failure message' 

    end

    context 'given a new record whose attribute is empty' do
      it 'rejects with an appropriate failure message' 

    end

    context 'given an existing record whose attribute is empty' do
      it 'rejects with an appropriate failure message' 

    end
  end

  context 'when testing that a polymorphic *_type column is one of the validation scopes' do
    it 'sets that column to a meaningful value that works with other validations on the same column' 


    context 'if the model the *_type column refers to is namespaced, and shares the last part of its name with an existing model' do
      it 'still works' 

    end
  end

  context 'when the model does not have the attribute being tested' do
    it 'fails with an appropriate failure message' 

  end

  context 'when the writer method for the attribute changes the case of incoming values' do
    context 'when the validation is case-sensitive' do
      context 'and the matcher is ensuring that the validation is case-sensitive' do
        it 'rejects with an appropriate failure message' 

      end

      context 'and the matcher is ignoring case sensitivity' do
        it 'accepts (and not raise an error)' 

      end
    end

    context 'when the validation is case-insensitive' do
      context 'and the matcher is ensuring that the validation is case-insensitive' do
        it 'accepts (and does not raise an error)' 

      end
    end
  end

  context 'when the column is a boolean column' do
    it 'accepts (and does not print a warning)' 

  end

  let(:model_attributes) { {} }

  def default_attribute
    {
      value_type: :string,
      column_type: :string,
      options: { array: false, null: true }
    }
  end

  def normalize_attribute(attribute)
    if attribute.is_a?(Hash)
      attribute_copy = attribute.dup

      if attribute_copy.key?(:type)
        attribute_copy[:value_type] = attribute_copy[:type]
        attribute_copy[:column_type] = attribute_copy[:type]
      end

      default_attribute.deep_merge(attribute_copy)
    else
      default_attribute.deep_merge(name: attribute)
    end
  end

  def normalize_attributes(attributes)
    attributes.map do |attribute|
      normalize_attribute(attribute)
    end
  end

  def column_options_from(attributes)
    attributes.inject({}) do |options, attribute|
      options[attribute[:name]] = {
        type: attribute[:column_type],
        options: attribute.fetch(:options, {})
      }
      options
    end
  end

  def attributes_with_values_for(model)
    model_attributes[model].each_with_object({}) do |attribute, attrs|
      attrs[attribute[:name]] = attribute.fetch(:value) do
        if attribute[:options][:null]
          nil
        else
          dummy_value_for(
            attribute[:value_type],
            array: attribute[:options][:array]
          )
        end
      end
    end
  end

  def dummy_value_for(attribute_type, array: false)
    if array
      [ dummy_scalar_value_for(attribute_type) ]
    else
      dummy_scalar_value_for(attribute_type)
    end
  end

  def dummy_scalar_value_for(attribute_type)
    case attribute_type
    when :string, :text
      'dummy value'
    when :integer
      1
    when :date
      Date.today
    when :datetime
      Date.today.to_datetime
    when :time
      Time.now
    when :uuid
      SecureRandom.uuid
    when :boolean
      true
    else
      raise ArgumentError, "Unknown type '#{attribute_type}'"
    end
  end

  def next_version_of(value, value_type)
    if value.is_a?(Array)
      [ next_version_of(value[0], value_type) ]
    elsif value_type == :uuid
      SecureRandom.uuid
    elsif value.is_a?(Time)
      value + 1
    elsif [true, false].include?(value)
      !value
    elsif value.respond_to?(:next)
      value.next
    end
  end

  def build_record_from(model, extra_attributes = {})
    attributes = attributes_with_values_for(model)
    model.new(attributes.merge(extra_attributes))
  end

  def create_record_from(model, extra_attributes = {})
    build_record_from(model, extra_attributes).tap do |record|
      record.save!
    end
  end

  def define_model_validating_uniqueness(options = {}, &block)
    attribute_name = options.fetch(:attribute_name) { self.attribute_name }
    attribute_type = options.fetch(:attribute_type, :string)
    attribute_options = options.fetch(:attribute_options, {})
    attribute = normalize_attribute(
      name: attribute_name,
      value_type: attribute_type,
      column_type: attribute_type,
      options: attribute_options
    )

    if options.key?(:attribute_value)
      attribute[:value] = options[:attribute_value]
    end

    scope_attributes = normalize_attributes(options.fetch(:scopes, []))
    scope_attribute_names = scope_attributes.map { |attr| attr[:name] }
    additional_attributes = normalize_attributes(
      options.fetch(:additional_attributes, [])
    )
    attributes = [attribute] + scope_attributes + additional_attributes
    validation_options = options.fetch(:validation_options, {})
    column_options = column_options_from(attributes)

    model = define_model(:example, column_options) do |m|
      m.validates_uniqueness_of attribute_name,
        validation_options.merge(scope: scope_attribute_names)

      if m.respond_to?(:attr_accessible)
        attributes.each do |attr|
          m.attr_accessible(attr[:name])
        end
      end

      block.call(m) if block
    end

    model_attributes[model] = attributes

    model
  end

  def build_record_validating_uniqueness(options = {}, &block)
    model = define_model_validating_uniqueness(options, &block)
    build_record_from(model)
  end
  alias_method :new_record_validating_uniqueness,
    :build_record_validating_uniqueness

  def create_record_validating_uniqueness(options = {}, &block)
    build_record_validating_uniqueness(options, &block).tap do |record|
      record.save!
    end
  end
  alias_method :existing_record_validating_uniqueness,
    :create_record_validating_uniqueness

  def build_record_validating_scoped_uniqueness_with_enum(options = {})
    options = options.dup
    enum_scope_attribute =
      normalize_attribute(options.delete(:enum_scope)).
      merge(value_type: :integer, column_type: :integer)
    additional_scopes = options.delete(:additional_scopes) { [] }
    options[:scopes] = [enum_scope_attribute] + additional_scopes
    dummy_enum_values = [:foo, :bar]

    model = define_model_validating_uniqueness(options)
    model.enum(enum_scope_attribute[:name] => dummy_enum_values)

    build_record_from(model)
  end

  def define_model_without_validation
    define_model(:example, attribute_name => :string) do |model|
      if model.respond_to?(:attr_accessible)
        model.attr_accessible(attribute_name)
      end
    end
  end

  def validate_uniqueness
    validate_uniqueness_of(attribute_name)
  end

  def attribute_name
    :attr
  end

  def validation_matcher_scenario_args
    super.deep_merge(
      matcher_name: :validate_uniqueness_of,
      model_creator: :"active_record/uniqueness_matcher"
    )
  end
end


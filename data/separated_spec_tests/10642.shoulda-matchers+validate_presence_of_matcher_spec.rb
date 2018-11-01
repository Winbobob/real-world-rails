require 'unit_spec_helper'

describe Shoulda::Matchers::ActiveModel::ValidatePresenceOfMatcher, type: :model do
  context 'a model with a presence validation' do
    it 'accepts' 


    it 'does not override the default message with a blank' 


    it_supports(
      'ignoring_interference_by_writer',
      tests: {
        accept_if_qualified_but_changing_value_does_not_interfere: {
          changing_values_with: :nil_to_blank
        },
        reject_if_qualified_but_changing_value_interferes: {
          model_name: 'Example',
          attribute_name: :attr,
          changing_values_with: :never_falsy,
          expected_message: <<-MESSAGE
Expected Example to validate that :attr cannot be empty/falsy, but this
could not be proved.
  After setting :attr to ‹nil› -- which was read back as ‹"dummy value"›
  -- the matcher expected the Example to be invalid, but it was valid
  instead.

  As indicated in the message above, :attr seems to be changing certain
  values as they are set, and this could have something to do with why
  this test is failing. If you've overridden the writer method for this
  attribute, then you may need to change it to make this test pass, or
  do something else entirely.
          MESSAGE
        }
      }
    )

    it 'fails when used in the negative' 

  end

  context 'a model without a presence validation' do
    it 'rejects with the correct failure message' 

  end

  context 'an ActiveModel class with a presence validation' do
    it 'accepts' 


    it 'does not override the default message with a blank' 


    it_supports(
      'ignoring_interference_by_writer',
      tests: {
        accept_if_qualified_but_changing_value_does_not_interfere: {
          changing_values_with: :nil_to_blank
        },
        reject_if_qualified_but_changing_value_interferes: {
          model_name: 'Example',
          attribute_name: :attr,
          changing_values_with: :never_falsy,
          expected_message: <<-MESSAGE
Expected Example to validate that :attr cannot be empty/falsy, but this
could not be proved.
  After setting :attr to ‹nil› -- which was read back as ‹"dummy value"›
  -- the matcher expected the Example to be invalid, but it was valid
  instead.

  As indicated in the message above, :attr seems to be changing certain
  values as they are set, and this could have something to do with why
  this test is failing. If you've overridden the writer method for this
  attribute, then you may need to change it to make this test pass, or
  do something else entirely.
          MESSAGE
        }
      }
    )

    def model_creator
      :active_model
    end
  end

  context 'an ActiveModel class without a presence validation' do
    it 'rejects with the correct failure message' 

  end

  context 'a has_many association with a presence validation' do
    it 'requires the attribute to be set' 


    it_supports(
      'ignoring_interference_by_writer',
      tests: {
        accept_if_qualified_but_changing_value_does_not_interfere: {
          changing_values_with: :nil_to_blank
        },
        reject_if_qualified_but_changing_value_interferes: {
          model_name: 'Example',
          attribute_name: :attr,
          changing_values_with: :never_falsy,
          expected_message: <<-MESSAGE
Expected Example to validate that :attr cannot be empty/falsy, but this
could not be proved.
  After setting :attr to ‹nil› -- which was read back as ‹"dummy value"›
  -- the matcher expected the Example to be invalid, but it was valid
  instead.

  As indicated in the message above, :attr seems to be changing certain
  values as they are set, and this could have something to do with why
  this test is failing. If you've overridden the writer method for this
  attribute, then you may need to change it to make this test pass, or
  do something else entirely.
          MESSAGE
        }
      }
    )

    def model_creator
      :"active_record/has_many"
    end
  end

  context 'a has_many association without a presence validation' do
    it 'does not require the attribute to be set' 

  end

  context 'a required has_and_belongs_to_many association' do
    it 'accepts' 


    def build_record_having_and_belonging_to_many
      create_table 'children_parents', id: false do |t|
        t.integer :child_id
        t.integer :parent_id
      end

      define_model :child

      define_model :parent do
        has_and_belongs_to_many :children
        validates_presence_of :children
      end.new
    end

    it_supports(
      'ignoring_interference_by_writer',
      tests: {
        accept_if_qualified_but_changing_value_does_not_interfere: {
          changing_values_with: :nil_to_blank
        },
        reject_if_qualified_but_changing_value_interferes: {
          model_name: 'Example',
          attribute_name: :attr,
          changing_values_with: :never_falsy,
          expected_message: <<-MESSAGE
Expected Example to validate that :attr cannot be empty/falsy, but this
could not be proved.
  After setting :attr to ‹nil› -- which was read back as ‹"dummy value"›
  -- the matcher expected the Example to be invalid, but it was valid
  instead.

  As indicated in the message above, :attr seems to be changing certain
  values as they are set, and this could have something to do with why
  this test is failing. If you've overridden the writer method for this
  attribute, then you may need to change it to make this test pass, or
  do something else entirely.
          MESSAGE
        }
      }
    )

    def model_creator
      :"active_record/has_and_belongs_to_many"
    end
  end

  context 'an optional has_and_belongs_to_many association' do
    before do
      define_model :child
      @model = define_model :parent do
        has_and_belongs_to_many :children
      end.new
      create_table 'children_parents', id: false do |t|
        t.integer :child_id
        t.integer :parent_id
      end
    end

    it 'rejects with the correct failure message' 

  end

  context "an i18n translation containing %{attribute} and %{model}" do
    before do
      stub_translation(
        "activerecord.errors.messages.blank",
        "Please enter a %{attribute} for your %{model}")
    end

    after { I18n.backend.reload! }

    it "does not raise an exception" 

  end

  if active_model_3_2?
    context 'a strictly required attribute' do
      it 'accepts when the :strict options match' 


      it 'rejects with the correct failure message when the :strict options do not match' 

    end

    it 'does not override the default message with a blank' 

  end

  context "an attribute with a context-dependent validation" do
    context "without the validation context" do
      it "does not match" 

    end

    context "with the validation context" do
      it "matches" 

    end
  end

  if rails_lte_4?
    context 'an active_resource model' do
      context 'with the validation context' do
        it 'does not raise an exception' 

      end
    end
  end

  if rails_4_x?
    context 'against a pre-set password in a model that has_secure_password' do
      it 'raises a CouldNotSetPasswordError' 

    end
  end

  context 'when the attribute typecasts nil to another blank value, such as an empty array' do
    it 'accepts (and does not raise an AttributeChangedValueError)' 

  end

  def matcher
    validate_presence_of(:attr)
  end

  def validating_presence(options = {})
    define_model :example, attr: :string do
      validates_presence_of :attr, options
    end.new
  end

  def active_model(&block)
    define_active_model_class('Example', accessors: [:attr], &block).new
  end

  def active_model_validating_presence
    active_model { validates_presence_of :attr }
  end

  def has_many_children(options = {})
    define_model :child
    define_model :parent do
      has_many :children
      if options[:presence]
        validates_presence_of :children
      end
    end.new
  end

  def active_resource_model
    define_active_resource_class :foo, attr: :string do
      validates_presence_of :attr
    end.new
  end

  def validation_matcher_scenario_args
    super.deep_merge(
      matcher_name: :validate_presence_of,
      model_creator: :active_record
    )
  end
end


require 'unit_spec_helper'

describe Shoulda::Matchers::ActiveModel::ValidateConfirmationOfMatcher, type: :model do
  include UnitTests::ConfirmationMatcherHelpers

  context '#description' do
    it 'states that the confirmation must match its base attribute' 

  end

  context 'when the model has a confirmation validation' do
    it 'passes' 


    context 'when a nil message is specified' do
      it 'ignores it' 

    end

    it_supports(
      'ignoring_interference_by_writer',
      tests: {
        reject_if_qualified_but_changing_value_interferes: {
          model_name: 'Example',
          attribute_name: :password,
          changing_values_with: :next_value,
          expected_message: <<-MESSAGE.strip
Expected Example to validate that :password_confirmation matches
:password, but this could not be proved.
  After setting :password_confirmation to ‹"same value"›, then setting
  :password to ‹"same value"› -- which was read back as ‹"same valuf"›
  -- the matcher expected the Example to be valid, but it was invalid
  instead, producing these validation errors:

  * password_confirmation: ["doesn't match Password"]

  As indicated in the message above, :password seems to be changing
  certain values as they are set, and this could have something to do
  with why this test is failing. If you've overridden the writer method
  for this attribute, then you may need to change it to make this test
  pass, or do something else entirely.
          MESSAGE
        },
      },
      model_creator: :active_model
    )

    it 'fails when used in the negative' 

  end

  context 'when the model does not have a confirmation attribute' do
    it 'raises an AttributeDoesNotExistError' 

  end

  context 'when the model does not have the attribute under test' do
    it 'raises an AttributeDoesNotExistError' 

  end

  context 'when the model has all attributes, but does not have the validation' do
    it 'fails with an appropriate failure message' 

  end

  context 'when both validation and matcher specify a custom message' do
    it 'passes when the expected and actual messages match' 


    it 'fails when the expected and actual messages do not match' 

  end

  context 'when the validation specifies a message via i18n' do
    it 'passes' 

  end

  def validation_matcher_scenario_args
    super.deep_merge(matcher_name: :validate_confirmation_of)
  end
end


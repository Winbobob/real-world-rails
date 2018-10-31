# frozen_string_literal: true

require 'spec_helper'

require 'rubocop'
require 'rubocop/rspec/support'

require_relative '../../../rubocop/cop/ruby_interpolation_in_translation'

# Disabling interpolation check as we deliberately want to have #{} in strings.
# rubocop:disable Lint/InterpolationCheck
describe RuboCop::Cop::RubyInterpolationInTranslation do
  subject(:cop) { described_class.new }

  it 'does not add an offence for a regular messages' 


  it 'adds the correct offence when using interpolation in a string' 


  it 'detects when using a ruby interpolation in the first argument of a pluralized string' 


  it 'detects when using a ruby interpolation in the second argument of a pluralized string' 


  it 'detects when using interpolation in a namespaced translation' 


  it 'does not add an offence for messages defined over multiple lines' 


  it 'adds an offence for violations in a message defined over multiple lines' 

end
# rubocop:enable Lint/InterpolationCheck


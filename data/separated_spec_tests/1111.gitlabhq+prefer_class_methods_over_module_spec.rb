# frozen_string_literal: true

require 'spec_helper'
require 'rubocop'
require 'rubocop/rspec/support'
require_relative '../../../rubocop/cop/prefer_class_methods_over_module'

describe RuboCop::Cop::PreferClassMethodsOverModule do
  include CopHelper

  subject(:cop) { described_class.new }

  it 'flags violation when using module ClassMethods' 


  it "doesn't flag violation when using class_methods" 


  it "doesn't flag violation when module is not extending ActiveSupport::Concern" 


  it "doesn't flag violation when ClassMethods is used inside a class" 


  it "doesn't flag violation when not using either class_methods or ClassMethods" 


  it 'autocorrects ClassMethods into class_methods' 

end


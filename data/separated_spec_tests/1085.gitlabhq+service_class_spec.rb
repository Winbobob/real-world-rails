# frozen_string_literal: true

require 'spec_helper'
require 'rubocop'
require 'rubocop/rspec/support'
require_relative '../../../../rubocop/cop/code_reuse/service_class'

describe RuboCop::Cop::CodeReuse::ServiceClass do
  include CopHelper

  subject(:cop) { described_class.new }

  it 'flags the use of a Service class in a Finder' 


  it 'flags the use of a Service class in a Presenter' 


  it 'flags the use of a Service class in a Serializer' 


  it 'flags the use of a Service class in a model' 


  it 'does not flag the use of a Service class in a regular class' 

end


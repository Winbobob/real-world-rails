# frozen_string_literal: true

require 'spec_helper'
require 'rubocop'
require 'rubocop/rspec/support'
require_relative '../../../../rubocop/cop/code_reuse/finder'

describe RuboCop::Cop::CodeReuse::Finder do
  include CopHelper

  subject(:cop) { described_class.new }

  it 'flags the use of a Finder inside another Finder' 


  it 'flags the use of a Finder inside a model class method' 


  it 'does not flag the use of a Finder in a non Finder file' 


  it 'does not flag the use of a Finder in a regular class method' 

end


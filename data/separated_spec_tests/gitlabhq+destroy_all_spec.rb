require 'spec_helper'
require 'rubocop'
require 'rubocop/rspec/support'
require_relative '../../../rubocop/cop/destroy_all'

describe RuboCop::Cop::DestroyAll do
  include CopHelper

  subject(:cop) { described_class.new }

  it 'flags the use of destroy_all with a send receiver' 


  it 'flags the use of destroy_all with a constant receiver' 


  it 'flags the use of destroy_all when passing arguments' 


  it 'flags the use of destroy_all with a local variable receiver' 


  it 'does not flag the use of delete_all' 

end


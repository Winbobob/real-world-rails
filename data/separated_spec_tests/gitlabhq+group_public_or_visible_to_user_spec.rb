require 'spec_helper'
require 'rubocop'
require 'rubocop/rspec/support'
require_relative '../../../rubocop/cop/group_public_or_visible_to_user'

describe RuboCop::Cop::GroupPublicOrVisibleToUser do
  include CopHelper

  subject(:cop) { described_class.new }

  it 'flags the use of Group.public_or_visible_to_user with a constant receiver' 


  it 'does not flat the use of public_or_visible_to_user with a constant that is not Group' 


  it 'does not flag the use of Group.public_or_visible_to_user with a send receiver' 

end


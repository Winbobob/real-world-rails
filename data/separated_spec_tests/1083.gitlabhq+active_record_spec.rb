# frozen_string_literal: true

require 'spec_helper'
require 'rubocop'
require 'rubocop/rspec/support'
require_relative '../../../../rubocop/cop/code_reuse/active_record'

describe RuboCop::Cop::CodeReuse::ActiveRecord do
  include CopHelper

  subject(:cop) { described_class.new }

  it 'flags the use of "where" without any arguments' 


  it 'flags the use of "where" with arguments' 


  it 'does not flag the use of "group" without any arguments' 


  it 'flags the use of "group" with arguments' 


  it 'does not flag the use of ActiveRecord models in a model' 


  it 'does not flag the use of ActiveRecord models in a spec' 


  it 'does not flag the use of ActiveRecord models in a background migration' 


  it 'does not flag the use of ActiveRecord models in lib/gitlab/database' 


  it 'autocorrects offenses in instance methods by whitelisting them' 


  it 'autocorrects offenses in class methods by whitelisting them' 


  it 'autocorrects offenses in blocks by whitelisting them' 

end


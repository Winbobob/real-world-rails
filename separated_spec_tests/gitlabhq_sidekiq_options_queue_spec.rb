require 'spec_helper'

require 'rubocop'
require 'rubocop/rspec/support'

require_relative '../../../rubocop/cop/sidekiq_options_queue'

describe RuboCop::Cop::SidekiqOptionsQueue do
  include CopHelper

  subject(:cop) { described_class.new }

  it 'registers an offense when `sidekiq_options` is used with the `queue` option' 


  it 'does not register an offense when `sidekiq_options` is used with another option' 

end


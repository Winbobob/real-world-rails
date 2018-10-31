require 'spec_helper'

require 'rubocop'
require 'rubocop/rspec/support'

require_relative '../../../rubocop/cop/include_sidekiq_worker'

describe RuboCop::Cop::IncludeSidekiqWorker do
  include CopHelper

  subject(:cop) { described_class.new }

  context 'when `Sidekiq::Worker` is included' do
    let(:source) { 'include Sidekiq::Worker' }
    let(:correct_source) { 'include ApplicationWorker' }

    it 'registers an offense ' 


    it 'autocorrects to the right version' 

  end
end


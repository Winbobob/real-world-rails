# frozen_string_literal: true

require 'rails_helper'

describe RegenerationWorker do
  subject { described_class.new }

  describe 'perform' do
    let(:account) { Fabricate(:account) }

    it 'calls the precompute feed service for the account' 


    it 'fails when account does not exist' 

  end
end


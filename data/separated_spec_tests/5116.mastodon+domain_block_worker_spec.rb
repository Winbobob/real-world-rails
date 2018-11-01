# frozen_string_literal: true

require 'rails_helper'

describe DomainBlockWorker do
  subject { described_class.new }

  describe 'perform' do
    let(:domain_block) { Fabricate(:domain_block) }

    it 'returns true for non-existent domain block' 


    it 'calls domain block service for relevant domain block' 

  end
end


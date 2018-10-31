# frozen_string_literal: true

require 'rails_helper'

describe ActivityPub::DeliveryWorker do
  subject { described_class.new }

  let(:sender)  { Fabricate(:account) }
  let(:payload) { 'test' }

  describe 'perform' do
    it 'performs a request' 


    it 'raises when request fails' 

  end
end


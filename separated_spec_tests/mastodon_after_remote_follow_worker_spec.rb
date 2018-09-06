# frozen_string_literal: true

require 'rails_helper'

describe AfterRemoteFollowWorker do
  subject { described_class.new }
  let(:follow) { Fabricate(:follow) }
  describe 'perform' do
    context 'when the follow does not exist' do
      it 'catches a raise and returns true' 

    end

    context 'when the account cannot be updated' do
      it 'returns nil and does not call service when account is nil' 


      it 'returns nil and does not call service when account is not locked' 

    end

    context 'when the account is updated' do
      it 'calls the follow service and destroys the follow' 

    end
  end
end


# frozen_string_literal: true

require 'rails_helper'

describe AfterRemoteFollowRequestWorker do
  subject { described_class.new }
  let(:follow_request) { Fabricate(:follow_request) }
  describe 'perform' do
    context 'when the follow_request does not exist' do
      it 'catches a raise and returns true' 

    end

    context 'when the account cannot be updated' do
      it 'returns nil and does not call service when account is nil' 


      it 'returns nil and does not call service when account is locked' 

    end

    context 'when the account is updated' do
      it 'calls the follow service and destroys the follow' 

    end
  end
end


require 'rails_helper'

RSpec.describe Api::PushController, type: :controller do
  describe 'POST #update' do
    context 'with hub.mode=subscribe' do
      it 'creates a subscription' 

    end

    context 'with hub.mode=unsubscribe' do
      it 'unsubscribes the account' 

    end

    context 'with unknown mode' do
      it 'returns an unknown mode error' 

    end
  end
end


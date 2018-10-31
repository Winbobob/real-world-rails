# frozen_string_literal: true

require 'spec_helper'

describe Users::SetStatusService do
  let(:current_user) { create(:user) }
  subject(:service) { described_class.new(current_user, params) }

  describe '#execute' do
    context 'when when params are set' do
      let(:params) { { emoji: 'taurus', message: 'a random status' } }

      it 'creates a status' 


      it 'updates a status if it already existed' 


      context 'for another user' do
        let(:target_user) { create(:user) }
        let(:params) do
          { emoji: 'taurus', message: 'a random status', user: target_user }
        end

        context 'the current user is admin' do
          let(:current_user) { create(:admin) }

          it 'changes the status when the current user is allowed to do that' 

        end

        it 'does not update the status if the current user is not allowed' 

      end
    end

    context 'without params' do
      let(:params) { {} }

      it 'deletes the status' 

    end
  end
end


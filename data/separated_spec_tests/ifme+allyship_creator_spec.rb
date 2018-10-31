# frozen_string_literal: true

describe AllyshipCreator do
  describe '#perform' do
    subject { described_class.perform }

    it 'calls .perform' 

  end

  describe '.perform' do
    subject { described_class.perform(params) }

    let(:user) { create(:user) }
    let(:ally) { create(:user, name: 'Ally') }
    let(:params) do
      {
        current_user: user,
        ally_id: ally.id
      }
    end

    context 'when new request' do
      context 'when valid' do
        it 'creates 2 allyships' 


        it 'creates the user allyship' 


        it 'creates the user allyship with pending_from_ally status' 


        it 'creates the ally allyship' 


        it 'creates the user allyship with pending_from_ally status' 


        it 'creates a notification about the allyship' 

      end

      context 'when invalid' do
        context 'without a current_user' do
          let(:user) { nil }

          it 'returns nil' 

        end

        context 'without an ally_id' do
          let(:ally) { double('ally', id: nil) }

          it 'returns nil' 

        end
      end
    end
  end
end


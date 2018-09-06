require 'spec_helper'

describe SavePosition do
  let(:user) { create(:user) }
  let(:position) { build(:position, user: user) }

  subject { described_class.new(position).call }

  context 'when position is valid' do
    it 'creates a new position' 


    it 'returns true' 


    context 'when position is primary' do
      let(:position) { build(:position, :primary, user: user) }

      it 'sets new primary_role for user' 

    end
  end

  context 'when position is invalid' do
    before { position.user = nil }

    it 'does not create a new position' 


    it 'returns false' 

  end
end


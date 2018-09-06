require 'spec_helper'

describe CommitmentSetter do
  let(:user) { build(:user, commitment: 40) }

  context 'when correct user role name is provided' do
    it 'changes user commitment value' 

  end

  context 'when correct user role name is not provided' do
    it 'does not change the commitment value' 

  end
end


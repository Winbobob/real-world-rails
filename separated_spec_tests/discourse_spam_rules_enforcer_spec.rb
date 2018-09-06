require 'rails_helper'

describe SpamRulesEnforcer do

  before do
    SystemMessage.stubs(:create)
  end

  describe 'enforce!' do
    context 'post argument' do
      subject(:enforce) { described_class.enforce!(Fabricate.build(:post)) }

      it 'performs the FlagSockpuppetRule' 

    end

    context 'user argument' do
      subject(:enforce) { described_class.enforce!(Fabricate.build(:user)) }

      it 'performs the AutoSilence' 

    end
  end

end


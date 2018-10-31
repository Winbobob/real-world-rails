require 'spec_helper'

describe Locomotive::API::Entities::MembershipEntity do

  subject { described_class }

  it { is_expected.to represent(:role) }

  context 'overrides' do
    let!(:account) { create(:account) }
    let!(:membership) { create(:membership, account: account) }
    subject { described_class.new(membership) }
    let(:exposure) { subject.serializable_hash }


    describe 'name' do
      it 'returns the name from the account' 

    end

    describe 'account_id' do
      it 'returns the string value of the account id' 

    end

  end

end


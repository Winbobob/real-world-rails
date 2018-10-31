require 'spec_helper'

describe Locomotive::API::Entities::AccountEntity do

  subject { described_class }

  attributes =
    %i(
      name
      email
      locale
      api_key
      super_admin
    )

  attributes.each do |exposure|
    it { is_expected.to represent(exposure) }
  end

  context 'overrides' do
    let!(:account) { create(:account) }
    let(:exposure) { subject.serializable_hash }
    subject { described_class.new(account) }

    describe 'local_admin' do
      context 'is a local_admin' do
        let(:role) { 'admin' }
        let!(:membership) do
          create(:admin, account: account, role: role)
        end
        it 'returns true' 

      end

      context 'is not a local_admin' do
        let(:role) { 'author' }
        let(:membership) do
          create(:admin, account: account, role: role)
        end
        it 'returns false' 

      end
    end

  end

end


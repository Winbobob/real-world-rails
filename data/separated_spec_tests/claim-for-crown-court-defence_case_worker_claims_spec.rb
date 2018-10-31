require 'rails_helper'

module Claims
  describe CaseWorkerClaims do

    let(:user) { create :user }

    let(:criteria) do
      {
        :sorting => "last_submitted_at",
        :direction => "asc",
        :scheme => "agfs",
        :filter => "all",
        :page => 0,
        :limit => 25,
        :search => nil,
        :value_band_id => 0
      }
    end

    context 'Using remote' do

      # before(:each) { allow(Settings).to receive(:case_workers_remote_allocations?).and_return(true) }

      context 'action current' do
        it 'calls user_allocations on Remote::Claim' 

      end

      context 'archived' do
        it 'calls archived on Remote::Claim' 

      end

      context 'allocated' do
        it 'calls allocated on Remote::Claim' 

      end

      context 'unallocated' do
        it 'calls unallocated on Remote::Claim' 

      end

      context 'unrecognised action' do
        it 'raises' 

      end

    end

  end
end


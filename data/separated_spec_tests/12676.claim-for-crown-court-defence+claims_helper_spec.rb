require 'rails_helper'

describe CaseWorkers::ClaimsHelper do

  # before(:each) do
  #   @case_worker = create :case_worker
  #   allow(helper).to receive(:current_user).and_return(@case_worker.user)
  # end

  describe '#current_claims_count' do
    it 'returns a collection of claims in assessment_states for the current user' 

  end

  describe '#allocated claims count' do
    context 'current user is admin' do
      it 'gets the count for all claims' 

    end
  end

  describe '#unallocated claims count' do
    context 'current user is admin' do
      it 'gets the count for all claims' 

    end
  end

  describe '#completed_claims_count' do

    context 'current user is admin' do
      it 'gets the count for all claims' 

    end

    context 'current user is  not admin' do
      it 'gets the count for current users claims' 

    end

  end

  context 'carousel helper methods' do

    let(:claim_ids) { [ 1244, 36364, 3774, 2773, 73773] }

    before(:each) do

      allow(helper).to receive(:claim_ids).and_return(claim_ids)
      allow(helper).to receive(:claim_count).and_return(claim_ids.size)
    end

    describe '#claim_position_and_count' do

      it 'returns the position and count of the claim in the list' 

    end

    describe '#last_claim?' do
      it 'returns true when it is the last claim' 


      it 'returns false when not the last claim' 

    end

    describe '#next_claim_link' do
      it 'returns a link for the next claim id in the series' 

    end
  end

  describe 'claim_count' do
    it 'returns the claim count from the session' 

  end
end


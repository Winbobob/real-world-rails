require 'rails_helper'

RSpec.describe Transform::Claim do
  let(:claim) { create :archived_pending_delete_claim }

  describe 'call' do
    subject(:call) { described_class.call(claim) }

    specify { is_expected.to be_a Hash }

    it 'has the required amount of key/value pairs ' 


    context 'runs different import types' do

      it 'retrieves data from linked objects' 


      it 'retrieves data from the claim directly' 


      it 'calculates the totals correctly' 


      it 'counts linked data correctly' 


      it 'counts linked data with where clauses correctly' 


      it 'converts the offence type' 


      it 'converts the claim description' 

    end
  end
end


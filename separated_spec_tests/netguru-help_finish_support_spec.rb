require 'rails_helper'

describe FinishSupport do

  let(:user) { User.new }
  let(:support) { Support.new }
  subject { described_class.new user, support }

  describe 'commence!' do

    let(:another_user) { User.new }

    before { allow(support).to receive(:save!) }

    describe 'reassigns user support' do
      context 'to user finishing the support' do
        it 'when user is some other user than the one requesting help' 

      end
      context 'to original user assigned to support' do
        it 'when finishing user is the one requesting help' 

      end
    end

    it 'finishes support' 


    it 'updates user counter' 


  end

end


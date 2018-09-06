require 'rails_helper'

describe CommentOnSupport do
  let(:user) { User.new }
  subject { described_class.new(user, Support.new, {}) }

  describe '#commence!' do
    before { allow(subject).to receive(:deliver_email) }

    it 'saves new comment' 


    it 'sends email to subscribers' 

  end

  describe '#subscribers' do
    before do
      allow(subject.support).to receive_message_chain(:comments, :pluck).
                                and_return([11, 12, 13, user.id])
    end
    after { subject.subscribers }

    it 'returns all related users without commenting one'  do
      expect(User).to receive(:where).with(id: [11, 12, 13])
    end

    context 'commenting user is receiver of support' do
      it 'returns all related users without receiver of support' 

    end
  end
end


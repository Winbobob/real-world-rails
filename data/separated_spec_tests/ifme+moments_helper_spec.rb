# frozen_string_literal: true
describe MomentsHelper, type: :controller do
  let(:user1) { create(:user1) }

  controller(MomentsController) do
  end

  describe 'moments_stats' do
    before(:example) do
      sign_in user1
    end

    it 'has no moments' 


    it 'has one moment' 


    it 'has more than one moment created this month' 


    it 'has more than one moment created on different months' 

  end
end


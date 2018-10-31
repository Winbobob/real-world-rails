require 'rails_helper'

RSpec.describe AnswersController, :type => :controller do
  describe 'POST #create' do
    let(:question) { FactoryGirl.create(:question) }
    let(:response) { post :create, question_id: question.id,
                     answer: { body: 'hey whats up' } }
    let(:rep) { FactoryGirl.create(:rep) }

    before do
      allow(controller).to receive(:current_user).and_return(rep.user)
      allow(controller).to receive(:authenticate_user!)
      allow(controller).to receive(:authorize)
      allow(controller).to receive(:verify_authorized)
    end

    it 'requires user to login' 


    it 'creates an answer' 


    it { expect(response).to redirect_to(question) }

    it 'sets flash success message' 


    context 'invalid answer' do
      before do
        answer = double
        allow(Answer).to receive(:new).and_return(answer)
        allow(answer).to receive(:save).and_return(false)
      end

      it { expect(response).to redirect_to(question) }

      it 'gives flash alert' 

    end
  end
end


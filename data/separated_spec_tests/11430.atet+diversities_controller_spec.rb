require 'rails_helper'

RSpec.describe DiversitiesController, type: :controller do
  describe 'PUT update' do
    let(:diversity_session) { Session.create }

    context 'confirmation page' do
      before do
        allow(controller).to receive(:diversity_session).and_return diversity_session
      end

      it "render the page as usual" 


      it 'destroy the session' 

    end

    context 'expired session' do
      before do
        session[:expires_in] = 2.minutes.ago
        allow(controller).to receive(:diversity_session).and_return diversity_session
      end

      it "redirect the page" 

    end
  end
end


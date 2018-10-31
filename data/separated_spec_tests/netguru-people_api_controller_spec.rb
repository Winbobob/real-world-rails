require 'spec_helper'

describe Api::ApiController do
  render_views

  controller(described_class) do
    def index
      render text: 'nothing'
    end
  end

  describe '#authenticate_api' do

    context 'when token is specified' do
      context 'with valid token' do
        it 'will not call render' 

      end

      context 'with invalid token' do
        it 'calls render with 403 status' 

      end
    end

    context 'when token is not specified' do
      context 'when current_user exists' do
        let(:current_user) { create(:user) }
        before { sign_in(current_user) }

        it 'will not call render' 

      end

      context 'when current_user does not exist' do
        it 'calls render with 403 status' 

      end
    end
  end
end


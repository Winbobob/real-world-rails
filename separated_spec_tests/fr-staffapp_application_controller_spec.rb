require 'rails_helper'

RSpec.describe ApplicationController, type: :controller do
  let(:user) { create :user }

  before do
    sign_in user
  end

  describe 'when action is not authorized' do
    controller do
      def index
        raise Pundit::NotAuthorizedError
      end
    end

    let(:referrer) { nil }

    before do
      request.env['HTTP_REFERER'] = referrer
      get :index
    end

    context 'when the request has a referrer' do
      let(:referrer) { processed_applications_path }

      it 'redirects back to the referrer' 


      it 'sets flash error message' 

    end

    context 'when the request does not have a referrer' do
      it 'redirects to the root url' 


      it 'sets flash error message' 

    end
  end
end


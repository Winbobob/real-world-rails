require 'rails_helper'

describe Settings::ExportsController do
  render_views

  describe 'GET #show' do
    context 'when signed in' do
      let(:user) { Fabricate(:user) }

      before do
        sign_in user, scope: :user
      end

      it 'renders export' 

    end

    context 'when not signed in' do
      it 'redirects' 

    end
  end
end


# frozen_string_literal: true

describe MomentsController do
  context 'when signed in' do
    let(:user) { create(:user) }
    let(:moment) { build(:moment, user: user) }

    before { sign_in user }

    it 'GET index' 


    it 'POST new' 


    it 'GET show' 


    describe 'POST create' do
      let(:valid_moment_params) { attributes_for(:moment) }

      def post_create(moment_params)
        post :create, params: { moment: moment_params }
      end

      context 'when valid params are supplied' do
        it 'creates a moment' 


        it 'has no validation errors' 


        it 'redirects to the moment page' 

      end

      context 'when invalid params are supplied' do
        let(:invalid_moment_params) { valid_moment_params.merge(name: nil, why: nil) }

        before { post_create invalid_moment_params }

        it 're-renders the creation form' 


        it 'adds errors to the moment ivar' 

      end

      context 'when the useri_d is hacked' do
        it 'creates a new moment, ignoring the useri_d parameter' 

      end
    end
  end

  describe 'Moment Analytic Charts' do
    it 'should contain react analytics objects' 

  end
end


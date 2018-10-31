require 'spec_helper'

describe PaymentsController do
  let(:user) { FactoryGirl.create(:user) }

  describe 'new' do
    context 'with user' do
      before do
        set_current_user(user)
      end
      it 'renders' 

    end
    context 'without user' do
      it 'renders' 

    end
  end

  describe 'create' do
    let(:token) do
      Stripe::Token.create(
        card: {
          number: '4242424242424242',
          exp_month: 12,
          exp_year: 2025,
          cvc: '314'
        }
      )
    end

    context 'with user' do
      before do
        set_current_user(user)
      end
      it 'makes a onetime payment with current user (and renders with revised_layout if suppose to)' 


      it 'signs up for a plan' 

    end

    context 'email of signed up user' do
      it 'makes a onetime payment with email for signed up user' 

    end
    context 'no user email on file' do
      it 'makes a onetime payment with no user, but associate with stripe' 

    end
  end
end


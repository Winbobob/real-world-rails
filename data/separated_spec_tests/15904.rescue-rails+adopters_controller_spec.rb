# == Schema Information
#
# Table name: adopters
#
#  id                  :integer          not null, primary key
#  name                :string(255)
#  email               :string(255)
#  phone               :string(255)
#  address1            :string(255)
#  address2            :string(255)
#  city                :string(255)
#  state               :string(255)
#  zip                 :string(255)
#  status              :string(255)
#  when_to_call        :string(255)
#  created_at          :datetime
#  updated_at          :datetime
#  dog_reqs            :text
#  why_adopt           :text
#  dog_name            :string(255)
#  other_phone         :string(255)
#  assigned_to_user_id :integer
#  flag                :string(255)
#  is_subscribed       :boolean          default(FALSE)
#  completed_date      :date
#

require 'rails_helper'

describe AdoptersController, type: :controller do
  render_views

  describe 'GET index' do
    include_context 'signed in admin'

    it 'should be successful' 

  end

  describe 'GET show' do
    include_context 'signed in admin'

    let(:adopter) { create(:adopter, :with_app, status: 'approved') }

    it 'should be successful' 

  end

  describe 'GET new' do
    it 'should be successful' 

  end

  describe 'POST create' do
    let(:adoption_app) { attributes_for(:adoption_app) }
    let(:adopter) { attributes_for(:adopter, adoption_app_attributes: adoption_app) }

    it 'creates an adopter' 

  end

  describe 'PUT update' do
    let(:adopter) { create(:adopter, :with_app, status: 'approved') }

    include_context 'signed in admin'

    context 'can complete adopters' do
      before do
        allow(controller).to receive(:can_complete_adopters?) { true }
      end

      it 'should be successful' 

    end

    context 'cannot complete adopters' do
      before do
        allow(controller).to receive(:can_complete_adopters?) { false }
      end

      it 'sets flash error' 

    end
  end

  describe 'Adopter recept of Training Coupon' do
    include ActiveJob::TestHelper
    include_context 'signed in admin'

    context 'adopter set to adopted status for the first time' do
      let(:adopter) { create(:adopter, :with_app, status: 'approved') }
      it 'free training coupon email created' 


      it 'free training coupon is sent' 


      it 'free training coupon is set to the right user' 


      it 'training_email_sent is set to true' 

    end

    context 'adopter has already been sent training email' do
      let(:adopter) { create(:adopter, :with_app, status: 'approved', training_email_sent: true) }

      it 'free training coupon is not sent' 

    end
  end

  describe 'GET check_email' do
    subject(:check_email) { get :check_email, xhr: true, params: { adopter: { email: adopter.email } } }

    context 'email exists' do
      let!(:adopter) { create(:adopter) }

      it 'returns false' 

    end

    context 'email does not exist' do
      let(:adopter) { build(:adopter) }

      it 'returns true' 

    end
  end
end


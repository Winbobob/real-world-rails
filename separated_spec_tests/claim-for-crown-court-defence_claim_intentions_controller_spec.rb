# == Schema Information
#
# Table name: claim_intentions
#
#  id         :integer          not null, primary key
#  form_id    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#

require 'rails_helper'

RSpec.describe ClaimIntentionsController, type: :controller do
  let!(:external_user) { create(:external_user) }

  before { sign_in external_user.user }

  describe 'POST #create' do
    context 'when form_id present' do
      let(:form_id) { SecureRandom.uuid }

      it 'should create a Claim Intention' 


      context 'user ID' do
        before do
          post :create, params: { claim_intention: {form_id: form_id} }
        end

        it 'should records the logged in user ID' 

      end
    end

    context 'when form_id not present' do
      it 'should not create a Claim Intention' 

    end
  end
end


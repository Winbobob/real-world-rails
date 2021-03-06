require 'rails_helper'

RSpec.describe 'external_users/claim_types/selection.html.haml', type: :view do

  include ViewSpecHelper

  before(:each) do
    initialize_view_helpers(view)
  end

  context 'claim type options' do
    context 'when logged in as AGFS/LGFS admin' do
      let(:external_user) { create(:external_user, :agfs_lgfs_admin) }

      before do
        sign_in(external_user.user)
        assign(:available_claim_types, %w(agfs lgfs_final lgfs_interim lgfs_transfer))
        render
      end

      it "should include advocate fee, litigator final, interim and transfer fee options" 


      it "should default to selecting Advocate final fee" 

    end

    context 'when logged in as litigator' do
      let(:external_user) { create(:external_user, :litigator) }

      before do
        sign_in(external_user.user)
        assign(:available_claim_types, %w(lgfs_final lgfs_interim lgfs_transfer))
        render
      end

      it "should include litigator final, interim and transfer fee options only" 


      it "should default to selecting Litigator final fee" 

    end

    context 'when logged in as advocate' do
      let(:external_user) { create(:external_user, :advocate) }

      before do
        sign_in(external_user.user)
        assign(:available_claim_types, %w(agfs))
        render
      end

      it "should include advocate fee options only" 

    end
  end

end


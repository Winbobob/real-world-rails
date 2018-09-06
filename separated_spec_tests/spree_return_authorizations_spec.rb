require 'spec_helper'

describe 'Return Authorizations', type: :feature do
  stub_authorization!

  describe 'listing' do
    let!(:return_authorization) { create(:return_authorization, created_at: Time.current) }
    let!(:return_authorization_2) { create(:return_authorization, created_at: Time.current - 1.day) }

    before do
      visit spree.admin_return_authorizations_path
    end

    it 'lists return authorizations sorted by created_at' 


    it 'displays order number' 


    it 'displays return authorization number' 


    it 'displays state' 


    it 'has edit link' 

  end

  describe 'searching' do
    let!(:return_authorization) { create(:return_authorization, state: 'authorized') }
    let!(:return_authorization_2) { create(:return_authorization, state: 'canceled') }

    it 'searches on number' 


    it 'searches on status' 

  end

  describe 'link' do
    let!(:return_authorization) { create(:return_authorization) }

    describe 'order number' do
      it 'opens orders edit page' 

    end

    describe 'return authorization number' do
      it 'opens return authorization edit page' 

    end

    describe 'authorized' do
      let!(:return_authorization) { create(:return_authorization, state: 'authorized') }
      let!(:return_authorization_2) { create(:return_authorization, state: 'canceled') }

      it 'only shows authorized return authorizations' 


      it 'preselects authorized status in filter' 

    end

    describe 'canceled' do
      let!(:return_authorization) { create(:return_authorization, state: 'canceled') }
      let!(:return_authorization_2) { create(:return_authorization, state: 'authorized') }

      it 'only shows canceled return authorizations' 


      it 'preselects canceled status in filter' 

    end
  end
end


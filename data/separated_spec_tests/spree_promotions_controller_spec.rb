require 'spec_helper'

describe Spree::Admin::PromotionsController, type: :controller do
  stub_authorization!

  let!(:promotion1) { create(:promotion, name: 'name1', code: 'code1', path: 'path1') }
  let!(:promotion2) { create(:promotion, name: 'name2', code: 'code2', path: 'path2') }
  let!(:category) { create :promotion_category }

  context '#index' do
    it 'succeeds' 


    it 'assigns promotion categories' 


    context 'search' do
      it 'pages results' 


      it 'filters by name' 


      it 'filters by code' 


      it 'filters by path' 

    end
  end

  context '#clone' do
    context 'cloning valid promotion' do
      subject do
        spree_post :clone, id: promotion1.id
      end

      it 'creates a copy of promotion' 


      it 'creates a copy of promotion with changed fields' 

    end

    context 'cloning invalid promotion' do
      subject do
        spree_post :clone, id: promotion3.id
      end

      let!(:promotion3) { create(:promotion, name: 'Name3', code: 'code3', path: '') }

      before do
        create(:promotion, name: 'Name4', code: 'code4', path: '_new') # promotion 4
      end

      it 'doesnt create a copy of promotion' 


      it 'returns error' 

    end
  end
end


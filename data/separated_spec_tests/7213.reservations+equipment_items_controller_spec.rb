# frozen_string_literal: true

require 'spec_helper'

describe EquipmentItemsController, type: :controller do
  before(:each) { mock_app_config }

  it_behaves_like 'calendarable', EquipmentItem

  describe 'GET index' do
    context 'with admin user' do
      before { mock_user_sign_in(UserMock.new(:admin)) }

      describe 'basic function' do
        before { get :index }
        it_behaves_like 'successful request', :index
      end

      it 'defaults to all active equipment items' 


      context '@equipment_model set' do
        it 'restricts to the model' 

      end

      context 'show_deleted set' do
        it 'gets all equipment items' 

      end
    end
    context 'with checkout person user' do
      before do
        mock_user_sign_in(UserMock.new(:checkout_person))
        get :index
      end
      it_behaves_like 'successful request', :index
    end
    context 'with normal user' do
      before do
        mock_user_sign_in
        get :index
      end
      it_behaves_like 'redirected request'
    end
  end

  describe 'GET show' do
    context 'with admin user' do
      let!(:item) { EquipmentItemMock.new(traits: [:findable]) }
      before do
        mock_user_sign_in(UserMock.new(:admin))
        get :show, params: { id: item.id }
      end
      it_behaves_like 'successful request', :show
      it 'sets to correct equipment item' 

    end
    context 'with normal user' do
      before do
        mock_user_sign_in
        get :show, params: { id: 1 }
      end
      it_behaves_like 'redirected request'
    end
  end

  describe 'GET new' do
    context 'with admin user' do
      before do
        mock_user_sign_in(UserMock.new(:admin))
        get :new
      end
      it_behaves_like 'successful request', :new
      it 'assigns a new equipment item to @equipment_item' 

      it 'sets equipment_model when one is passed through params' 

    end
    context 'with normal user' do
      before do
        mock_user_sign_in
        get :new
      end
      it_behaves_like 'redirected request', :new
    end
  end

  describe 'POST create' do
    context 'with admin user' do
      before { mock_user_sign_in(UserMock.new(:admin, md_link: 'admin')) }
      let!(:model) { FactoryGirl.build_stubbed(:equipment_model) }
      let!(:item) do
        EquipmentItemMock.new(traits: [[:with_model, model: model]])
      end
      context 'successful save' do
        before do
          allow(EquipmentItem).to receive(:new).and_return(item)
          allow(item).to receive(:save).and_return(true)
          post :create, params: { equipment_item: { id: 1 } }
        end
        it { is_expected.to set_flash[:notice] }
        it { is_expected.to redirect_to(model) }
        it 'saves item with notes' 

      end
      context 'unsuccessful save' do
        before do
          allow(EquipmentItem).to receive(:new).and_return(item)
          allow(item).to receive(:save).and_return(false)
          post :create, params: { equipment_item: { id: 1 } }
        end
        it { is_expected.not_to set_flash[:error] }
        it { is_expected.to render_template(:new) }
      end
    end

    context 'with normal user' do
      before do
        mock_user_sign_in
        post :create, params: { equipment_item: { id: 1 } }
      end
      it_behaves_like 'redirected request'
    end
  end

  describe 'PUT update' do
    context 'with admin user' do
      before { mock_user_sign_in(UserMock.new(:admin)) }
      let!(:item) { FactoryGirl.build_stubbed(:equipment_item) }
      context 'successful update' do
        before do
          allow(EquipmentItem).to receive(:find).with(item.id.to_s)
                                                .and_return(item)
          allow(item).to receive(:update)
          allow(item).to receive(:save).and_return(true)
          put :update, params: { id: item.id, equipment_item: { id: 3 } }
        end
        it { is_expected.to set_flash[:notice] }
        it { is_expected.to redirect_to(item) }
      end
      context 'unsuccessful update' do
        before do
          allow(EquipmentItem).to receive(:find).with(item.id.to_s)
                                                .and_return(item)
          allow(item).to receive(:update)
          allow(item).to receive(:save).and_return(false)
          put :update, params: { id: item.id, equipment_item: { id: 3 } }
        end
        it { is_expected.not_to set_flash }
        it { is_expected.to render_template(:edit) }
      end
    end
    context 'with normal user' do
      before do
        mock_user_sign_in
        put :update, params: { id: 1, equipment_item: { id: 3 } }
      end
      it_behaves_like 'redirected request'
    end
  end

  describe 'PUT deactivate' do
    context 'with admin user' do
      before { mock_user_sign_in(UserMock.new(:admin)) }
      shared_examples 'unsuccessful' do |flash_type, **opts|
        let!(:model) { FactoryGirl.build_stubbed(:equipment_model) }
        let!(:item) do
          EquipmentItemMock.new(traits: [:findable], equipment_model: model)
        end
        before { put :deactivate, params: { id: item.id, **opts } }
        it { is_expected.to set_flash[flash_type] }
        it { is_expected.to redirect_to(model) }
        it 'does not deactivate the item' 

      end
      it_behaves_like 'unsuccessful', :notice, deactivation_cancelled: true
      it_behaves_like 'unsuccessful', :notice, deactivation_cancelled: true,
                                               deactivation_reason: 'reason'
      it_behaves_like 'unsuccessful', :error
      context 'successful' do
        let!(:item) { EquipmentItemMock.new(traits: [:findable]) }
        before do
          request.env['HTTP_REFERER'] = '/referrer'
          allow(item).to receive(:current_reservation).and_return(false)
          put :deactivate,
              params: { id: item.id, deactivation_reason: 'reason' }
        end
        it { is_expected.to redirect_to('/referrer') }
        it 'deactivates the item' 

      end
      context 'with reservation' do
        let!(:item) { EquipmentItemMock.new(traits: [:findable]) }
        let!(:res) { ReservationMock.new }
        before do
          request.env['HTTP_REFERER'] = '/referrer'
          allow(item).to receive(:current_reservation).and_return(res)
          put :deactivate,
              params: { id: item.id, deactivation_reason: 'reason' }
        end
        it 'archives the reservation' 

      end
    end
    context 'with normal user' do
      before do
        mock_user_sign_in
        put :deactivate, params: { id: 1, deactivation_reason: 'reason' }
      end
      it_behaves_like 'redirected request'
    end
  end

  describe 'PUT activate' do
    context 'with admin user' do
      let!(:item) { EquipmentItemMock.new(traits: [:findable], notes: '') }
      before do
        mock_user_sign_in(UserMock.new(:admin, md_link: 'admin'))
        request.env['HTTP_REFERER'] = '/referrer'
        put :activate, params: { id: item.id }
      end
      it { is_expected.to redirect_to('/referrer') }
      it 'updates the deactivation reason and the notes' 

    end
    context 'with normal user' do
      before do
        mock_user_sign_in
        put :activate, params: { id: 1 }
      end
      it_behaves_like 'redirected request'
    end
  end
end


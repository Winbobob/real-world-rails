# frozen_string_literal: true

require 'spec_helper'

describe EquipmentModelsController, type: :controller do
  before(:each) { mock_app_config(requests_affect_availability: false) }
  it_behaves_like 'calendarable', EquipmentModel

  USER_ROLES = %i[admin user].freeze

  describe 'GET index' do
    shared_examples_for 'GET index success' do |user_role|
      before do
        mock_user_sign_in(UserMock.new(user_role))
      end

      describe 'basic function' do
        before { get :index }
        it_behaves_like 'successful request', :index
      end

      it 'defaults to all active equipment models' 


      context '@category set' do
        it 'restricts results to category' 

      end

      context 'with show deleted' do
        it 'populates an array of all equipment models' 

      end
    end
    USER_ROLES.each { |type| it_behaves_like 'GET index success', type }
  end

  describe 'GET new' do
    context 'with admin user' do
      before do
        mock_user_sign_in(UserMock.new(:admin))
        get :new
      end
      it_behaves_like 'successful request', :new
      it 'assigns a new equipment model to @equipment_model' 

      it 'sets category when one is passed through params' 

    end
    context 'when not admin' do
      before do
        mock_user_sign_in
        get :new
      end
      it_behaves_like 'redirected request'
    end
  end

  describe 'POST create' do
    context 'with admin user' do
      before { mock_user_sign_in(UserMock.new(:admin)) }
      context 'successful save' do
        let!(:model) { FactoryGirl.build_stubbed(:equipment_model) }
        before do
          allow(EquipmentModel).to receive(:new).and_return(model)
          allow(model).to receive(:save).and_return(true)
          post :create, params: { equipment_model: { name: 'Model' } }
        end
        it { is_expected.to set_flash[:notice] }
        it { is_expected.to redirect_to(model) }
      end

      context 'unsuccessful save' do
        before do
          model = EquipmentModelMock.new(save: false)
          post :create, params: { equipment_model: { id: model.id } }
        end
        it { is_expected.to set_flash[:error] }
        it { is_expected.to render_template(:new) }
      end
    end

    context 'when not admin' do
      before do
        mock_user_sign_in
        attr = FactoryGirl.attributes_for(:equipment_model)
        post :create, params: { equipment_model: attr }
      end
      it_behaves_like 'redirected request'
    end
  end

  describe 'PUT update' do
    context 'with admin user' do
      before { mock_user_sign_in(UserMock.new(:admin)) }
      context 'successful update' do
        let!(:model) { FactoryGirl.build_stubbed(:equipment_model) }
        before do
          allow(EquipmentModel).to receive(:find).with(model.id.to_s)
                                                 .and_return(model)
          allow(model).to receive(:update_attributes).and_return(true)
          put :update,
              params: { id: model.id, equipment_model: { name: 'Model' } }
        end
        it { is_expected.to set_flash[:notice] }
        it { is_expected.to redirect_to(model) }
      end

      context 'unsuccessful update' do
        before do
          model = EquipmentModelMock.new(traits: %i[findable with_category],
                                         update_attributes: false)
          put :update,
              params: { id: model.id, equipment_model: { name: 'Model' } }
        end
        it { is_expected.not_to set_flash }
        it { is_expected.to render_template(:edit) }
      end
    end
    context 'when not admin' do
      before do
        mock_user_sign_in
        put :update,
            params: { id: 1, equipment_model: { name: 'Model' } }
      end
      it_behaves_like 'redirected request'
    end
  end

  describe 'PUT deactivate' do
    context 'as admin' do
      before { mock_user_sign_in(UserMock.new(:admin)) }
      shared_examples 'not confirmed' do |flash_type, **opts|
        let!(:model) { FactoryGirl.build_stubbed(:equipment_model) }
        before do
          allow(EquipmentModel).to receive(:find).with(model.id.to_s)
                                                 .and_return(model)
          allow(model).to receive(:destroy)
          put :deactivate, params: { id: model.id, **opts }
        end
        it { is_expected.to set_flash[flash_type] }
        it { is_expected.to redirect_to(model) }
        it 'does not deactivate model' 

      end
      it_behaves_like 'not confirmed', :error
      it_behaves_like 'not confirmed', :notice, deactivation_cancelled: true

      context 'confirmed' do
        let!(:model) do
          EquipmentModelMock.new(traits: %i[findable with_category])
        end
        before do
          request.env['HTTP_REFERER'] = 'where_i_came_from'
          put :deactivate,
              params: { id: model.id, deactivation_confirmed: true }
        end
        it { is_expected.to set_flash[:notice] }
        it { is_expected.to redirect_to('where_i_came_from') }
        it 'deactivates model' 

      end

      context 'with reservations' do
        it "archives the model's reservations on deactivation" 

      end
    end
    context 'not admin' do
      before do
        mock_user_sign_in
        put :deactivate, params: { id: 1 }
      end
      it_behaves_like 'redirected request'
    end
  end

  describe 'GET show' do
    # the current controller method is too complex to be tested
    # appropriately. FIXME when refactoring the controller
    let!(:model) { FactoryGirl.create(:equipment_model) }
    shared_examples 'GET show success' do |user_role|
      before { mock_user_sign_in(UserMock.new(user_role, requirements: [])) }

      describe 'basic function' do
        before { get :show, params: { id: model } }
        it_behaves_like 'successful request', :show
      end

      it 'sets to correct equipment model' 

      it 'sets @associated_equipment_models' 


      it 'limits @associated_equipment_models to maximum 6' 

    end
    USER_ROLES.each { |type| it_behaves_like 'GET show success', type }

    context 'with admin user' do
      before do
        FactoryGirl.create_pair(:equipment_item, equipment_model: model)
        sign_in FactoryGirl.create(:admin)
      end
      let!(:missed) do
        FactoryGirl.create(:missed_reservation, equipment_model: model)
      end
      let!(:starts_today) do
        FactoryGirl.create(:reservation, equipment_model: model,
                                         start_date: Time.zone.today,
                                         due_date: Time.zone.today + 2.days)
      end
      let!(:starts_this_week) do
        FactoryGirl.create(:reservation, equipment_model: model,
                                         start_date: Time.zone.today + 2.days,
                                         due_date: Time.zone.today + 4.days)
      end
      let!(:starts_next_week) do
        FactoryGirl.create(:reservation, equipment_model: model,
                                         start_date: Time.zone.today + 9.days,
                                         due_date: Time.zone.today + 11.days)
      end
      it 'includes @pending reservations' 

    end
  end
end


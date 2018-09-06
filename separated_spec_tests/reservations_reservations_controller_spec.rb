# frozen_string_literal: true

# rubocop:disable Lint/AmbiguousBlockAssociation, Rails/SkipsModelValidations

require 'spec_helper'
require 'helpers/email_helper_spec'

describe ReservationsController, type: :controller do
  AC_DEFAULTS = { disable_user_emails: false,
                  override_on_create: false,
                  override_at_checkout: false,
                  res_exp_time: false,
                  admin_email: 'admin@email.com' }.freeze

  before(:each) { mock_app_config(AC_DEFAULTS) }

  shared_examples 'inaccessible by banned user' do
    before { mock_user_sign_in(FactoryGirl.build_stubbed(:banned)) }
    it_behaves_like 'redirected request'
  end

  describe '#update_index_dates (PUT)' do
    before(:each) do
      mock_user_sign_in
      list = { start_date: Time.zone.today.to_s,
               end_date: (Time.zone.today + 1.day).to_s,
               filter: :reserved }
      put :update_index_dates, params: { list: list }
    end
    it { is_expected.to redirect_to('/reservations') }
    it 'disables all_date viewing' 

    it 'sets the session dates' 

    it 'sets the session filter' 

  end

  describe '#view_all_dates (PUT)' do
    before do
      mock_user_sign_in
      put :view_all_dates
    end
    it { is_expected.to redirect_to('/reservations') }
    it 'enables all_date viewing' 

  end

  describe '#index (GET /reservations/)' do
    # SMELLS:
    #   - @filters
    #   - long method
    #   - message chains
    let!(:time_filtered) { spy('Array') }

    shared_examples 'filterable' do
      it 'can filter' 

      it 'with respect to session[:filter] first' 

    end

    context 'normal user' do
      let!(:user) do
        res = spy('Array', starts_on_days: time_filtered)
        UserMock.new(reservations: res)
      end
      before(:each) do
        mock_user_sign_in(user)
        allow(Reservation).to receive(:starts_on_days)
        get :index
      end
      it { is_expected.to respond_with(:success) }
      it { is_expected.to render_template(:index) }
      it "only gets the current user's reservations" 

      it 'defaults to reserved' 

      it_behaves_like 'filterable'
    end

    context 'admin' do
      let!(:user) { UserMock.new(:admin) }
      before(:each) do
        allow(Reservation).to receive(:starts_on_days)
          .and_return(time_filtered)
        mock_user_sign_in(user)
        get :index
      end
      it 'gets all reservations' 

      it 'defaults to upcoming' 

      it_behaves_like 'filterable'
    end

    it_behaves_like 'inaccessible by banned user' do
      before { get :index }
    end
  end

  describe '#new (GET /reservations/new)' do
    # SMELLS:
    #   - long method
    #   - redirect location set for testing in code ???
    #   - feature envy
    # most of this should probably be in the cart?
    it_behaves_like 'inaccessible by banned user' do
      before { get :new }
    end

    context 'normal user' do
      let!(:user) { FactoryGirl.build_stubbed(:user) }
      before(:each) do
        allow(User).to receive(:find).with(user.id).and_return(user)
        mock_user_sign_in(user)
        request.env['HTTP_REFERER'] = 'where_i_came_from'
      end

      context 'with an empty cart' do
        before(:each) { get :new }
        it { expect(response).to redirect_to('where_i_came_from') }
        it { is_expected.to set_flash }
      end

      context 'with a non-empty cart' do
        let!(:cart) do
          instance_spy('Cart', items: { fake_id: 1 }, reserver_id: user.id,
                               start_date: Time.zone.today,
                               due_date: Time.zone.today - 1.day)
        end
        context 'without errors' do
          before(:each) do
            allow(cart).to receive(:validate_all).and_return('')
            get :new, params: {}, session: { cart: cart }
          end
          it { is_expected.to render_template(:new) }
          it 'initializes a new reservation' 

          it 'assigns errors' 

        end
        context 'with errors' do
          before do
            allow(cart).to receive(:validate_all).and_return('error')
            get :new, params: {}, session: { cart: cart }
          end
          it 'assigns errors' 

          it { is_expected.to set_flash[:error] }
        end
      end
    end

    context 'can override errors' do
      let!(:user) { FactoryGirl.build_stubbed(:admin) }
      before(:each) do
        allow(User).to receive(:find).with(user.id).and_return(user)
        mock_user_sign_in(user)
        request.env['HTTP_REFERER'] = 'where_i_came_from'
      end

      context 'with a non-empty cart' do
        before(:each) do
          @cart = FactoryGirl.build(:cart_with_items, reserver_id: user.id)
          get :new, params: {}, session: { cart: @cart }
        end

        it 'should display errors' 

        it { is_expected.to render_template(:new) }
      end
    end
  end

  describe '#create (POST /reservations/create)' do
    # SMELLS: so, so many of them
    # not going to refactor this yet
    before(:all) do
      @user = FactoryGirl.create(:user)
      @checkout_person = FactoryGirl.create(:checkout_person)
    end
    after(:all) do
      User.destroy_all
    end
    it_behaves_like 'inaccessible by banned user' do
      before do
        attr = FactoryGirl.attributes_for(:valid_reservation)
        post :create, params: { reservation: attr }
      end
    end

    context 'when accessed by non-banned user' do
      before(:each) { sign_in @user }

      context 'with validation-failing items in Cart' do
        before(:each) do
          @invalid_cart =
            FactoryGirl.build(:invalid_cart, reserver_id: @user.id)
          @req = proc do
            post :create, params: { reservation: { notes: 'because I can' } },
                          session: { cart: @invalid_cart }
          end
          @req_no_notes = proc do
            post :create, params: { reservation: { notes: '' } },
                          session: { cart: @invalid_cart }
          end
        end

        context 'no justification provided' do
          before do
            sign_in @checkout_person
            @req_no_notes.call
          end

          it { is_expected.to render_template(:new) }

          it 'should set @notes_required to true' 

        end

        context 'and user can override errors' do
          before(:each) do
            mock_app_config(AC_DEFAULTS.merge(override_on_create: true))
            sign_in @checkout_person
          end

          it 'affects the database' 


          it 'sets the reservation notes' 


          it 'should redirect' 


          it 'sets the flash' 

        end

        context 'and user cannot override errors' do
          # request would be filed
          before(:each) do
            mock_app_config(AC_DEFAULTS.merge(override_on_create: false))
            sign_in @checkout_person
          end
          it 'affects database' 


          it 'sets the reservation notes' 


          it 'redirects to catalog_path' 


          it 'should not set the flash' 

        end
      end

      context 'with validation-passing items in Cart' do
        before(:each) do
          @valid_cart = FactoryGirl.build(:cart_with_items)
          @req = proc do
            post :create,
                 params: { reservation: { start_date: Time.zone.today,
                                          due_date: (Time.zone.today + 1.day),
                                          reserver_id: @user.id } },
                 session: { cart: @valid_cart }
          end
        end

        it 'saves items into database' 


        it 'sets the reservation notes' 


        it 'sets the status to reserved' 


        it 'empties the Cart' 


        it 'sets flash[:notice]' 


        it 'is a redirect' 


        context 'with notify_admin_on_create set' do
          before(:each) do
            ActionMailer::Base.deliveries.clear
            mock_app_config(AC_DEFAULTS.merge(notify_admin_on_create: true))
          end

          it 'cc-s the admin on the confirmation email' 

        end

        context 'without notify_admin_on_create set' do
          before(:each) do
            ActionMailer::Base.deliveries.clear
            mock_app_config(AC_DEFAULTS.merge(notify_admin_on_create: false))
          end

          it 'cc-s the admin on the confirmation email' 

        end
      end

      context 'with banned reserver' do
        before(:each) do
          sign_in @checkout_person
          @valid_cart = FactoryGirl.build(:cart_with_items)
          @banned = FactoryGirl.create(:banned)
          @valid_cart.reserver_id = @banned.id
          @req = proc do
            post :create,
                 params: { reservation: { start_date: Time.zone.today,
                                          due_date: (Time.zone.today + 1.day),
                                          reserver_id: @banned.id,
                                          notes: 'because I can' } },
                 session: { cart: @valid_cart }
          end
        end

        it 'does not save' 


        it 'is a redirect' 


        it 'sets flash[:error]' 

      end
    end
  end

  describe '#edit (GET /reservations/:id/edit)' do
    # SMELLS:
    #   - message chain
    it_behaves_like 'inaccessible by banned user' do
      before { get 'edit', params: { id: 1 } }
    end

    context 'when accessed by patron' do
      before(:each) do
        mock_user_sign_in
        get 'edit', params: { id: 1 }
      end
      include_examples 'redirected request'
    end

    context 'when accessed by checkout person disallowed by settings' do
      before(:each) do
        mock_app_config(AC_DEFAULTS.merge(checkout_persons_can_edit: false))
        mock_user_sign_in(UserMock.new(:checkout_person))
        get 'edit', params: { id: 1 }
      end
      include_examples 'redirected request'
    end

    shared_examples 'can access edit page' do
      let!(:item) { EquipmentItemMock.new(id: 1, name: 'Name') }
      before do
        model = EquipmentModelMock.new(traits: [[:with_item, item: item]])
        res = ReservationMock.new(equipment_model: model, id: 1,
                                  class: Reservation)
        allow(Reservation).to receive(:find).with(res.id.to_s)
                                            .and_return(res)
        get :edit, params: { id: res.id }
      end
      it 'assigns @option_array as Array' 

      it 'assigns @option_array with the correct contents' 

      it { is_expected.to render_template(:edit) }
    end

    context 'when accessed by checkout person allowed by settings' do
      before(:each) do
        mock_app_config(AC_DEFAULTS.merge(checkout_persons_can_edit: true))
        mock_user_sign_in(UserMock.new(:checkout_person))
      end
      it_behaves_like 'can access edit page'
    end

    context 'when accessed by admin' do
      before(:each) do
        mock_user_sign_in(UserMock.new(:admin))
      end
      include_examples 'can access edit page'
    end
  end

  describe '#update (PUT /reservations/:id)' do
    # Access: everyone who can access GET edit
    # Functionality:
    # - assign @reservation
    # - check due_date > start_date from params; if not, flash error and
    #     redirect back
    # - if params[:equipment_item] is defined, swap the item from the
    #     current reservation
    # - affect the current reservation (@reservation)
    # - set flash notice
    # - redirect to @reservation
    # Expects in params:
    # - params[:equipment_item] = id of equipment item or nil
    # - params[:reservation] with :start_date, :due_date, :reserver_id, :notes

    before(:all) do
      @user = FactoryGirl.create(:user)
      @checkout_person = FactoryGirl.create(:checkout_person)
      @admin = FactoryGirl.create(:admin)
    end
    after(:all) { User.destroy_all }
    before(:each) do
      @reservation = FactoryGirl.create(:valid_reservation, reserver: @user)
    end

    it_behaves_like 'inaccessible by banned user' do
      before { put :update, params: { id: 1 } }
    end

    context 'when accessed by patron' do
      before(:each) do
        sign_in @user
        put :update, params: { id: @reservation.id }
      end
      include_examples 'redirected request'
    end

    context 'when accessed by checkout person disallowed by settings' do
      before(:each) do
        sign_in @checkout_person
        mock_app_config(AC_DEFAULTS.merge(checkout_persons_can_edit: false))
        put :update,
            params: { id: @reservation.id,
                      reservation: FactoryGirl.attributes_for(:reservation) }
      end
      include_examples 'redirected request'
    end

    ## Happy paths due to authorization
    shared_examples 'can access update page' do
      # Happy paths
      describe 'and provides valid params[:reservation]' do
        before(:each) do
          attr = FactoryGirl.attributes_for(:reservation,
                                            start_date: Time.zone.today,
                                            due_date: Time.zone.today + 4.days)
          put :update, params: { id: @reservation.id, reservation: attr,
                                 equipment_item: '' }
        end
        it 'should update the reservation details' 

        it 'updates the reservations notes' 

        it { is_expected.to redirect_to(@reservation) }
      end

      describe 'and provides valid params[:equipment_item]' do
        before(:each) do
          @new_equipment_item =
            FactoryGirl.create(:equipment_item,
                               equipment_model: @reservation.equipment_model)
          attr = FactoryGirl.attributes_for(:reservation,
                                            start_date: Time.zone.today,
                                            due_date: (Time.zone.today + 1.day))
          put :update, params: { id: @reservation.id, reservation: attr,
                                 equipment_item: @new_equipment_item.id }
        end
        it 'should update the item on current reservation' 


        it 'should update the item notes' 


        it 'updates the reservations notes' 


        it { is_expected.to redirect_to(@reservation) }

        context 'with existing equipment item' do
          before(:each) do
            @old_item =
              FactoryGirl.create(:equipment_item,
                                 equipment_model: @reservation.equipment_model)
            @new_item =
              FactoryGirl.create(:equipment_item,
                                 equipment_model: @reservation.equipment_model)
            attr = FactoryGirl.attributes_for(:reservation,
                                              start_date: Time.zone.today,
                                              due_date: Time.zone.today + 1.day)
            put :update, params: { id: @reservation.id, reservation: attr,
                                   equipment_item: @old_item.id }
            @old_item.reload
            @new_item.reload
            put :update, params: { id: @reservation.id, reservation: attr,
                                   equipment_item: @new_item.id }
          end

          it 'should update both histories' 


          it 'should make the other item available' 

        end

        context 'with checked out equipment item' do
          before(:each) do
            @old_item =
              FactoryGirl.create(:equipment_item,
                                 equipment_model: @reservation.equipment_model)
            @new_item =
              FactoryGirl.create(:equipment_item,
                                 equipment_model: @reservation.equipment_model)
            @other_res =
              FactoryGirl.create(:reservation,
                                 reserver: @user,
                                 equipment_model: @reservation.equipment_model)
            attr = FactoryGirl.attributes_for(:reservation,
                                              start_date: Time.zone.today,
                                              due_date: Time.zone.today + 1.day)
            put :update, params: { id: @reservation.id, reservation: attr,
                                   equipment_item: @old_item.id }
            put :update, params: { id: @other_res.id, reservation: attr,
                                   equipment_item: @new_item.id }
            @old_item.reload
            @new_item.reload
            put :update, params: { id: @reservation.id, reservation: attr,
                                   equipment_item: @new_item.id }
          end

          it 'should update both histories' 


          it 'should be noted in the other reservation' 

        end
      end

      # Unhappy path
      describe 'and provides invalid params[:reservation]' do
        before(:each) do
          request.env['HTTP_REFERER'] = reservation_path(@reservation)
          attr = FactoryGirl.attributes_for(:reservation,
                                            start_date: Time.zone.today,
                                            due_date: Time.zone.today - 1.day)
          put :update, params: { id: @reservation.id, reservation: attr,
                                 equipment_item: '' }
        end
        include_examples 'redirected request'

        it 'does not update the reservations notes' 

      end
    end

    context 'when accessed by checkout person allowed by settings' do
      before(:each) do
        mock_app_config(AC_DEFAULTS.merge(checkout_persons_can_edit: true))
        sign_in @checkout_person
      end
      include_examples 'can access update page'
    end

    context 'when accessed by admin' do
      before(:each) { sign_in @admin }
      include_examples 'can access update page'
    end
  end

  describe '#destroy (DELETE /reservations/:id)' do
    # SMELL: this mostly tests permissions
    # Special access:
    # - checkout persons, if checked_out is nil
    # - users, if checked_out is nil and it's their reservation
    # Functionality:
    # - destroy reservation, set flash[:notice], redirect to reservations_url

    ADMIN_ROLES = %i[admin checkout_person].freeze

    shared_examples 'can destroy reservation' do
      before { delete :destroy, params: { id: res.id } }
      it { is_expected.to redirect_to(reservations_url) }
      it { is_expected.to set_flash[:notice] }
      it 'deletes the reservation' 

    end

    shared_examples 'cannot destroy reservation' do
      before { delete :destroy, params: { id: res.id } }
      include_examples 'redirected request'
    end

    ADMIN_ROLES.each do |role|
      before { mock_user_sign_in(UserMock.new(role)) }
      let!(:res) { ReservationMock.new(traits: [:findable]) }
      it_behaves_like 'can destroy reservation'
    end

    context 'when accessed by patron' do
      let!(:user) { UserMock.new }
      before { mock_user_sign_in(user) }

      context 'and the reservation is their own' do
        context 'and it is checked out' do
          let!(:res) do
            ReservationMock.new(traits: [:findable], reserver: user,
                                status: 'checked_out')
          end
          it_behaves_like 'cannot destroy reservation'
        end
        context 'and it is not checked out' do
          let!(:res) do
            ReservationMock.new(traits: [:findable], reserver: user)
          end
          it_behaves_like 'can destroy reservation'
        end
      end
      context 'and the reservation is not their own' do
        let!(:res) { ReservationMock.new(traits: [:findable]) }
        it_behaves_like 'cannot destroy reservation'
      end
    end

    it_behaves_like 'inaccessible by banned user' do
      let!(:res) { ReservationMock.new(traits: [:findable]) }
      before do
        allow(User).to receive(:find_by_id)
        delete :destroy, params: { id: res.id }
      end
    end
  end

  describe '#manage (GET /reservations/manage/:user_id)' do
    # Access: admins and checkout persons
    # Functionality:
    # - assigns @user, @check_out_set and @check_in_set
    # - renders :manage

    shared_examples 'can access #manage' do
      let!(:user) { UserMock.new(traits: [:findable]) }
      before(:each) do
        allow(user).to receive(:due_for_checkout)
          .and_return(instance_spy('ActiveRecord::Relation'))
        allow(user).to receive(:due_for_checkin)
          .and_return(instance_spy('ActiveRecord::Relation'))
        get :manage, params: { user_id: user.id }
      end
      it { expect(response).to be_success }
      it { is_expected.to render_template(:manage) }
      it 'assigns @user correctly' 

      it 'assigns @check_out_set correctly' 

      it 'assigns @check_in_set correctly' 

    end

    context 'when accessed by admin' do
      before(:each) { mock_user_sign_in(UserMock.new(:admin)) }
      include_examples 'can access #manage'
    end

    context 'when accessed by checkout person' do
      before(:each) { mock_user_sign_in(UserMock.new(:checkout_person)) }
      include_examples 'can access #manage'
    end

    context 'when accessed by patron' do
      before(:each) do
        user = UserMock.new
        mock_user_sign_in(user)
        get :manage, params: { user_id: user.id }
      end
      include_examples 'redirected request'
    end
  end

  describe '#current (GET /reservations/current/:user_id)' do
    # not particularily messy but the method is written in a way that
    # makes mocking + stubbing difficult
    # SMELL: feature envy: everything depends on @user

    before(:all) do
      @user = FactoryGirl.create(:user)
      @checkout_person = FactoryGirl.create(:checkout_person)
      @admin = FactoryGirl.create(:admin)
      @banned = FactoryGirl.create(:banned)
    end
    after(:all) do
      User.destroy_all
    end

    shared_examples 'can access #current' do
      before { get :current, params: { user_id: @user.id } }
      it { expect(response).to be_success }
      it { is_expected.to render_template(:current_reservations) }

      it 'assigns @user correctly' 


      it 'assigns @user_overdue_reservations_set correctly' 


      it 'assigns @user_checked_out_today_reservations_set correctly' 


      it 'assigns @user_checked_out_previous_reservations_set correctly' 


      it 'assigns @user_reserved_reservations_set correctly' 

    end

    context 'when accessed by admin' do
      before(:each) do
        sign_in @admin
      end

      include_examples 'can access #current'
    end

    context 'when accessed by checkout person' do
      before(:each) do
        sign_in @checkout_person
      end

      include_examples 'can access #current'
    end

    context 'when accessed by patron' do
      before(:each) do
        sign_in @user
        get :current, params: { user_id: @user.id }
      end

      include_examples 'redirected request'
    end

    it_behaves_like 'inaccessible by banned user' do
      before { get :current, params: { user_id: @banned.id } }
    end

    context 'with banned reserver' do
      before(:each) do
        sign_in @admin
        get :current, params: { user_id: @banned.id }
      end

      it 'is a redirect' 


      it 'sets the flash' 

    end
  end

  describe '#checkout (PUT /reservations/checkout/:user_id)' do
    # Access: Admins, checkout persons.
    # Functionality: very complicated (almost 100 lines)
    # - pass TOS (if not, redirect)
    # - params[:reservations] contains hash of
    #    {reservation_id => {equipment_item_id: int, notes: str,
    #      checkout_precedures: {checkout_procedure_id => int}}}
    # - stops checkout if user has overdue reservations
    # - stops checkout if no reservations are selected
    # - overrides errors if you can and if there are some, otherwise
    #     redirects away
    # - also prevents checkout if reserver is banned

    # Effects if successful:
    # - sets empty @check_in_set, populates @check_out_set with the
    #     reservations
    # - processes all reservations in params[:reservations] -- adds
    #     checkout_handler, checked_out (time), equipment_item; updates
    #     notes
    # - renders :receipt template
    # - sets reservation status to 'checked_out'

    # Note: Many of these can be cross-applied to #checkin as well

    before(:all) do
      @user = FactoryGirl.create(:user)
      @checkout_person = FactoryGirl.create(:checkout_person)
      @admin = FactoryGirl.create(:admin)
      @banned = FactoryGirl.create(:banned)
    end

    after(:all) { User.destroy_all }

    before(:each) do
      sign_in @user
      @reservation = FactoryGirl.create(:valid_reservation, reserver: @user)
    end

    shared_examples 'has successful checkout' do
      before(:each) do
        @item =
          FactoryGirl.create(:equipment_item,
                             equipment_model: @reservation.equipment_model)
        reservations_params =
          { @reservation.id.to_s => { notes: '',
                                      equipment_item_id: @item.id } }
        ActionMailer::Base.deliveries = []
        put :checkout,
            params: { user_id: @user.id, reservations: reservations_params }
      end

      it { expect(response).to be_success }
      it { is_expected.to render_template(:receipt) }

      it 'assigns empty @check_in_set' 


      it 'populates @check_out_set' 


      it 'updates the reservation' 


      it 'updates the equipment item history' 


      it 'updates the reservation notes' 


      it 'sends checkout receipts' 

    end

    context 'when accessed by admin' do
      before(:each) do
        sign_in @admin
      end

      include_examples 'has successful checkout'
    end

    context 'when accessed by checkout person' do
      before(:each) do
        sign_in @checkout_person
      end

      include_examples 'has successful checkout'
    end

    context 'when accessed by patron' do
      before(:each) do
        sign_in @user
        put :checkout, params: { user_id: @user.id }
      end

      include_examples 'redirected request'
    end

    it_behaves_like 'inaccessible by banned user' do
      before { put :checkout, params: { user_id: @banned.id } }
    end

    context 'when tos not accepted and not checked off' do
      before do
        request.env['HTTP_REFERER'] = 'where_i_came_from'
        sign_in @admin
        @user.update_attributes(terms_of_service_accepted: false)
        put :checkout, params: { user_id: @user.id, reservations: {} }
      end
      it { expect(response).to redirect_to 'where_i_came_from' }
    end

    context 'when tos accepted' do
      before do
        sign_in @admin
        @user.update_attributes(terms_of_service_accepted: false)
        @item =
          FactoryGirl.create(:equipment_item,
                             equipment_model: @reservation.equipment_model)
        reservations_params =
          { @reservation.id.to_s => { notes: '',
                                      equipment_item_id: @item.id } }
        put :checkout, params: { user_id: @user.id,
                                 reservations: reservations_params,
                                 terms_of_service_accepted: true }
      end

      it { expect(response).to be_success }
    end

    context 'with duplicate equipment item selection' do
      before do
        request.env['HTTP_REFERER'] = 'where_i_came_from'
        sign_in @admin
        @item =
          FactoryGirl.create :equipment_item,
                             equipment_model: @reservation.equipment_model
        FactoryGirl.create :equipment_item,
                           equipment_model: @reservation.equipment_model
        @res2 =
          FactoryGirl.create :valid_reservation,
                             reserver: @user,
                             equipment_model: @reservation.equipment_model
        res_params = { notes: '', equipment_item_id: @item.id }
        reservations_params = { @reservation.id.to_s => res_params,
                                @res2.id.to_s => res_params }
        put :checkout,
            params: { user_id: @user.id, reservations: reservations_params }
      end

      it { expect(response).to redirect_to 'where_i_came_from' }

      it 'does not update the equipment item history' 

    end

    context 'when not all procedures are filled out' do
      before do
        sign_in @admin
        @item =
          FactoryGirl.create(:equipment_item,
                             equipment_model: @reservation.equipment_model)
        @procedure =
          FactoryGirl.create(:checkout_procedure,
                             equipment_model: @reservation.equipment_model)
        reservations_params =
          { @reservation.id.to_s => { notes: '',
                                      equipment_item_id: @item.id,
                                      checkout_procedures: {} } }
        put :checkout,
            params: { user_id: @user.id, reservations: reservations_params }
      end

      it { expect(response).to be_success }

      it { is_expected.to render_template(:receipt) }

      it 'assigns empty @check_in_set' 


      it 'populates @check_out_set' 


      it 'updates the reservation' 

    end

    context 'no reservations selected' do
      before do
        request.env['HTTP_REFERER'] = 'where_i_came_from'
        sign_in @checkout_person
        put :checkout, params: { user_id: @user.id, reservations: {} }
      end
      it { is_expected.to set_flash }
      it { expect(response).to redirect_to 'where_i_came_from' }
    end

    context 'reserver has overdue reservations' do
      context 'can override reservations?' do
        before do
          sign_in @admin
          @item =
            FactoryGirl.create(:equipment_item,
                               equipment_model: @reservation.equipment_model)
          reservations_params =
            { @reservation.id.to_s => { notes: '',
                                        equipment_item_id: @item.id } }
          overdue =
            FactoryGirl.build(:overdue_reservation, reserver_id: @user.id)
          overdue.save(validate: false)
          put :checkout,
              params: { user_id: @user.id, reservations: reservations_params }
        end
        it { expect(response).to be_success }
        it { is_expected.to render_template(:receipt) }
      end

      context 'cannot override' do
        before do
          request.env['HTTP_REFERER'] = 'where_i_came_from'
          sign_in @checkout_person
          @item =
            FactoryGirl.create(:equipment_item,
                               equipment_model: @reservation.equipment_model)
          reservations_params =
            { @reservation.id.to_s => { notes: '',
                                        equipment_item_id: @item.id } }
          overdue =
            FactoryGirl.build(:overdue_reservation, reserver_id: @user.id)
          overdue.save(validate: false)
          put :checkout,
              params: { user_id: @user.id, reservations: reservations_params }
        end
        it { is_expected.to set_flash }
        it { expect(response).to redirect_to 'where_i_came_from' }
      end
    end

    context 'with banned reserver' do
      before(:each) do
        @reservation.update_attribute(:reserver_id, @banned.id)
        request.env['HTTP_REFERER'] = 'where_i_came_from'
        sign_in @checkout_person
        @obj =
          FactoryGirl.create(:equipment_item,
                             equipment_model: @reservation.equipment_model)
        reservations_params =
          { @reservation.id.to_s => { notes: '',
                                      equipment_item_id: @obj.id } }
        put :checkout,
            params: { user_id: @banned.id, reservations: reservations_params }
      end

      it { is_expected.to set_flash }
      it { expect(response).to redirect_to root_path }
    end
  end

  describe '#checkin (PUT /reservations/check-in/:user_id)' do
    # Access: Admins, checkout persons.
    # Functionality: very complicated (almost 80 lines)
    # - params[:reservations] contains a hash of
    #    {reservation_id => {checkin?: int, notes: str,
    #      (nil?) checkin_procedures: {checkin_procedure_id => int}}}
    # - processes all reservations in params[:reservations] -- adds
    #     checkin_handler, checked_in (time); updates notes
    # - stops checkin if no reservations are selected
    # - overrides errors if you can and if there are some, otherwise
    #     redirects away
    # - renders :receipt template

    before(:all) do
      @user = FactoryGirl.create(:user)
      @checkout_person = FactoryGirl.create(:checkout_person)
      @admin = FactoryGirl.create(:admin)
      @banned = FactoryGirl.create(:banned)
    end

    after(:all) { User.destroy_all }

    before(:each) do
      sign_in @user
      @reservation = FactoryGirl.create(:valid_reservation, reserver: @user)
    end

    shared_examples 'has successful checkin' do
      before(:each) do
        @reservation =
          FactoryGirl.create(:checked_out_reservation, reserver: @user)
        @item = @reservation.equipment_item
        reservations_params =
          { @reservation.id.to_s => { notes: '', checkin?: '1' } }
        put :checkin,
            params: { user_id: @user.id, reservations: reservations_params }
      end

      it { expect(response).to be_success }
      it { is_expected.to render_template(:receipt) }

      it 'assigns empty @check_out_set' 


      it 'populates @check_in_set' 


      it 'updates the reservation' 


      it 'updates the equipment item history' 


      it 'updates the reservation notes' 

    end

    context 'when accessed by admin' do
      before(:each) do
        sign_in @admin
      end

      include_examples 'has successful checkin'
    end

    context 'when accessed by checkout person' do
      before(:each) do
        sign_in @checkout_person
      end

      include_examples 'has successful checkin'
    end

    context 'when accessed by patron' do
      before(:each) do
        sign_in @user
        put :checkin, params: { user_id: @user.id }
      end

      include_examples 'redirected request'
    end

    it_behaves_like 'inaccessible by banned user' do
      before { put :checkin, params: { user_id: @banned.id } }
    end

    context 'items have already been checked in' do
      before do
        sign_in @admin
        request.env['HTTP_REFERER'] = 'where_i_came_from'
        @reservation =
          FactoryGirl.build(:checked_in_reservation, reserver: @user)
        @reservation.save(validate: false)
        reservations_params =
          { @reservation.id.to_s => { notes: '', checkin?: '1' } }
        put :checkin,
            params: { user_id: @user.id, reservations: reservations_params }
      end

      it { is_expected.to set_flash }
      it { expect(response).to redirect_to 'where_i_came_from' }
    end

    context 'no reservations to check in' do
      before do
        request.env['HTTP_REFERER'] = 'where_i_came_from'
        sign_in @admin
        put :checkin, params: { user_id: @user.id, reservations: {} }
      end
      it { is_expected.to set_flash }
      it { expect(response).to redirect_to 'where_i_came_from' }
    end

    context 'when not all procedures are filled out' do
      before do
        sign_in @admin
        @reservation =
          FactoryGirl.create(:checked_out_reservation, reserver: @user)
        @procedure =
          FactoryGirl.create(:checkin_procedure,
                             equipment_model: @reservation.equipment_model)
        reservations_params =
          { @reservation.id.to_s => { notes: '', checkin?: '1',
                                      checkin_procedures: {} } }
        put :checkin,
            params: { user_id: @user.id, reservations: reservations_params }
      end

      it { expect(response).to be_success }
      it { is_expected.to render_template(:receipt) }

      it 'assigns empty @check_out_set' 


      it 'populates @check_in_set' 


      it 'updates the reservation' 

    end
  end

  describe '#renew (PUT /reservations/:id/renew)' do
    # SMELL: this mostly tests permissions
    shared_examples 'can renew reservation' do
      before(:each) do
        allow(Reservation).to receive(:find).with(res.id.to_s).and_return(res)
        allow(res).to receive(:renew).and_return(nil)
        put :renew, params: { id: res.id }
      end
      it { is_expected.to redirect_to(reservation_path(res)) }
      it { is_expected.to set_flash[:notice] }
    end

    context 'when accessed by admin' do
      let!(:res) { FactoryGirl.build_stubbed(:valid_reservation) }
      before { mock_user_sign_in(UserMock.new(:admin)) }
      include_examples 'can renew reservation'
      context 'cannot renew' do
        before do
          allow(Reservation).to receive(:find).with(res.id.to_s).and_return(res)
          allow(res).to receive(:renew).and_return('error')
          put :renew, params: { id: res.id }
        end
        it { is_expected.to redirect_to(reservation_path(res)) }
        it { is_expected.to set_flash[:error] }
      end
    end

    context 'when accessed by checkout person' do
      let!(:res) { FactoryGirl.build_stubbed(:valid_reservation) }
      before { mock_user_sign_in(UserMock.new(:checkout_person)) }
      include_examples 'can renew reservation'
    end

    context 'when accessed by patron' do
      let!(:user) { FactoryGirl.build_stubbed(:user) }
      before { mock_user_sign_in user }
      context 'own reservation' do
        let!(:res) do
          FactoryGirl.build_stubbed(:valid_reservation, reserver: user)
        end
        include_examples 'can renew reservation'
      end
      context 'trying to renew someone elses reservation' do
        let!(:res) { FactoryGirl.build_stubbed(:valid_reservation) }
        before { put :renew, params: { id: res.id } }
        it { expect(response).to be_redirect }
      end
    end

    # FIXME: fails
    it_behaves_like 'inaccessible by banned user' do
      let!(:res) { FactoryGirl.build_stubbed(:valid_reservation) }
      before do
        allow(Reservation).to receive(:find).with(res.id.to_s).and_return(res)
        put :renew, params: { id: res.id }
      end
    end
  end

  describe '#archive (PUT /reservations/:id/archive)' do
    # Access: Admins
    # Functionality:
    # - requests note from admin
    # - sets @reservation
    # - sets @reservation.checked_in to today
    # - adds archival comment to note
    # - redirects to @reservation

    before(:all) do
      @user = FactoryGirl.create(:user)
      @checkout_person = FactoryGirl.create(:checkout_person)
      @admin = FactoryGirl.create(:admin)
      @banned = FactoryGirl.create(:banned)
    end

    after(:all) { User.destroy_all }

    before(:each) do
      sign_in @user
      @reservation = FactoryGirl.create(:valid_reservation, reserver: @user)
    end

    shared_examples 'cannot archive reservation' do
      before do
        request.env['HTTP_REFERER'] = reservation_path(@reservation)
        put :archive, params: { id: @reservation.id, archive_note: "I can't!" }
      end

      it { expect(response).to redirect_to(root_path) }
      it 'should not be checked in' 

      it 'should not have new notes' 

    end

    context 'for checked-out reservation' do
      before(:each) do
        @reservation =
          FactoryGirl.create(:checked_out_reservation, reserver: @user)
        request.env['HTTP_REFERER'] = reservation_path(@reservation)
      end

      context 'when accessed by admin' do
        before(:each) do
          allow(@controller).to receive(:current_user).and_return(@admin)
        end

        context 'with archive note' do
          before(:each) do
            put :archive,
                params: { id: @reservation.id, archive_note: 'Because I can' }
          end

          it 'redirects to reservation show view' 

          it 'should be checked in' 

          it 'should have new notes' 

        end

        context 'without archive note' do
          before(:each) do
            put :archive, params: { id: @reservation.id }
          end

          it 'redirects to reservation show view' 

          it 'should not be checked in' 

          it 'should not have new notes' 

        end

        context 'when auto-deactivate is enabled' do
          before(:each) do
            mock_app_config(AC_DEFAULTS.merge(autodeactivate_on_archive: true))
            put :archive,
                params: { id: @reservation.id, archive_note: 'Because I can' }
          end

          it 'should deactivate the equipment item' 

        end
      end

      context 'when accessed by checkout person' do
        before(:each) do
          allow(@controller).to\
            receive(:current_user).and_return(@checkout_person)
        end

        include_examples 'cannot archive reservation'
      end

      context 'when accessed by patron' do
        before(:each) do
          allow(@controller).to receive(:current_user).and_return(@user)
        end

        include_examples 'cannot archive reservation'
      end
    end

    context 'for checked-in reservations' do
      before(:each) do
        allow(@controller).to receive(:current_user).and_return(@admin)
        @reservation =
          FactoryGirl.build(:checked_in_reservation, reserver: @user)
        @reservation.save(validate: false)
        request.env['HTTP_REFERER'] = reservation_path(@reservation)
        put :archive,
            params: { id: @reservation.id, archive_note: 'Because I can' }
      end

      it 'redirects to reservation show view' 

      it 'should not change reservation' 

    end

    it_behaves_like 'inaccessible by banned user' do
      before do
        allow(User).to receive(:find).with(@user.id).and_return(@user)
        @reservation =
          FactoryGirl.create(:checked_out_reservation, reserver: @user)
        put :archive, params: { id: @reservation.id }
      end
    end
  end

  describe '#send_receipt (GET /reservations/:id/send_receipt)' do
    before { mock_user_sign_in(UserMock.new(:checkout_person)) }
    let!(:res) do
      FactoryGirl.build_stubbed(:valid_reservation).tap do |r|
        allow(Reservation).to receive(:find).with(r.id.to_s).and_return(r)
      end
    end

    context 'successfully emails' do
      before do
        allow(UserMailer).to \
          receive_message_chain(:reservation_status_update, :deliver_now)
          .and_return(true)
        get :send_receipt, params: { id: res.id }
      end
      it { is_expected.to redirect_to(res) }
      it { is_expected.to set_flash[:notice] }
    end

    context 'fails to send email' do
      before do
        allow(UserMailer).to \
          receive_message_chain(:reservation_status_update, :deliver_now)
          .and_return(false)
        get :send_receipt, params: { id: res.id }
      end
      it { is_expected.to redirect_to(res) }
      it { is_expected.to set_flash[:error] }
    end
  end

  describe '#review GET' do
    let!(:res) { ReservationMock.new(traits: [:findable]) }
    context 'as admin' do
      before do
        mock_user_sign_in(UserMock.new(:admin))
      end
      it 'should assign all current requests except itself' 

      it 'should assign errors' 

    end
  end

  describe '#approve_request PUT' do
    # SMELL: this doesn't belong in the controller
    before(:all) { @admin = FactoryGirl.create(:admin) }
    after(:all) { User.destroy_all }

    before do
      sign_in @admin
      @requested = FactoryGirl.create(:request)
      put :approve_request, params: { id: @requested.id }
    end
    it 'should set the reservation status' 

    it 'should save the reservation' 

    it 'should send an email' 

    it 'should redirect to reservations path' 

  end

  describe '#deny_request PUT' do
    # SMELL: this doesn't belong in the controller
    before(:all) { @admin = FactoryGirl.create(:admin) }
    after(:all) { User.destroy_all }

    before do
      sign_in @admin
      @requested = FactoryGirl.create(:request)
      put :deny_request, params: { id: @requested.id }
    end
    it 'should set the reservation status to denied' 

    it 'should save the reservation' 

    it 'should send an email' 

    it 'should redurect to reservations path' 

  end
end


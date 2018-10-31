# frozen_string_literal: true

require 'spec_helper'

describe UsersController, type: :controller do
  before(:each) { mock_app_config }

  it_behaves_like 'calendarable', User

  describe 'GET index' do
    before { mock_user_sign_in(UserMock.new(:admin)) }
    context 'basic function' do
      before { get :index }
      it_behaves_like 'successful request', :index
    end
    it 'defaults to active users' 


    it 'orders users by username' 


    context 'with show banned' do
      it 'should assign users to all users' 

    end
  end

  describe 'GET show' do
    before { mock_user_sign_in(UserMock.new(:admin)) }
    let!(:user) do
      UserMock.new(traits: [:findable], reservations: spy('Array'))
    end
    context 'basic function' do
      before { get :show, params: { id: user.id } }
      it_behaves_like 'successful request', :show
    end
    it "gets the user's reservations" 


    # TODO: tests on the reservations being filtered?

    context 'with banned user' do
      before do
        banned = UserMock.new(:banned, traits: [:findable],
                                       reservations: spy('Array'))
        get :show, params: { id: banned.id }
      end
      it { is_expected.to respond_with(:success) }
      it { is_expected.to set_flash[:error] }
    end
  end

  describe 'POST quick_new' do
    before { mock_user_sign_in(UserMock.new(:admin)) }
    it 'gets the username from ldap' 

    it 'attempts to make a new user from the ldap result' 

  end

  describe 'POST quick_create' do
    before { mock_user_sign_in(UserMock.new(:admin)) }
    it 'creates a new user from the params' 

    it 'sets the role to normal if not given' 

    it 'sets the view mode to the role' 

    context 'using CAS' do
      around(:example) do |example|
        env_wrapper('CAS_AUTH' => '1') { example.run }
      end
      it 'sets the cas login to the username param' 

    end
    context 'successful save' do
      let!(:user) { UserMock.new(save: true, id: 1) }
      before do
        user_params = { username: 'sky3' }
        allow(User).to receive(:new).and_return(user)
        post :quick_create, params: { format: :js, user: user_params }
      end
      it "sets the cart's user to the new user" 

      it { is_expected.to set_flash[:notice] }
      # TODO: render action test?
    end
    context 'unsuccessful save' do
      # TODO: render action test?
    end
  end

  describe 'GET new' do
    context 'using CAS' do
      around(:example) do |example|
        env_wrapper('CAS_AUTH' => '1') { example.run }
      end
      context 'with current user' do
        before { mock_user_sign_in(UserMock.new(:admin)) }
        it 'initializes a new user' 

      end
    end
    context 'without CAS' do
      it 'initializes a new user' 

    end
  end

  describe 'POST create' do
    before { mock_user_sign_in(UserMock.new(:admin)) }
    it 'initializes a new user from the params' 

    it 'sets the role to normal if not given' 

    it 'sets the view mode to the role' 

    context 'using CAS' do
      around(:example) do |example|
        env_wrapper('CAS_AUTH' => '1') { example.run }
      end
      it 'sets the cas login from params' 

    end
    context 'without CAS' do
      before { mock_user_sign_in(UserMock.new(:admin)) }
      it 'sets the username to the email' 

    end
    context 'successful save' do
      before { mock_user_sign_in(UserMock.new(:admin)) }
      let!(:user) { FactoryGirl.build_stubbed(:user) }
      before do
        allow(User).to receive(:new).and_return(user)
        allow(user).to receive(:save).and_return(true)
        post :create, params: { user: { first_name: 'name' } }
      end
      it { is_expected.to set_flash[:notice] }
      it { is_expected.to redirect_to(user) }
    end
    context 'unsuccessful save' do
      before { mock_user_sign_in(UserMock.new(:admin)) }
      let!(:user) { UserMock.new(save: false) }
      before do
        allow(User).to receive(:new).and_return(user)
        post :create, params: { user: { first_name: 'name' } }
      end
      it { is_expected.to render_template(:new) }
    end
  end

  describe 'PUT ban' do
    before { mock_user_sign_in(UserMock.new(:admin)) }
    before { request.env['HTTP_REFERER'] = 'where_i_came_from' }
    context 'guest user' do
      before do
        user = UserMock.new(:guest, traits: [:findable])
        put :ban, params: { id: user.id }
      end
      it_behaves_like 'redirected request'
    end
    context 'user is self' do
      before do
        user = UserMock.new(:admin, traits: [:findable])
        mock_user_sign_in user
        put :ban, params: { id: user.id }
      end
      it_behaves_like 'redirected request'
    end
    context 'able to ban' do
      let!(:user) { UserMock.new(traits: [:findable]) }
      before { put :ban, params: { id: user.id } }
      it_behaves_like 'redirected request'
      it 'should make the user banned' 

    end
  end

  describe 'PUT unban' do
    before { mock_user_sign_in(UserMock.new(:admin)) }
    before { request.env['HTTP_REFERER'] = 'where_i_came_from' }
    context 'guest user' do
      before do
        user = UserMock.new(:guest, traits: [:findable])
        put :unban, params: { id: user.id }
      end
      it_behaves_like 'redirected request'
    end
    context 'able to unban' do
      let!(:user) { UserMock.new(:banned, traits: [:findable]) }
      before { put :unban, params: { id: user.id } }
      it_behaves_like 'redirected request'
      it 'should make the user banned' 

    end
  end

  describe 'PUT find' do
    before { mock_user_sign_in(UserMock.new(:admin)) }
    context 'no fake searched id' do
      before do
        request.env['HTTP_REFERER'] = 'where_i_came_from'
        put :find, params: { fake_searched_id: '' }
      end
      it { is_expected.to set_flash[:alert] }
      it_behaves_like 'redirected request'
    end
    context 'no searched id' do
      context 'user found' do
        let!(:username) { 'sky3' }
        let!(:user) { FactoryGirl.build_stubbed(:user, username: username) }
        before do
          allow_any_instance_of(described_class).to \
            receive(:get_autocomplete_items).with(term: username)
                                            .and_return([user])
          put :find, params: { fake_searched_id: username, searched_id: '' }
        end
        it 'redirects to found user' 

      end
      context 'user not found' do
        before do
          request.env['HTTP_REFERER'] = 'where_i_came_from'
          put :find, params: { fake_searched_id: 'sky3', searched_id: '' }
        end
        it { is_expected.to set_flash[:alert] }
        it_behaves_like 'redirected request'
      end
    end
    context 'with searched id' do
      let!(:username) { 'sky3' }
      let!(:user) { FactoryGirl.build_stubbed(:user, username: username) }
      before do
        allow(User).to receive(:find).with(user.id.to_s).and_return(user)
        put :find, params: { fake_searched_id: username, searched_id: user.id }
      end
      it 'redirects to found user' 

    end
  end
end


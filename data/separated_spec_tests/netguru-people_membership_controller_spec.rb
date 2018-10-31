require 'spec_helper'

describe MembershipsController do
  let(:admin_user) { create(:user, :admin) }

  before do
    sign_in(admin_user)

    @request.env['HTTP_REFERER'] = memberships_path
  end

  describe '#index' do
    render_views

    let!(:user) { create(:user, first_name: 'Tomek') }
    let!(:project) { create(:project, name: 'hrguru') }
    let!(:role_1) { create(:role, name: 'junior1') }
    let!(:role_2) { create(:role, name: 'junior2') }

    before do
      create(:membership, user: user, project: project, role: role_1)
      create(:membership, role: role_2)
    end

    it 'responds successfully with an HTTP 200 status code' 


    it 'exposes memberships' 


    it 'displays memberships on view' 

  end

  describe '#new' do
    before { get :new }

    it 'responds successfully with an HTTP 200 status code' 


    it 'exposes new membership' 

  end

  describe '#create' do
    let(:params) do
      attrs = build(:membership).attributes.except('_id')
      attrs.each { |key, value| attrs[key] = value.to_s }
      attrs
    end

    context 'with valid attributes' do
      it 'creates a new membership' 

    end

    context 'with invalid attributes' do
      it 'does not save' 

    end

    context 'params starts_at Date picker' do
      it 'saves ends_at value as end of day' 

    end

    describe 'json format' do
      render_views
      subject { response }

      context 'valid params' do
        before { post :create, membership: params, format: :json }

        its(:status) { should be 200 }

        it 'returns json' 

      end

      context 'invalid params' do
        let(:invalid_params) do
          params[:ends_at] = (Time.parse(params['starts_at']) - 1.day).to_s
          params
        end
        before { post :create, membership: invalid_params, format: :json }

        its(:status) { should be 400 }

        it 'returns error messages' 

      end
    end
  end

  describe '#destroy' do
    let!(:membership) { create(:membership) }

    it 'deletes the membership' 

  end

  describe '#update' do
    let!(:membership) { create(:membership, starts_at: Time.new(2002, 10, 1, 15, 2), ends_at: Time.new(2002, 10, 28, 15, 2)) }

    it 'exposes membership' 


    context 'valid attributes' do
      it "changes membership's range" 

    end

    context 'invalid attributes' do
      it "does not change membership's attributes" 

    end

    context 'params starts_at Date picker' do
      it 'saves ends_at value as end of day' 

    end

    describe 'json format' do
      render_views
      subject { response }
      before { put :update, id: membership, membership: params, format: :json }

      context 'valid params' do
        let(:params) { { ends_at: Date.new(2002, 10, 26).to_s } }

        its(:status) { should be 200 }

        it 'returns json' 

      end

      context 'invalid params' do
        let(:params) { { ends_at: Time.new(2001, 10, 26, 15, 2).to_s } }

        its(:status) { should be 400 }

        it 'returns json' 

      end
    end
  end
end


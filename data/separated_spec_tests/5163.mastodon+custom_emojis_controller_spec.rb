require 'rails_helper'

describe Admin::CustomEmojisController do
  render_views

  let(:user) { Fabricate(:user, admin: true) }

  before do
    sign_in user, scope: :user
  end

  describe 'GET #index' do
    subject { get :index }

    before do
      Fabricate(:custom_emoji)
    end

    it 'renders index page' 

  end

  describe 'GET #new' do
    subject { get :new }

    it 'renders new page' 

  end

  describe 'POST #create' do
    subject { post :create, params: { custom_emoji: params } }

    let(:image) { fixture_file_upload(Rails.root.join('spec', 'fixtures', 'files', 'emojo.png'), 'image/png') }

    context 'when parameter is valid' do
      let(:params) { { shortcode: 'test', image: image } }

      it 'creates custom emoji' 

    end

    context 'when parameter is invalid' do
      let(:params) { { shortcode: 't', image: image } }

      it 'renders new' 

    end
  end

  describe 'PUT #update' do
    let(:custom_emoji) { Fabricate(:custom_emoji, shortcode: 'test') }
    let(:image) { fixture_file_upload(Rails.root.join('spec', 'fixtures', 'files', 'emojo.png'), 'image/png') }

    before do
      put :update, params: { id: custom_emoji.id, custom_emoji: params }
    end

    context 'when parameter is valid' do
      let(:params) { { shortcode: 'updated', image: image } }

      it 'succeeds in updating custom emoji' 

    end

    context 'when parameter is invalid' do
      let(:params) { { shortcode: 'u', image: image } }

      it 'fails to update custom emoji' 

    end
  end

  describe 'POST #copy' do
    subject { post :copy, params: { id: custom_emoji.id } }

    let(:custom_emoji) { Fabricate(:custom_emoji, shortcode: 'test') }

    it 'copies custom emoji' 

  end

  describe 'POST #enable' do
    let(:custom_emoji) { Fabricate(:custom_emoji, shortcode: 'test', disabled: true) }

    before { post :enable, params: { id: custom_emoji.id } }

    it 'enables custom emoji' 

  end

  describe 'POST #disable' do
    let(:custom_emoji) { Fabricate(:custom_emoji, shortcode: 'test', disabled: false) }

    before { post :disable, params: { id: custom_emoji.id } }

    it 'enables custom emoji' 

  end
end


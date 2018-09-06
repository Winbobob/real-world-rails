require 'spec_helper'

module Spree
  module Admin
    class DummyModelsController < Spree::Admin::ResourceController
      prepend_view_path('spec/test_views')

      def model_class
        Spree::DummyModel
      end
    end
  end
end

describe Spree::Admin::DummyModelsController, type: :controller do
  stub_authorization!

  after(:all) do
    Rails.application.reload_routes!
  end

  before do
    Spree::Core::Engine.routes.draw do
      namespace :admin do
        resources :dummy_models do
          post :update_positions, on: :member
        end
      end
    end
  end

  describe '#new' do
    subject do
      spree_get :new
    end

    it 'succeeds' 

  end

  describe '#edit' do
    subject do
      spree_get :edit, id: dummy_model.to_param
    end

    let(:dummy_model) { Spree::DummyModel.create!(name: 'a dummy_model') }

    it 'succeeds' 

  end

  describe '#create' do
    subject { spree_post :create, params }

    let(:params) do
      { dummy_model: { name: 'a dummy_model' } }
    end

    it 'creates the resource' 


    context 'without any parameters' do
      let(:params) { {} }

      before do
        allow_any_instance_of(Spree::DummyModel).to receive(:name).and_return('some name')
      end

      it 'creates the resource' 

    end
  end

  describe '#update' do
    subject { spree_put :update, params }

    let(:dummy_model) { Spree::DummyModel.create!(name: 'a dummy_model') }

    let(:params) do
      {
        id: dummy_model.to_param,
        dummy_model: { name: 'dummy_model renamed' }
      }
    end

    it 'updates the resource' 

  end

  describe '#destroy' do
    subject do
      spree_delete :destroy, params
    end

    let!(:dummy_model) { Spree::DummyModel.create!(name: 'a dummy_model') }
    let(:params) { { id: dummy_model.id } }

    it 'destroys the resource' 

  end

  describe '#update_positions' do
    subject do
      spree_post :update_positions, id: dummy_model_1.to_param,
                                    positions: { dummy_model_1.id => '2', dummy_model_2.id => '1' }, format: 'js'
    end

    let(:dummy_model_1) { Spree::DummyModel.create!(name: 'dummy_model 1', position: 1) }
    let(:dummy_model_2) { Spree::DummyModel.create!(name: 'dummy_model 2', position: 2) }

    it 'updates the position of dummy_model 1' 


    it 'updates the position of dummy_model 2' 


    it 'touches updated_at' 

  end
end

module Spree
  module Submodule
    class Post < Spree::Base
    end
  end
  module Admin
    module Submodule
      class PostsController < Spree::Admin::ResourceController
        prepend_view_path('spec/test_views')

        def model_class
          Spree::Submodule::Post
        end
      end
    end
  end
end


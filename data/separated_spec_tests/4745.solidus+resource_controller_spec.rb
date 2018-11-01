# frozen_string_literal: true

require 'spec_helper'

module Spree
  module Admin
    class WidgetsController < Spree::Admin::ResourceController
      prepend_view_path('spec/test_views')

      def model_class
        Widget
      end
    end
  end
end

describe Spree::Admin::WidgetsController, type: :controller do
  stub_authorization!

  after(:all) do
    # Spree::Core::Engine.routes.reload_routes!
    Rails.application.reload_routes!
  end

  with_model 'Widget', scope: :all do
    table do |t|
      t.string :name
      t.integer :position
      t.timestamps null: false
    end

    model do
      acts_as_list
      validates :name, presence: true
    end
  end

  before do
    Spree::Core::Engine.routes.draw do
      namespace :admin do
        resources :widgets do
          post :update_positions, on: :member
        end
      end
    end
  end

  describe '#new' do
    subject do
      get :new
    end

    it 'succeeds' 

  end

  describe '#edit' do
    let(:widget) { Widget.create!(name: 'a widget') }

    subject do
      get :edit, params: { id: widget.to_param }
    end

    it 'succeeds' 

  end

  describe '#create' do
    let(:params) do
      { widget: { name: 'a widget' } }
    end

    subject { post :create, params: params }

    it 'creates the resource' 


    context 'failure' do
      let(:params) do
        { widget: { name: '' } } # blank name generates an error
      end

      it 'sets a flash error' 

    end

    context 'without any parameters' do
      let(:params) { {} }

      before do
        allow_any_instance_of(Widget).to receive(:name).and_return('some name')
      end

      it 'creates the resource' 

    end
  end

  describe '#update' do
    let(:widget) { Widget.create!(name: 'a widget') }

    let(:params) do
      {
        id: widget.to_param,
        widget: { name: 'widget renamed' }
      }
    end

    subject { put :update, params: params }

    it 'updates the resource' 


    context 'failure' do
      let(:params) do
        {
          id: widget.to_param,
          widget: { name: '' }, # a blank name will trigger a validation error
        }
      end

      it 'sets a flash error' 

    end
  end

  describe '#destroy' do
    let!(:widget) { Widget.create!(name: 'a widget') }
    let(:params) { { id: widget.id } }

    subject {
      delete :destroy, params: params
    }

    it 'destroys the resource' 

  end

  describe '#update_positions' do
    let(:widget_1) { Widget.create!(name: 'widget 1', position: 1) }
    let(:widget_2) { Widget.create!(name: 'widget 2', position: 2) }

    subject do
      post :update_positions, params: { id: widget_1.to_param,
        positions: { widget_1.id => '2', widget_2.id => '1' }, format: 'js' }
    end

    it 'updates the position of widget 1' 


    it 'updates the position of widget 2' 

  end
end


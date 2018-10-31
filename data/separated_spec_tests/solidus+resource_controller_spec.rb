# frozen_string_literal: true

require 'spec_helper'

module Spree
  module Api
    class WidgetsController < Spree::Api::ResourceController
      prepend_view_path('spec/test_views')

      def model_class
        Widget
      end

      def permitted_widget_attributes
        [:name]
      end
    end
  end

  describe Api::WidgetsController, type: :controller do
    render_views

    after(:all) do
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
        namespace :api do
          resources :widgets
        end
      end
    end

    let(:user) { create(:user, :with_api_key) }
    let(:admin_user) { create(:admin_user, :with_api_key) }

    describe "#index" do
      let!(:widget) { Widget.create!(name: "a widget") }

      it "returns no widgets" 


      context "it has authorization to read widgets" do
        it "returns widgets" 


        context "specifying ids" do
          let!(:widget2) { Widget.create!(name: "a widget") }

          it "returns both widgets from comma separated string" 


          it "returns both widgets from multiple arguments" 


          it "returns one requested widgets" 


          it "returns no widgets if empty" 

        end
      end
    end

    describe "#show" do
      let(:widget) { Widget.create!(name: "a widget") }

      it "returns not found" 


      context "it has authorization read widgets" do
        it "returns widget details" 

      end
    end

    describe "#new" do
      it "returns unauthorized" 


      context "it is allowed to view a new widget" do
        it "can learn how to create a new widget" 

      end
    end

    describe "#create" do
      it "returns unauthorized" 


      context "it is authorized to create widgets" do
        it "can create a widget" 

      end
    end

    describe "#update" do
      let!(:widget) { Widget.create!(name: "a widget") }
      it "returns unauthorized" 


      context "it is authorized to update widgets" do
        it "can update a widget" 

      end
    end

    describe "#destroy" do
      let!(:widget) { Widget.create!(name: "a widget") }
      it "returns unauthorized" 


      context "it is authorized to destroy widgets" do
        it "can destroy a widget" 

      end
    end
  end
end


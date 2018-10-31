# frozen_string_literal: true

require 'rails_helper'

describe ApplicationController, type: :controller do
  controller do
    def success
      head 200
    end

    def routing_error
      raise ActionController::RoutingError, ''
    end

    def record_not_found
      raise ActiveRecord::RecordNotFound, ''
    end

    def invalid_authenticity_token
      raise ActionController::InvalidAuthenticityToken, ''
    end
  end

  shared_examples 'respond_with_error' do |code|
    it "returns http #{code} for any" 


    it "returns http #{code} for http" 


    it "renders template for http" 

  end

  context 'forgery' do
    subject do
      ActionController::Base.allow_forgery_protection = true
      routes.draw { post 'success' => 'anonymous#success' }
      post 'success'
    end

    include_examples 'respond_with_error', 422
  end

  it "does not force ssl if Rails.env.production? is not 'true'" 


  it "forces ssl if Rails.env.production? is 'true'" 


  describe 'helper_method :current_account' do
    it 'returns nil if not signed in' 


    it 'returns account if signed in' 

  end

  describe 'helper_method :single_user_mode?' do
    it 'returns false if it is in single_user_mode but there is no account' 


    it 'returns false if there is an account but it is not in single_user_mode' 


    it 'returns true if it is in single_user_mode and there is an account' 

  end

  describe 'helper_method :current_theme' do
    it 'returns "default" when theme wasn\'t changed in admin settings' 


    it 'returns instances\'s theme when user is not signed in' 


    it 'returns instances\'s default theme when user didn\'t set theme' 


    it 'returns user\'s theme when it is set' 

  end

  context 'ActionController::RoutingError' do
    subject do
      routes.draw { get 'routing_error' => 'anonymous#routing_error' }
      get 'routing_error'
    end

    include_examples 'respond_with_error', 404
  end

  context 'ActiveRecord::RecordNotFound' do
    subject do
      routes.draw { get 'record_not_found' => 'anonymous#record_not_found' }
      get 'record_not_found'
    end

    include_examples 'respond_with_error', 404
  end

  context 'ActionController::InvalidAuthenticityToken' do
    subject do
      routes.draw { get 'invalid_authenticity_token' => 'anonymous#invalid_authenticity_token' }
      get 'invalid_authenticity_token'
    end

    include_examples 'respond_with_error', 422
  end

  describe 'before_action :store_current_location' do
    it 'stores location for user if it is not devise controller' 


    context do
      controller Devise::SessionsController do
      end

      it 'does not store location for user if it is devise controller' 

    end
  end

  describe 'before_action :check_suspension' do
    before do
      routes.draw { get 'success' => 'anonymous#success' }
    end

    it 'does nothing if not signed in' 


    it 'does nothing if user who signed in is not suspended' 


    it 'returns http 403 if user who signed in is suspended' 

  end

  describe 'raise_not_found' do
    it 'raises error' 

  end

  describe 'require_admin!' do
    controller do
      before_action :require_admin!

      def sucesss
        head 200
      end
    end

    before do
      routes.draw { get 'sucesss' => 'anonymous#sucesss' }
    end

    it 'returns a 403 if current user is not admin' 


    it 'returns a 403 if current user is only a moderator' 


    it 'does nothing if current user is admin' 

  end

  describe 'require_staff!' do
    controller do
      before_action :require_staff!

      def sucesss
        head 200
      end
    end

    before do
      routes.draw { get 'sucesss' => 'anonymous#sucesss' }
    end

    it 'returns a 403 if current user is not admin or moderator' 


    it 'does nothing if current user is moderator' 


    it 'does nothing if current user is admin' 

  end

  describe 'forbidden' do
    controller do
      def route_forbidden
        forbidden
      end
    end

    subject do
      routes.draw { get 'route_forbidden' => 'anonymous#route_forbidden' }
      get 'route_forbidden'
    end

    include_examples 'respond_with_error', 403
  end

  describe 'not_found' do
    controller do
      def route_not_found
        not_found
      end
    end

    subject do
      routes.draw { get 'route_not_found' => 'anonymous#route_not_found' }
      get 'route_not_found'
    end

    include_examples 'respond_with_error', 404
  end

  describe 'gone' do
    controller do
      def route_gone
        gone
      end
    end

    subject do
      routes.draw { get 'route_gone' => 'anonymous#route_gone' }
      get 'route_gone'
    end

    include_examples 'respond_with_error', 410
  end

  describe 'unprocessable_entity' do
    controller do
      def route_unprocessable_entity
        unprocessable_entity
      end
    end

    subject do
      routes.draw { get 'route_unprocessable_entity' => 'anonymous#route_unprocessable_entity' }
      get 'route_unprocessable_entity'
    end

    include_examples 'respond_with_error', 422
  end

  describe 'cache_collection' do
    class C < ApplicationController
      public :cache_collection
    end

    shared_examples 'receives :with_includes' do |fabricator, klass|
      it 'uses raw if it is not an ActiveRecord::Relation' 

    end

    shared_examples 'cacheable' do |fabricator, klass|
      include_examples 'receives :with_includes', fabricator, klass

      it 'calls cache_ids of raw if it is an ActiveRecord::Relation' 

    end

    it 'returns raw unless class responds to :with_includes' 


    context 'Notification' do
      include_examples 'cacheable', :notification, Notification
    end

    context 'Status' do
      include_examples 'cacheable', :status, Status
    end

    context 'StreamEntry' do
      include_examples 'receives :with_includes', :stream_entry, StreamEntry
    end
  end
end


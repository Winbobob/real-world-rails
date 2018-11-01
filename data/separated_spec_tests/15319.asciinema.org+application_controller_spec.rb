require 'rails_helper'

class FakesController < ApplicationController

  def foo
    ensure_authenticated!
  end

  def bar
    raise Pundit::NotAuthorizedError
  end

  def store
    store_location
    render :nothing => true
  end

  def retrieve
    @location = get_stored_location
    @location_again = get_stored_location || 'NOWAI!'
    render :nothing => true
  end
end

describe FakesController do

  before do
    @orig_routes, @routes = @routes, ActionDispatch::Routing::RouteSet.new
    @routes.draw do
      resource :fake do
        get :foo
        get :bar
        get :store
        get :retrieve
      end
    end
  end

  after do
    @routes, @orig_routes = @orig_routes, nil
  end

  describe "action raise unauthorized" do
    it "redirects to login page" 

  end

  context "when action raises Pundit::NotAuthorizedError" do
    it "redirects to /" 

  end

  describe '#store_location / #get_stored_location' do
    it 'stores current request path to be later retrieved' 

  end

  describe '#redirect_back_or_to' do
    context 'when there is no stored location' do
      it 'redirects to given location' 

    end

    context 'when there is stored location' do
      it 'redirects to stored location' 

    end
  end

end


# frozen_string_literal: true

require 'rails_helper'

class FakesController < ApplicationController
  include Spree::Core::ControllerHelpers::Auth
  def index; render plain: 'index'; end
end

RSpec.describe Spree::Core::ControllerHelpers::Auth, type: :controller do
  controller(FakesController) {}

  describe '#current_ability' do
    it 'returns Spree::Ability instance' 

  end

  describe '#redirect_back_or_default' do
    controller(FakesController) do
      def index; redirect_back_or_default('/'); end
    end
    it 'redirects to session url' 

    it 'redirects to default page' 

  end

  describe '#set_guest_token' do
    controller(FakesController) do
      def index
        set_guest_token
        render plain: 'index'
      end
    end
    it 'sends cookie header' 

  end

  describe '#store_location' do
    it 'sets session return url' 

  end

  describe '#try_spree_current_user' do
    it 'calls spree_current_user when define spree_current_user method' 

    it 'calls current_spree_user when define current_spree_user method' 

    it 'returns nil' 

  end
end


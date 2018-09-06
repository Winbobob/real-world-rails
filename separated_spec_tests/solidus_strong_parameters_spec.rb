# frozen_string_literal: true

require 'rails_helper'

class FakesController < ApplicationController
  include Spree::Core::ControllerHelpers::StrongParameters
end

RSpec.describe Spree::Core::ControllerHelpers::StrongParameters, type: :controller do
  controller(FakesController) {}

  describe '#permitted_attributes' do
    it 'returns Spree::PermittedAttributes module' 

  end

  describe '#permitted_payment_attributes' do
    it 'returns Array class' 

  end

  describe '#permitted_checkout_attributes' do
    it 'returns Array class' 

  end

  describe '#permitted_order_attributes' do
    it 'returns Array class' 

  end

  describe '#permitted_product_attributes' do
    it 'returns Array class' 

  end
end


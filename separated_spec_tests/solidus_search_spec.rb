# frozen_string_literal: true

require 'rails_helper'

class FakesController < ApplicationController
  include Spree::Core::ControllerHelpers::Search
end

RSpec.describe Spree::Core::ControllerHelpers::Search, type: :controller do
  controller(FakesController) {}

  describe '#build_searcher' do
    it 'returns Spree::Core::Search::Base instance' 

  end
end


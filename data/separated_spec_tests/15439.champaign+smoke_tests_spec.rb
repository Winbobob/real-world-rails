# frozen_string_literal: true

require 'rails_helper'
require_relative 'shared_examples'

describe 'renderin smoke tests' do
  describe 'campaigns/' do
    include_examples 'view smoke test', :campaign
  end

  describe 'donation_bands/' do
    include_examples 'view smoke test', :donation_band, %i[edit index new]
  end

  describe 'forms/' do
    include_examples 'view smoke test', :form, %i[index new]

    describe 'edit' do
      it 'renders without error' 

    end
  end

  describe 'liquid_layouts/' do
    include_examples 'view smoke test', :liquid_layout
  end

  describe 'liquid_partials/' do
    include_examples 'view smoke test', :liquid_partial
  end

  describe 'pages/' do
    before :each do
      allow(view).to receive(:user_signed_in?).and_return(true)
    end

    include_examples 'view smoke test', :page, %i[new show]

    describe 'edit' do
      it 'renders without error' 

    end

    describe 'index' do
      it 'renders without error' 

    end
  end
end


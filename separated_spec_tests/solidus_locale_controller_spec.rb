# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Spree::LocaleController, type: :controller do
  include_context "fr locale"

  context 'switch_to_locale specified' do
    context "available locale" do
      it 'sets locale and redirects' 

    end

    context "unavailable locale" do
      it 'does not change locale and redirects' 

    end
  end

  context 'locale specified' do
    context "available locale" do
      it 'sets locale and redirects' 

    end

    context "unavailable locale" do
      it 'does not change locale and redirects' 

    end
  end

  context 'both locale and switch_to_locale specified' do
    it 'uses switch_to_locale value' 

  end
end


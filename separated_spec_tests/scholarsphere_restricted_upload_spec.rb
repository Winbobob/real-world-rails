# frozen_string_literal: true

require 'feature_spec_helper'

describe GenericWork, type: :feature do
  include Selectors::Dashboard

  context 'when restricting total upload size' do
    let(:current_user) { create(:user) }

    before do
      Rails.application.config.upload_limit = '30'
      sign_in_with_named_js(:restricted_upload, current_user, disable_animations: true)
      visit('/concern/generic_works/new')
    end

    after { Rails.application.config.upload_limit = '1000000' }

    it 'prevents submitting the form' 

  end
end


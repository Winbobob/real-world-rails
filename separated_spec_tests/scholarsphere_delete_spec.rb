# frozen_string_literal: true

require 'feature_spec_helper'

include Selectors::Dashboard

describe Collection, type: :feature do
  let(:current_user) { create(:user) }
  let(:title) { 'Test Collection Title' }

  before { sign_in_with_js(current_user) }

  describe 'deleting a collection' do
    let!(:collection) { create(:collection, depositor: current_user.login) }

    it 'removes it on my dashboard' 

  end
end


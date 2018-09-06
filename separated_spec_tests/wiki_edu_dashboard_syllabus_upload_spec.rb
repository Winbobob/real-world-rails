# frozen_string_literal: true

require 'rails_helper'

describe 'syllabus upload', type: :feature, js: true do
  let(:trained)    { 1 }
  let(:course)     { create(:course) }
  let(:user)       { create(:admin) }

  before do
    include type: :feature
    include Devise::TestHelpers
    page.current_window.resize_to(1920, 1080)
    stub_oauth_edit
  end

  describe 'non-admin' do
    it 'does not show to syllabus upload' 

  end

  describe 'admin foobar' do
    it 'shows syllabus upload' 

    it 'shows syllabus upload' 

  end
end


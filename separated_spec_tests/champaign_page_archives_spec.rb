# frozen_string_literal: true
require 'rails_helper'

describe 'Page archiving' do
  before do
    login_as(create(:user), scope: :user)
  end

  describe 'POST /page/:id/archive' do
    let!(:page) { create(:page, publish_status: 'published') }

    it 'archives the page' 


    it 'redirects to index page' 

  end

  describe 'DELETE /page/:id/archive' do
    let!(:page) { create(:page, publish_status: 'published') }

    it 'unarchives the page' 


    it 'redirects to index page' 

  end
end


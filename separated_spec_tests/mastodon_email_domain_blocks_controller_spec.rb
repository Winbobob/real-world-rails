# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Admin::EmailDomainBlocksController, type: :controller do
  render_views

  before do
    sign_in Fabricate(:user, admin: true), scope: :user
  end

  describe 'GET #index' do
    around do |example|
      default_per_page = EmailDomainBlock.default_per_page
      EmailDomainBlock.paginates_per 1
      example.run
      EmailDomainBlock.paginates_per default_per_page
    end

    it 'renders email blacks' 

  end

  describe 'GET #new' do
    it 'assigns a new email black' 

  end

  describe 'POST #create' do
    it 'blocks the domain when succeeded to save' 

  end

  describe 'DELETE #destroy' do
    it 'unblocks the domain' 

  end
end


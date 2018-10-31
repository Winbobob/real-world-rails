require 'rails_helper'

RSpec.describe Admin::DomainBlocksController, type: :controller do
  render_views

  before do
    sign_in Fabricate(:user, admin: true), scope: :user
  end

  describe 'GET #index' do
    around do |example|
      default_per_page = DomainBlock.default_per_page
      DomainBlock.paginates_per 1
      example.run
      DomainBlock.paginates_per default_per_page
    end

    it 'renders domain blocks' 

  end

  describe 'GET #new' do
    it 'assigns a new domain block' 

  end

  describe 'GET #show' do
    it 'returns http success' 

  end

  describe 'POST #create' do
    it 'blocks the domain when succeeded to save' 


    it 'renders new when failed to save' 

  end

  describe 'DELETE #destroy' do
    it 'unblocks the domain' 

  end
end


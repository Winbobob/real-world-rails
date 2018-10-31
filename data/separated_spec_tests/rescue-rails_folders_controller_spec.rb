# == Schema Information
#
# Table name: folders
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  locked      :boolean          default(FALSE)
#

require 'rails_helper'

describe FoldersController, type: :controller do
  let!(:admin) { create(:user, :admin) }
  let!(:no_access_user) { create(:user, dl_resources: false) }
  let!(:dl_resources_user) { create(:user, dl_resources: true, dl_locked_resources: false) }

  describe 'GET #index' do
    context 'logged in with standard folder access' do
      before :each do
        allow(controller).to receive(:current_user) { dl_resources_user }
      end

      it 'is successful' 

    end
  end

  describe 'GET #show' do
    context 'logged in with standard folder access' do
      before :each do
        allow(controller).to receive(:current_user) { dl_resources_user }
      end

      it 'is able to view files in standard folders' 


      it 'is NOT able to view files in restricted folders' 

    end

    context 'logged in without any folder access' do
      before :each do
        allow(controller).to receive(:current_user) { no_access_user }
      end
      it 'is NOT able to view files in standard folders' 


      it 'is NOT able to view files in restricted folders' 

    end

    context 'logged in with restricted folder access' do
      before :each do
        allow(controller).to receive(:current_user) { admin }
      end
      it 'is able to view files in standard folders' 

      it 'is able to view files in restricted folders' 

    end
  end

  describe 'GET #new' do
    include_context 'signed in admin'

    it 'is successful' 

  end

  describe 'PUT #update' do
    include_context 'signed in admin'

    let(:folder) { create(:folder) }

    it 'is successful' 

  end

  describe 'POST #create' do
    include_context 'signed in admin'

    it 'is successful' 

  end

  describe 'GET #edit' do
    include_context 'signed in admin'

    let(:folder) { create(:folder) }

    it 'is successful' 

  end

  describe 'DELETE #destroy' do
    include_context 'signed in admin'

    let(:folder) { create(:folder) }

    it 'is successful' 

  end
end


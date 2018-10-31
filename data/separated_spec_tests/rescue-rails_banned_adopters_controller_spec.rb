# == Schema Information
#
# Table name: banned_adopters
#
#  id         :integer          not null, primary key
#  name       :string(100)
#  phone      :string(20)
#  email      :string(100)
#  city       :string(100)
#  state      :string(2)
#  comment    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

describe BannedAdoptersController, type: :controller do
  let!(:admin) { create(:user, :admin) }
  let!(:hacker) { create(:user) }
  let!(:inactive_user) { create(:user, :inactive_user)}

  before :each do
    allow(controller).to receive(:current_user) { admin }
  end

  describe 'GET index' do
    context 'logged in as admin' do
      before :each do
        allow(controller).to receive(:current_user) { admin }
      end

      it 'is successful' 

    end

    context 'logged in as inactive user' do
      before :each do
        allow(controller).to receive(:current_user) { inactive_user }
      end

      it 'is unable to access' 

    end
  end

  describe 'GET show' do
    let(:banned_adopter) { create(:banned_adopter) }

    it 'is successful' 

  end

  describe 'GET new ' do
    it 'is successful' 

  end

  describe 'GET edit' do
    let(:banned_adopter) { create(:banned_adopter) }

    it 'is successful' 

  end

  describe 'POST create' do
    context 'logged in as an admin' do
      it 'is able to create a banned adopter' 

    end

    context 'logged in as normal user' do
      before :each do
        allow(controller).to receive(:current_user) { hacker }
      end

      it 'is unable to create a banned adopter' 

    end
  end

  describe 'PUT update' do
    let(:test_banned_adopter) { create(:banned_adopter, name: 'Joe Smith') }
    let(:request) { -> { put :update, params: { id: test_banned_adopter.id, banned_adopter: attributes_for(:banned_adopter, name: 'Tom Jones') } } }

    context 'logged in as admin' do
      before :each do
        allow(controller).to receive(:current_user) { admin }
      end

      it 'updates the banned adopter name' 

    end

    context 'logged in as normal user' do
      before :each do
        allow(controller).to receive(:current_user) { hacker }
      end

      it 'is unable to modify banned adopter' 

    end
  end
end


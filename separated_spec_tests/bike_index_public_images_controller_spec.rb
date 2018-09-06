require 'spec_helper'

describe PublicImagesController do
  describe 'create' do
    context 'bike' do
      let(:ownership) { FactoryGirl.create(:ownership) }
      let(:bike) { ownership.bike }
      let(:user) { ownership.creator }
      context 'valid owner' do
        it 'creates an image' 

      end
      context 'no user' do
        it 'does not create an image' 

      end
    end
    context 'blog' do
      let(:blog) { FactoryGirl.create(:blog) }
      context 'admin authorized' do
        it 'creates an image' 

      end
      context 'not admin' do
        it 'does not create an image' 

      end
    end
    context 'organization' do
      let(:organization) { FactoryGirl.create(:organization) }
      context 'admin authorized' do
        include_context :logged_in_as_super_admin
        it 'creates an image' 

      end
      context 'not admin' do
        include_context :logged_in_as_user
        it 'does not create an image' 

      end
    end
    context 'mail_snippet' do
      let(:mail_snippet) { FactoryGirl.create(:mail_snippet) }
      context 'admin authorized' do
        include_context :logged_in_as_super_admin
        it 'creates an image' 

      end
      context 'not signed in' do
        it 'does not create an image' 

      end
    end
  end
  describe 'destroy' do
    context 'with owner' do
      it 'allows the destroy of public_image' 

      context 'non owner' do
        it 'rejects the destroy' 

      end
      context 'owner and hidden bike' do
        it 'allows the destroy' 

      end
    end
    context 'with owner' do
      it 'allows a the owner of a public_image to destroy the public_image' 

    end
  end

  describe 'show' do
    it 'renders' 

  end

  describe 'edit' do
    it 'renders' 

  end

  describe 'update' do
    context 'normal update' do
      context 'with owner' do
        it 'updates things and go back to editing the bike' 

      end
      context 'not owner' do
        it 'does not update' 

      end
    end
  end

  describe 'is_private' do
    let(:user) { FactoryGirl.create(:user) }
    let(:bike) { FactoryGirl.create(:bike) }
    context 'with owner' do
      context 'is_private true' do
        it 'marks image private' 

      end
      context 'is_private false' do
        it 'marks bike not private' 

      end
    end
    context 'non owner' do
      it 'does not update' 

    end
  end

  describe 'order' do
    let(:bike) { FactoryGirl.create(:bike) }
    let(:ownership) { FactoryGirl.create(:ownership, bike: bike) }
    let(:user) { ownership.creator }
    let(:other_ownership) { FactoryGirl.create(:ownership) }
    let(:public_image_1) { FactoryGirl.create(:public_image, imageable: bike) }
    let(:public_image_2) { FactoryGirl.create(:public_image, imageable: bike, listing_order: 2) }
    let(:public_image_3) { FactoryGirl.create(:public_image, imageable: bike, listing_order: 3) }
    let(:public_image_other) { FactoryGirl.create(:public_image, imageable: other_ownership.bike, listing_order: 0) }

    it 'updates the listing order' 

  end
end


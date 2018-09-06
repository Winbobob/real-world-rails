require 'spec_helper'

module Spree
  describe Api::V1::ImagesController, type: :controller do
    render_views

    let!(:product) { create(:product) }
    let!(:attributes) do
      [:id, :position, :attachment_content_type,
       :attachment_file_name, :type, :attachment_updated_at, :attachment_width,
       :attachment_height, :alt]
    end

    before do
      stub_authentication!
    end

    context 'as an admin' do
      sign_in_as_admin!

      it 'can learn how to create a new image' 


      it 'can upload a new image for a variant' 


      it "can't upload a new image for a variant without attachment" 


      context 'working with an existing image' do
        let!(:product_image) { product.master.images.create!(attachment: image('thinking-cat.jpg')) }

        it 'can get a single product image' 


        it 'can get a single variant image' 


        it 'can get a list of product images' 


        it 'can get a list of variant images' 


        it 'can update image data' 


        it "can't update an image without attachment" 


        it 'can delete an image' 

      end
    end

    context 'as a non-admin' do
      it 'cannot create an image' 


      it 'cannot update an image' 


      it 'cannot delete an image' 

    end
  end
end


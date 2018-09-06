require 'spec_helper'
require 'spree/api/testing_support/helpers'

module Api
  describe ProductImagesController, type: :controller do
    include AuthenticationWorkflow
    render_views

    describe "uploading an image" do
      before do
        allow(controller).to receive(:spree_current_user) { current_api_user }
      end

      image_path = File.open(Rails.root.join('app', 'assets', 'images', 'logo-black.png'))
      let(:image) { Rack::Test::UploadedFile.new(image_path, 'image/png') }
      let!(:product_without_image) { create(:product) }
      let!(:product_with_image) { create(:product_with_image) }

      sign_in_as_admin!

      it "saves a new image when none is present" 


      it "updates an existing product image" 

    end
  end
end


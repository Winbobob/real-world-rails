require "rails_helper"

RSpec.describe "ImageUploads", type: :request do
  describe "POST/image_uploads" do
    let(:user) { create(:user) }
    let(:headers) { { "Content-Type": "application/json", Accept: "application/json" } }
    let(:image) do
      Rack::Test::UploadedFile.new(
        File.join(Rails.root, "spec", "support", "fixtures", "images", "image1.jpeg"),
        "image/jpeg",
      )
    end
    let(:bad_image) do
      Rack::Test::UploadedFile.new(
        File.join(Rails.root, "spec", "support", "fixtures", "images", "bad-image.jpg"),
        "image/jpeg",
      )
    end

    context "when not logged-in" do
      it "responds with 401" 

    end

    context "when logged-in" do
      before do
        sign_in user
      end

      it "returns json" 


      it "provides a link" 


      it "prevents image with resolutions larger than 4096x4096" 

    end
  end
end


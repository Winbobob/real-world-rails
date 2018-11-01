require "spec_helper"

describe Api::Admin::EnterpriseSerializer do
  let(:enterprise) { create(:distributor_enterprise) }
  it "serializes an enterprise" 


  context "for logo" do
    let(:enterprise) { create(:distributor_enterprise, logo: image) }

    context "when there is a logo" do
      let(:image) do
        image_path = File.open(Rails.root.join("app", "assets", "images", "logo-black.png"))
        Rack::Test::UploadedFile.new(image_path, "image/png")
      end

      it "includes URLs of image versions" 

    end

    context "when there is no logo" do
      let(:image) { nil }

      it "includes URLs of image versions" 

    end
  end

  context "for promo image" do
    let(:enterprise) { create(:distributor_enterprise, promo_image: image) }

    context "when there is a promo image" do
      let(:image) do
        image_path = File.open(Rails.root.join("app", "assets", "images", "logo-black.png"))
        Rack::Test::UploadedFile.new(image_path, "image/png")
      end

      it "includes URLs of image versions" 

    end

    context "when there is no promo image" do
      let(:image) { nil }

      it "includes URLs of image versions" 

    end
  end
end


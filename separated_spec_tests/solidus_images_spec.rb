# frozen_string_literal: true

require 'spec_helper'

describe "Product Images", type: :feature do
  stub_authorization!

  let(:file_path) { Rails.root + "../../spec/support/ror_ringer.jpeg" }
  let(:product)   { create(:product) }

  before do
    # Ensure attachment style keys are symbolized before running all tests
    # Otherwise this would result in this error:
    # undefined method `processors' for \"48x48>\
    Spree::Image.attachment_definitions[:attachment][:styles].symbolize_keys!
  end

  context "uploading, editing, and deleting an image", js: true do
    it "should allow an admin to upload and edit an image for a product" 

  end

  it "should not see variant column when product has no variants" 

end


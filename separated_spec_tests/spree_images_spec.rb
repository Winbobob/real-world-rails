require 'spec_helper'

describe 'Product Images', type: :feature, js: true do
  stub_authorization!

  let(:file_path) { Rails.root + '../../spec/support/ror_ringer.jpeg' }

  before do
    # Ensure attachment style keys are symbolized before running all tests
    # Otherwise this would result in this error:
    # undefined method `processors' for \"48x48>\
    Spree::Image.attachment_definitions[:attachment][:styles].symbolize_keys!
  end

  context 'uploading, editing, and deleting an image' do
    it 'allows an admin to upload and edit an image for a product' 

  end

  # Regression test for #2228
  it 'sees variant images', js: false do
    variant = create(:variant)
    variant.images.create!(attachment: File.open(file_path))
    visit spree.admin_product_images_path(variant.product)

    expect(page).not_to have_content('No Images Found.')
    within('table.table') do
      expect(page).to have_content(variant.options_text)

      # ensure no duplicate images are displayed
      expect(page).to have_css('tbody tr', count: 1)

      # ensure variant header is displayed
      within('thead') do
        expect(page.body).to have_content('Variant')
      end

      # ensure variant header is displayed
      within('tbody') do
        expect(page).to have_content('Size: S')
      end
    end
  end

  it 'does not see variant column when product has no variants', js: false do
    product = create(:product)
    product.images.create!(attachment: File.open(file_path))
    visit spree.admin_product_images_path(product)

    expect(page).not_to have_content('No Images Found.')
    within('table.table') do
      # ensure no duplicate images are displayed
      expect(page).to have_css('tbody tr', count: 1)

      # ensure variant header is not displayed
      within('thead') do
        expect(page).not_to have_content('Variant')
      end

      # ensure correct cell count
      expect(page).to have_css('thead th', count: 3)
    end
  end
end


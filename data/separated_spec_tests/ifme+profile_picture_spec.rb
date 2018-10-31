# frozen_string_literal: true

COMPONENT_NAME = 'Avatar'
ALT = 'Profile picture'
LOCAL_ASSET = '/assets/contributors/ABC123.jpg'
CLOUDINARY_HOST = 'res.cloudinary.com'
CLOUDINARY_ASSET_ID = 'XYZ789'
CLOUDINARY_ASSET_URL = "https://#{CLOUDINARY_HOST}/image/upload/#{CLOUDINARY_ASSET_ID}.jpg"
OPTIONS = { large: true, alt: 'Hello' }.freeze

describe ProfilePicture do
  subject { described_class }

  describe '#fetch' do
    context 'has no options' do
      it 'returns HTML with class name and same URL for local portraits '\
      'in development environment' do
        rendered = subject.fetch(LOCAL_ASSET)
        expect(rendered).to have_tag('script', with: { 'data-component-name': COMPONENT_NAME })
        expect(rendered).to include('"alt":"' + ALT + '"')
        expect(rendered).to include(LOCAL_ASSET)
        expect(rendered).not_to include(CLOUDINARY_HOST)
      end

      it 'returns HTML with class name and Cloudinary URL for local portraits '\
      'in production environment' do
        allow(Rails).to receive(:env) { 'production'.inquiry }
        rendered = subject.fetch(LOCAL_ASSET)
        expect(rendered).to have_tag('script', with: { 'data-component-name': COMPONENT_NAME })
        expect(rendered).to include('"alt":"' + ALT + '"')
        expect(rendered).to include(LOCAL_ASSET)
        expect(rendered).to include(CLOUDINARY_HOST)
      end

      it 'returns HTML with class name and Cloudinary URL for Cloudinary-stored'\
      'portraits' do
        rendered = subject.fetch(CLOUDINARY_ASSET_URL)
        expect(rendered).to have_tag('script', with: { 'data-component-name': COMPONENT_NAME })
        expect(rendered).to include('"alt":"' + ALT + '"')
        expect(rendered).to include(CLOUDINARY_ASSET_ID)
        expect(rendered).to include(CLOUDINARY_HOST)
      end
    end

    context 'has options' do
      it 'returns HTML with class name and same URL for local portraits '\
      'in development environment' do
        rendered = subject.fetch(LOCAL_ASSET, OPTIONS)
        expect(rendered).to have_tag('script', with: { 'data-component-name': COMPONENT_NAME })
        expect(rendered).to include('"alt":"' + OPTIONS[:alt] + '"')
        expect(rendered).to include('"large":true')
        expect(rendered).to include(LOCAL_ASSET)
        expect(rendered).not_to include(CLOUDINARY_HOST)
      end

      it 'returns HTML with class name and Cloudinary URL for local portraits '\
      'in production environment' do
        allow(Rails).to receive(:env) { 'production'.inquiry }
        rendered = subject.fetch(LOCAL_ASSET, OPTIONS)
        expect(rendered).to have_tag('script', with: { 'data-component-name': COMPONENT_NAME })
        expect(rendered).to include('"alt":"' + OPTIONS[:alt] + '"')
        expect(rendered).to include('"large":true')
        expect(rendered).to include(LOCAL_ASSET)
        expect(rendered).to include(CLOUDINARY_HOST)
      end

      it 'returns HTML with class name and Cloudinary URL for Cloudinary-stored'\
      'portraits' do
        rendered = subject.fetch(CLOUDINARY_ASSET_URL, OPTIONS)
        expect(rendered).to have_tag('script', with: { 'data-component-name': COMPONENT_NAME })
        expect(rendered).to include('"alt":"' + OPTIONS[:alt] + '"')
        expect(rendered).to include('"large":true')
        expect(rendered).to include(CLOUDINARY_ASSET_ID)
        expect(rendered).to include(CLOUDINARY_HOST)
      end
    end
  end

  describe '#normalize_url' do
    it 'URL for local portraits in development environment' 


    it 'Cloudinary URL for local portraits in production environment' 


    it 'Cloudinary URL for Cloudinary-stored portraits' 

  end

  describe '#cloudinary_src' do
    it 'returns true for Cloudinary URL' 


    it 'returns false for non-Cloudinary URL' 

  end

  describe '#get_cloudinary_image_id' do
    it 'returns id for a Cloudinary URL' 

  end
end


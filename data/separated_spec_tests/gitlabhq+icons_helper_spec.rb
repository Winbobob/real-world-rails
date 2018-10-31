require 'spec_helper'

describe IconsHelper do
  let(:icons_path) { ActionController::Base.helpers.image_path("icons.svg") }

  describe 'icon' do
    it 'returns aria-hidden by default' 


    it 'does not return aria-hidden if aria-label is set' 

  end

  describe 'sprite_icon_path' do
    it 'returns relative path' 


    context 'when an asset_host is set in the config it will return an absolute local URL' do
      let(:asset_host) { 'http://assets' }

      before do
        allow(ActionController::Base).to receive(:asset_host).and_return(asset_host)
      end

      it 'returns an absolute URL on that asset host' 

    end
  end

  describe 'sprite_icon' do
    icon_name = 'clock'

    it 'returns svg icon html' 


    it 'returns svg icon html + size classes' 


    it 'returns svg icon html + size classes + additional class' 


    describe 'non existing icon' do
      non_existing = 'non_existing_icon_sprite'

      it 'should raise in development mode' 


      it 'should raise in test mode' 


      it 'should not raise in production mode' 

    end
  end

  describe 'audit icon' do
    it 'returns right icon name for standard auth' 


    it 'returns right icon name for two-factor auth' 


    it 'returns right icon name for google_oauth2 auth' 

  end

  describe 'file_type_icon_class' do
    it 'returns folder class' 


    it 'returns share class' 


    it 'returns file-pdf-o class with .pdf' 


    it 'returns file-image-o class with .jpg' 


    it 'returns file-image-o class with .JPG' 


    it 'returns file-image-o class with .png' 


    it 'returns file-archive-o class with .tar' 


    it 'returns file-archive-o class with .TAR' 


    it 'returns file-archive-o class with .tar.gz' 


    it 'returns file-audio-o class with .mp3' 


    it 'returns file-audio-o class with .MP3' 


    it 'returns file-audio-o class with .wav' 


    it 'returns file-video-o class with .avi' 


    it 'returns file-video-o class with .AVI' 


    it 'returns file-video-o class with .mp4' 


    it 'returns file-word-o class with .doc' 


    it 'returns file-word-o class with .DOC' 


    it 'returns file-word-o class with .docx' 


    it 'returns file-excel-o class with .xls' 


    it 'returns file-excel-o class with .XLS' 


    it 'returns file-excel-o class with .xlsx' 


    it 'returns file-excel-o class with .ppt' 


    it 'returns file-excel-o class with .PPT' 


    it 'returns file-excel-o class with .pptx' 


    it 'returns file-text-o class with .unknow' 


    it 'returns file-text-o class with no extension' 

  end

  describe '#external_snippet_icon' do
    it 'returns external snippet icon' 

  end
end


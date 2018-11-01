# frozen_string_literal: true

#   Copyright (c) 2010, Diaspora Inc.  This file is
#   licensed under the Affero General Public License version 3 or later.  See
#   the COPYRIGHT file.

describe Diaspora::Camo do
  before do
    AppConfig.privacy.camo.root = 'http://localhost:3000/camo/'
    AppConfig.privacy.camo.key = 'kittenpower'

    @raw_image_url = 'http://example.com/kitten.jpg'
    @camo_image_url = AppConfig.privacy.camo.root + '5bc5b9d7ebd202841ab0667c4fc8d4304278f902/687474703a2f2f6578616d706c652e636f6d2f6b697474656e2e6a7067'
  end

  describe '#image_url' do
    it 'should not rewrite local URLs' 


    it 'should not rewrite relative URLs' 


    it 'should not rewrite already camo-fied URLs' 


    it 'should rewrite external URLs' 


    context "URL encoding" do
      let(:camo_image_url) {
        AppConfig.privacy.camo.root +
          "bbafe590034b976852f9a46dbcc7709e1a8e7dfb/68747470733a2f2f6578616d706c652e636f6d2f2543332541312543332541392" \
          "543332542333f666f6f3d254333254134254333254243254333254236266261723d61254343253830"
      }

      it "should encode URLs before sending to camo" 


      it "should not double encode already encoded URLs" 

    end
  end

  describe '#from_markdown' do
    it 'should rewrite plain markdown images' 


    it 'should rewrite markdown images with alt texts' 


    it 'should rewrite markdown images with title texts' 


    it 'should rewrite URLs inside <img/> tags' 

  end
end


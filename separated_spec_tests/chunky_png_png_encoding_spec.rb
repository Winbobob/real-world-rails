require 'spec_helper'

describe ChunkyPNG::Canvas::PNGEncoding do
  include ChunkyPNG::Canvas::PNGEncoding

  context 'determining encoding options' do
    [:indexed, :grayscale, :grayscale_alpha, :truecolor, :truecolor_alpha].each do |color_mode_name|
      it "should encode an image with color mode #{color_mode_name} correctly" 

    end

    it "should encode an image with 2 colors using 1-bit indexed color mode" 


    it "should encode an image with 4 colors using 2-bit indexed color mode" 


    it "should encode an image with 16 colors using 4-bit indexed color mode" 


    it "should encode an image with 256 colors using 8-bit indexed color mode" 


    it "should use a higher bit depth than necessary if requested" 


    it "should encode an image with interlacing correctly" 


    it "should save an image using the normal routine correctly" 


    it "should save an image using the :fast_rgba routine correctly" 


    it "should save an image using the :good_compression routine correctly" 


    it "should save an image using the :best_compression routine correctly" 


    it "should save an image with black and white only if requested" 

  end

  describe 'different color modes and bit depths' do
    before do
      @canvas = ChunkyPNG::Canvas.new(2, 2)

      @canvas[0, 0] = ChunkyPNG::Color.rgba(  1,   2,   3,   4)
      @canvas[1, 0] = ChunkyPNG::Color.rgba(252, 253, 254, 255)
      @canvas[0, 1] = ChunkyPNG::Color.rgba(255, 254, 253, 252)
      @canvas[1, 1] = ChunkyPNG::Color.rgba(  4,   3,   2,   1)

      @canvas.encoding_palette = @canvas.palette
      @canvas.encoding_palette.to_plte_chunk
    end

    it "should encode using 8-bit RGBA mode correctly" 


    it "should encode using 8 bit RGB mode correctly" 


    it "should encode using 1-bit grayscale mode correctly" 


    it "should encode using 2-bit grayscale mode correctly" 


    it "should encode using 4-bit grayscale mode correctly" 


    it "should encode using 8-bit grayscale mode correctly" 


    it "should not encode using 1-bit indexed mode because the image has too many colors" 


    it "should encode using 2-bit indexed mode correctly" 


    it "should encode using 4-bit indexed mode correctly" 


    it "should encode using 8-bit indexed mode correctly" 

  end

  describe 'different filter methods' do

    it "should encode a scanline without filtering correctly" 


    it "should encode a scanline with sub filtering correctly" 


    it "should encode a scanline with up filtering correctly" 


    it "should encode a scanline with average filtering correctly" 


    it "should encode a scanline with paeth filtering correctly" 

  end
end

